# Studylink — Application complète

Plateforme de mise en relation élèves/tuteurs : recherche filtrée, réservation par
calendrier de disponibilités, et interface de session en visioconférence.

## Structure du projet

```
studylink/
├── backend/          API REST (Node.js + Express + PostgreSQL)
│   ├── migrations/
│   │   └── schema.sql Schéma de base de données
│   └── src/
│       ├── index.js       Point d'entrée du serveur
│       ├── db.js          Connexion PostgreSQL
│       ├── seed.js        Données de démonstration
│       ├── middleware/     Authentification JWT
│       └── routes/         auth, tutors, bookings, subjects, reviews, materials
└── frontend/         Application React (Vite + Tailwind CSS)
    └── src/
        ├── pages/          Home, Login, Register, SearchTutors, TutorProfile,
        │                   Bookings, Materials, Session (visio), Profile
        ├── components/     Navbar, TutorCard, CalendarPicker
        └── context/        AuthContext (gestion du token JWT)
```

## 1. Installation en local

### Prérequis
- Node.js 18+
- Une base PostgreSQL (locale, ou gratuite via [Supabase](https://supabase.com) / [Neon](https://neon.tech))

### Backend

```bash
cd backend
npm install
cp .env.example .env
# Édite .env avec ton DATABASE_URL et un JWT_SECRET aléatoire

# Crée les tables
psql "$DATABASE_URL" -f migrations/schema.sql

# Si ta base existait déjà avant l'ajout de la messagerie, lance aussi une fois :
# psql "$DATABASE_URL" -f migrations/002_add_messages.sql

# Module Catalogue de cours (à lancer une fois) :
# psql "$DATABASE_URL" -f migrations/003_add_courses.sql

# Peuple avec des données de démo (4 tuteurs, 1 élève, mot de passe: password123)
npm run seed

# Peuple le catalogue de cours de démo (à lancer APRÈS npm run seed) :
npm run seed:courses

# Démarre le serveur (http://localhost:4000)
npm run dev
```

### Frontend

```bash
cd frontend
npm install
npm run dev
# Ouvre http://localhost:5173
```

Si ton backend tourne ailleurs qu'en local, crée un fichier `frontend/.env` :
```
VITE_API_URL=https://ton-backend.onrender.com/api
```

## 2. Comptes de démonstration

| Rôle   | Email                        | Mot de passe   |
|--------|-------------------------------|----------------|
| Tuteur | emily.chen@studylink.com     | password123    |
| Tuteur | ranth.thang@studylink.com    | password123    |
| Tuteur | lirn.bren@studylink.com      | password123    |
| Tuteur | sofia.moreau@studylink.com   | password123    |
| Élève  | student@studylink.com        | password123    |

## 3. Déploiement (gratuit ou très peu cher)

**Base de données — [Supabase](https://supabase.com) (gratuit)**
1. Crée un projet Supabase
2. Récupère la "Connection string" (mode "Transaction" ou "Session") dans Project Settings → Database
3. Exécute le contenu de `migrations/schema.sql` dans l'éditeur SQL de Supabase
4. Utilise cette URL comme `DATABASE_URL`

**Backend — [Render](https://render.com) (gratuit avec veille, ~7$/mois pour rester actif)**
1. Crée un "Web Service" pointant vers le dossier `backend/`
2. Build command : `npm install`
3. Start command : `npm start`
4. Ajoute les variables d'environnement (`DATABASE_URL`, `JWT_SECRET`, `FRONTEND_URL`)

**Frontend — [Vercel](https://vercel.com) ou [Netlify](https://netlify.com) (gratuit)**
1. Connecte le dossier `frontend/`
2. Build command : `npm run build` — Output : `dist`
3. Ajoute la variable d'environnement `VITE_API_URL` pointant vers ton backend Render

**Coût total pour démarrer : 0€/mois.** Au-delà d'un usage réel, compte 10-25€/mois
(backend Render payant pour rester actif en permanence).

## 4. Fonctionnalités incluses (MVP)

- ✅ Authentification (inscription/connexion élève ou tuteur, JWT)
- ✅ Recherche de tuteurs avec filtres (matière, niveau, budget, texte libre)
- ✅ Profil tuteur détaillé (bio, tarif, avis, matières enseignées)
- ✅ Calendrier de disponibilité coloré (disponible / réservé / occupé), fidèle à la maquette
- ✅ Réservation transactionnelle (empêche les doubles réservations grâce à un verrou SQL)
- ✅ Liste "Mes réservations" avec annulation
- ✅ Interface de session visio (mute, caméra, chat, partage d'écran — UI complète)
- ✅ Matériel de session (partage de documents/liens par réservation, accessible depuis Réservations, Session et la barre de navigation)
- ✅ Messagerie directe entre élève et tuteur (dès qu'une réservation existe), avec badge de notification non-lus dans la navbar
- ✅ Gestion de profil tuteur (édition + ajout de créneaux)
- ✅ Système d'avis (note + commentaire après une session)

## 5. Prochaines étapes possibles

- **Vraie visioconférence** : intégrer [Daily.co](https://daily.co), [Twilio Video](https://www.twilio.com/video) ou [LiveKit](https://livekit.io) (offrent des SDK simples et un free tier) à la place de l'UI maquette dans `Session.jsx`
- **Paiement** : intégrer Stripe Connect pour reverser automatiquement les tuteurs
- **Notifications** : emails de confirmation/rappel via Resend ou SendGrid
- **Upload de matériel de session** : stockage de fichiers (Supabase Storage ou S3)
