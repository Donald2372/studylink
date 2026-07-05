# StudyLink — version UI complète 2026

Cette version conserve l'architecture existante et les connexions prévues pour le déploiement :

- **Frontend** : React + Vite, prêt pour Vercel
- **Backend** : Node.js + Express, prêt pour Render
- **Base de données** : PostgreSQL, compatible Supabase

## Ce qui a été refait

Le frontend a été entièrement restructuré pour correspondre au nouveau cahier des charges et aux maquettes validées :

- Tableau de bord moderne
- Connexion / inscription
- Recherche de tuteurs
- Profil détaillé d'un tuteur
- Calendrier et réservation
- Liste et détail des sessions
- Interface de visioconférence
- Matériels et documents
- Forum
- Messagerie privée et conversation
- Centre d'alertes
- Catalogue de cours
- Détail d'un cours
- Modules d'un cours
- Leçon vidéo YouTube intégrée dans l'interface
- Tutoriel étape par étape
- Bootcamps et formations
- Préparation aux entretiens d'embauche
- Développement personnel
- Programme « Discipline 30 jours »
- Bibliothèque de livres
- Lecteur de livre intégré
- Entrepreneuriat
- Parcours Business Plan
- Boîte à outils entrepreneur
- Tableau de bord de projet entrepreneurial

## Important sur les données

Les fonctionnalités backend déjà présentes restent connectées à l'API :

- authentification ;
- tuteurs ;
- réservations ;
- documents de session ;
- messagerie ;
- profil tuteur.

Les nouveaux univers (cours complets, développement personnel, livres, entrepreneuriat, bootcamps, carrière) sont déjà **déployables et navigables côté frontend** avec du contenu de démonstration. Ils n'ont pas encore de tables ni d'API de persistance dédiées dans Supabase/Render. L'application peut donc être déployée immédiatement, puis ces contenus peuvent être progressivement reliés à la base sans refaire les écrans.

## Lancer en local

### Backend

```bash
cd backend
npm install
cp .env.example .env
npm run dev
```

### Frontend

```bash
cd frontend
npm install
cp .env.example .env
npm run dev
```

## Variables d'environnement

### Backend Render

```env
DATABASE_URL=postgresql://...
JWT_SECRET=une_cle_secrete_longue
FRONTEND_URL=https://votre-frontend.vercel.app
PORT=4000
```

### Frontend Vercel

```env
VITE_API_URL=https://votre-backend.onrender.com/api
```

## Déploiement Vercel

- Root Directory : `frontend`
- Build Command : `npm run build`
- Output Directory : `dist`
- Variable : `VITE_API_URL`

Le fichier `vercel.json` gère déjà les routes SPA.

## Déploiement Render

- Root Directory : `backend`
- Build Command : `npm install`
- Start Command : `npm start`
- Ajouter les variables `DATABASE_URL`, `JWT_SECRET`, `FRONTEND_URL`

## Supabase

Les migrations existantes sont conservées :

```bash
psql "$DATABASE_URL" -f backend/migrations/schema.sql
psql "$DATABASE_URL" -f backend/migrations/002_add_messages.sql
```

N'exécutez pas à nouveau les migrations si les tables existent déjà dans votre projet Supabase.

## Vérifications effectuées

- `npm run build` du frontend : OK
- syntaxe backend Node.js : OK
- configuration SPA Vercel conservée
- aucune variable secrète ajoutée au ZIP
