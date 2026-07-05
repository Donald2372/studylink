import { Router } from 'express';
import multer from 'multer';
import { query, pool } from '../db.js';
import { uploadBuffer } from '../storage.js';

const router = Router();
const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 50 * 1024 * 1024 },
});

async function assertContact(userId, otherId) {
  const result = await query(
    `SELECT 1
     FROM bookings b
     JOIN tutor_profiles tp ON tp.id = b.tutor_id
     WHERE (b.student_id = $1 AND tp.user_id = $2) OR (b.student_id = $2 AND tp.user_id = $1)
     LIMIT 1`,
    [userId, otherId]
  );
  return result.rows.length > 0;
}

router.get('/contacts', async (req, res) => {
  try {
    const userId = req.user.id;
    const contactsResult = await query(
      `SELECT DISTINCT other.id, other.full_name, other.avatar_url, other.role
       FROM bookings b
       JOIN tutor_profiles tp ON tp.id = b.tutor_id
       JOIN users other ON (
         (other.id = b.student_id AND tp.user_id = $1) OR
         (other.id = tp.user_id AND b.student_id = $1)
       )
       WHERE b.student_id = $1 OR tp.user_id = $1`,
      [userId]
    );

    const contacts = [];
    for (const contact of contactsResult.rows) {
      const lastMsg = await query(
        `SELECT m.content, m.created_at, m.sender_id,
          EXISTS(SELECT 1 FROM message_attachments a WHERE a.message_id=m.id) AS has_attachment
         FROM messages m
         WHERE (m.sender_id = $1 AND m.recipient_id = $2) OR (m.sender_id = $2 AND m.recipient_id = $1)
         ORDER BY m.created_at DESC LIMIT 1`,
        [userId, contact.id]
      );
      const unread = await query(
        `SELECT COUNT(*) FROM messages WHERE sender_id = $1 AND recipient_id = $2 AND read_at IS NULL`,
        [contact.id, userId]
      );
      const last = lastMsg.rows[0] || null;
      if (last?.has_attachment && !last.content) last.content = '📎 Document envoyé';
      contacts.push({ ...contact, lastMessage: last, unreadCount: parseInt(unread.rows[0].count, 10) });
    }
    contacts.sort((a, b) => {
      const ta = a.lastMessage ? new Date(a.lastMessage.created_at).getTime() : 0;
      const tb = b.lastMessage ? new Date(b.lastMessage.created_at).getTime() : 0;
      return tb - ta;
    });
    res.json({ contacts });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement des contacts.' });
  }
});

router.get('/unread-count', async (req, res) => {
  try {
    const result = await query(`SELECT COUNT(*) FROM messages WHERE recipient_id = $1 AND read_at IS NULL`, [req.user.id]);
    res.json({ count: parseInt(result.rows[0].count, 10) });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du comptage des messages.' });
  }
});

router.get('/thread/:userId', async (req, res) => {
  try {
    const otherId = req.params.userId;
    const isContact = await assertContact(req.user.id, otherId);
    if (!isContact) return res.status(403).json({ error: "Vous n'avez pas de session en commun avec cette personne." });

    const messages = await query(
      `SELECT m.id, m.sender_id, m.recipient_id, m.content, m.read_at, m.created_at,
        COALESCE((
          SELECT json_agg(json_build_object(
            'id',a.id,'file_name',a.file_name,'file_url',a.file_url,
            'mime_type',a.mime_type,'file_size_bytes',a.file_size_bytes
          ) ORDER BY a.created_at)
          FROM message_attachments a WHERE a.message_id=m.id
        ), '[]'::json) AS attachments
       FROM messages m
       WHERE (m.sender_id = $1 AND m.recipient_id = $2) OR (m.sender_id = $2 AND m.recipient_id = $1)
       ORDER BY m.created_at ASC`,
      [req.user.id, otherId]
    );
    res.json({ messages: messages.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement de la conversation.' });
  }
});

router.patch('/thread/:userId/read', async (req, res) => {
  try {
    await query(`UPDATE messages SET read_at = now() WHERE sender_id = $1 AND recipient_id = $2 AND read_at IS NULL`, [req.params.userId, req.user.id]);
    res.json({ message: 'Marqué comme lu.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la mise à jour.' });
  }
});

router.post('/', upload.single('file'), async (req, res) => {
  try {
    const recipientId = req.body.recipientId;
    const content = (req.body.content || '').trim();
    if (!recipientId || (!content && !req.file)) return res.status(400).json({ error: 'Ajoutez un message ou un document.' });
    if (recipientId === req.user.id) return res.status(400).json({ error: 'Vous ne pouvez pas vous envoyer un message à vous-même.' });

    const isContact = await assertContact(req.user.id, recipientId);
    if (!isContact) return res.status(403).json({ error: "Vous n'avez pas de session en commun avec cette personne." });

    let attachment = null;
    if (req.file) {
      const stored = await uploadBuffer({
        buffer: req.file.buffer,
        originalName: req.file.originalname,
        mimeType: req.file.mimetype,
        folder: 'messages/attachments',
      });
      attachment = {
        file_name: req.file.originalname,
        file_url: stored.publicUrl,
        mime_type: req.file.mimetype,
        file_size_bytes: req.file.size,
      };
    }

    const client = await pool.connect();
    try {
      await client.query('BEGIN');
      const result = await client.query(
        `INSERT INTO messages (sender_id, recipient_id, content) VALUES ($1, $2, $3) RETURNING *`,
        [req.user.id, recipientId, content]
      );
      const message = result.rows[0];
      let attachments = [];
      if (attachment) {
        const ar = await client.query(
          `INSERT INTO message_attachments(message_id,file_name,file_url,mime_type,file_size_bytes)
           VALUES($1,$2,$3,$4,$5) RETURNING *`,
          [message.id, attachment.file_name, attachment.file_url, attachment.mime_type, attachment.file_size_bytes]
        );
        attachments = ar.rows;
      }
      await client.query('COMMIT');
      res.status(201).json({ message: { ...message, attachments } });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (err) {
    console.error(err);
    res.status(err.status || 500).json({ error: err.message || "Erreur lors de l'envoi du message." });
  }
});

export default router;
