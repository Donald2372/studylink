import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

import authRoutes from './routes/auth.js';
import tutorRoutes from './routes/tutors.js';
import bookingRoutes from './routes/bookings.js';
import subjectRoutes from './routes/subjects.js';
import reviewRoutes from './routes/reviews.js';
import materialRoutes from './routes/materials.js';
import messageRoutes from './routes/messages.js';
import courseRoutes from './routes/courses.js';
import { requireAuth } from './middleware/auth.js';

dotenv.config();

const app = express();

app.use(cors({ origin: process.env.FRONTEND_URL || '*' }));
app.use(express.json());

// Routes publiques
app.use('/api/auth', authRoutes);
app.use('/api/tutors', (req, res, next) => {
  // GET est public (recherche/consultation), le reste nécessite un token
  if (req.method === 'GET') return next();
  return requireAuth(req, res, next);
}, tutorRoutes);
app.use('/api/subjects', subjectRoutes);

// Cours : le catalogue et le détail sont publics ; progression, favoris,
// leçons et "mes cours" exigent un token.
const COURSE_PROTECTED = [/\/progress$/, /\/enroll$/, /\/favorite$/, /^\/lessons\//, /^\/mine\//];
app.use('/api/courses', (req, res, next) => {
  const needsAuth =
    req.method !== 'GET' || COURSE_PROTECTED.some((re) => re.test(req.path));
  if (needsAuth) return requireAuth(req, res, next);
  return next();
}, courseRoutes);

// Routes protégées (token JWT requis)
app.use('/api/bookings', requireAuth, bookingRoutes);
app.use('/api/reviews', requireAuth, reviewRoutes);
app.use('/api/materials', requireAuth, materialRoutes);
app.use('/api/messages', requireAuth, messageRoutes);

app.get('/api/health', (req, res) => res.json({ status: 'ok', time: new Date().toISOString() }));

app.use((req, res) => res.status(404).json({ error: 'Route introuvable.' }));

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`✅ Studylink API démarrée sur http://localhost:${PORT}`);
});
