import crypto from 'crypto';

const CONTENT_BUCKET = process.env.SUPABASE_CONTENT_BUCKET || 'studylink-content';

function requireStorageConfig() {
  const url = process.env.SUPABASE_URL?.replace(/\/$/, '');
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) {
    const error = new Error('Supabase Storage n’est pas configuré. Ajoutez SUPABASE_URL et SUPABASE_SERVICE_ROLE_KEY dans Render.');
    error.status = 503;
    throw error;
  }
  return { url, key };
}

function safeName(name = 'file') {
  const cleaned = name
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-zA-Z0-9._-]+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '');
  return cleaned || 'file';
}

export async function uploadBuffer({ buffer, originalName, mimeType, folder = 'uploads' }) {
  const { url, key } = requireStorageConfig();
  const extName = safeName(originalName);
  const objectPath = `${folder}/${Date.now()}-${crypto.randomUUID()}-${extName}`;
  const endpoint = `${url}/storage/v1/object/${CONTENT_BUCKET}/${objectPath}`;

  const response = await fetch(endpoint, {
    method: 'POST',
    headers: {
      apikey: key,
      Authorization: `Bearer ${key}`,
      'Content-Type': mimeType || 'application/octet-stream',
      'x-upsert': 'false',
    },
    body: buffer,
  });

  if (!response.ok) {
    const details = await response.text().catch(() => '');
    const error = new Error(`Échec de l’envoi vers Supabase Storage (${response.status}). ${details}`);
    error.status = response.status;
    throw error;
  }

  return {
    bucket: CONTENT_BUCKET,
    path: objectPath,
    publicUrl: `${url}/storage/v1/object/public/${CONTENT_BUCKET}/${objectPath}`,
  };
}
