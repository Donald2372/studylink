import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// Récupère la liste des "contacts" : tout utilisateur avec qui on a une réservation
// (passée, présente ou future, peu importe le statut), avec dernier message + non-lus
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
        `SELECT content, created_at, sender_id
         FROM messages
         WHERE (sender_id = $1 AND recipient_id = $2) OR (sender_id = $2 AND recipient_id = $1)
         ORDER BY created_at DESC LIMIT 1`,
        [userId, contact.id]
      );
      const unread = await query(
        `SELECT COUNT(*) FROM messages WHERE sender_id = $1 AND recipient_id = $2 AND read_at IS NULL`,
        [contact.id, userId]
      );
      contacts.push({
        ...contact,
        lastMessage: lastMsg.rows[0] || null,
        unreadCount: parseInt(unread.rows[0].count, 10),
      });
    }

    // Tri : conversations avec le message le plus récent en premier
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

// Nombre total de messages non lus (pour le badge de notification)
router.get('/unread-count', async (req, res) => {
  try {
    const result = await query(
      `SELECT COUNT(*) FROM messages WHERE recipient_id = $1 AND read_at IS NULL`,
      [req.user.id]
    );
    res.json({ count: parseInt(result.rows[0].count, 10) });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du comptage des messages.' });
  }
});

// Vérifie que l'autre utilisateur est bien un contact (a une réservation en commun)
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

// Récupère la conversation complète avec un contact donné
router.get('/thread/:userId', async (req, res) => {
  try {
    const otherId = req.params.userId;
    const isContact = await assertContact(req.user.id, otherId);
    if (!isContact) {
      return res.status(403).json({ error: "Vous n'avez pas de session en commun avec cette personne." });
    }

    const messages = await query(
      `SELECT id, sender_id, recipient_id, content, read_at, created_at
       FROM messages
       WHERE (sender_id = $1 AND recipient_id = $2) OR (sender_id = $2 AND recipient_id = $1)
       ORDER BY created_at ASC`,
      [req.user.id, otherId]
    );

    res.json({ messages: messages.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement de la conversation.' });
  }
});

// Marque les messages reçus de ce contact comme lus
router.patch('/thread/:userId/read', async (req, res) => {
  try {
    await query(
      `UPDATE messages SET read_at = now()
       WHERE sender_id = $1 AND recipient_id = $2 AND read_at IS NULL`,
      [req.params.userId, req.user.id]
    );
    res.json({ message: 'Marqué comme lu.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la mise à jour.' });
  }
});

// Envoie un nouveau message
router.post('/', async (req, res) => {
  try {
    const { recipientId, content } = req.body;
    if (!recipientId || !content || !content.trim()) {
      return res.status(400).json({ error: 'recipientId et content sont requis.' });
    }
    if (recipientId === req.user.id) {
      return res.status(400).json({ error: 'Vous ne pouvez pas vous envoyer un message à vous-même.' });
    }

    const isContact = await assertContact(req.user.id, recipientId);
    if (!isContact) {
      return res.status(403).json({ error: "Vous n'avez pas de session en commun avec cette personne." });
    }

    const result = await query(
      `INSERT INTO messages (sender_id, recipient_id, content) VALUES ($1, $2, $3) RETURNING *`,
      [req.user.id, recipientId, content.trim()]
    );
    res.status(201).json({ message: result.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'envoi du message." });
  }
});

export default router;
