-- ============================================================
-- Migration 004 : Univers complets StudyLink
-- Forum · Développement personnel · Bibliothèque · Entrepreneuriat
-- Carrière · Bootcamps · Habitudes · Notifications
-- À exécuter dans le SQL Editor de Supabase (une seule fois)
-- ============================================================

-- ============ FORUM ============
CREATE TABLE IF NOT EXISTS forum_categories (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(100) UNIQUE NOT NULL,
    color   VARCHAR(20),
    icon    VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS forum_threads (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    author_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    category_id  INTEGER REFERENCES forum_categories(id),
    title        VARCHAR(255) NOT NULL,
    body         TEXT NOT NULL,
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_threads_category ON forum_threads(category_id, created_at DESC);

CREATE TABLE IF NOT EXISTS forum_replies (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    thread_id   UUID NOT NULL REFERENCES forum_threads(id) ON DELETE CASCADE,
    author_id   UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    body        TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_replies_thread ON forum_replies(thread_id, created_at);

-- ============ DÉVELOPPEMENT PERSONNEL & PROGRAMMES ============
-- Réutilise course_categories/courses ? Non : univers séparé pour rester fidèle aux écrans.
CREATE TABLE IF NOT EXISTS programs (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title           VARCHAR(255) NOT NULL,
    subtitle        VARCHAR(255),
    description     TEXT,
    category        VARCHAR(100),           -- Discipline, Yoga, Méditation...
    coach_name      VARCHAR(255),
    coach_role      VARCHAR(255),
    level           VARCHAR(30) DEFAULT 'Débutant',
    duration_days   INTEGER DEFAULT 30,
    rating          NUMERIC(2,1) DEFAULT 0,
    rating_count    INTEGER DEFAULT 0,
    thumbnail_url   TEXT,
    accent_color    VARCHAR(20) DEFAULT '#2563EB',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS program_objectives (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    program_id  UUID NOT NULL REFERENCES programs(id) ON DELETE CASCADE,
    label       TEXT NOT NULL,
    position    INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS program_enrollments (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    program_id  UUID NOT NULL REFERENCES programs(id) ON DELETE CASCADE,
    progress    INTEGER NOT NULL DEFAULT 0,      -- pourcentage 0-100
    started_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, program_id)
);

-- Catégories de dév perso (pour la grille Discipline/Yoga/Méditation...)
CREATE TABLE IF NOT EXISTS dev_categories (
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(100) UNIQUE NOT NULL,
    icon         VARCHAR(50),
    color        VARCHAR(20),
    course_count INTEGER DEFAULT 0
);

-- ============ BIBLIOTHÈQUE DE LIVRES ============
CREATE TABLE IF NOT EXISTS books (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title        VARCHAR(255) NOT NULL,
    author       VARCHAR(255),
    category     VARCHAR(100),               -- Productivité, Discipline, Yoga...
    format       VARCHAR(10) DEFAULT 'PDF',   -- PDF, ePub, Audio
    pages        INTEGER,
    language     VARCHAR(10) DEFAULT 'FR',
    rating       NUMERIC(2,1) DEFAULT 0,
    cover_color  VARCHAR(20) DEFAULT '#1B3C99',
    file_url     TEXT,
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS reading_progress (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    book_id     UUID NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    percent     INTEGER NOT NULL DEFAULT 0,
    current_page INTEGER DEFAULT 1,
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, book_id)
);

-- ============ ENTREPRENEURIAT ============
-- Parcours entrepreneuriaux (réutilise la structure programme mais univers dédié)
CREATE TABLE IF NOT EXISTS entrepreneur_paths (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title        VARCHAR(255) NOT NULL,
    subtitle     VARCHAR(255),
    description  TEXT,
    category     VARCHAR(100),               -- Idée & Validation, Business Plan...
    mentor_name  VARCHAR(255),
    mentor_role  VARCHAR(255),
    level        VARCHAR(30) DEFAULT 'Débutant',
    modules_count INTEGER DEFAULT 0,
    duration_minutes INTEGER DEFAULT 0,
    rating       NUMERIC(2,1) DEFAULT 0,
    rating_count INTEGER DEFAULT 0,
    accent_color VARCHAR(20) DEFAULT '#2563EB',
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS entrepreneur_categories (
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(100) UNIQUE NOT NULL,
    icon         VARCHAR(50),
    color        VARCHAR(20),
    course_count INTEGER DEFAULT 0
);

-- Boîte à outils (modèles téléchargeables)
CREATE TABLE IF NOT EXISTS entrepreneur_tools (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title        VARCHAR(255) NOT NULL,
    description  TEXT,
    category     VARCHAR(50),                -- Modèles, Finances, Pitch, Documents
    format       VARCHAR(10),                -- DOCX, XLSX, PDF, PPTX
    file_url     TEXT,
    icon_color   VARCHAR(20) DEFAULT '#2563EB'
);

-- Projet entrepreneurial de l'utilisateur
CREATE TABLE IF NOT EXISTS entrepreneur_projects (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name            VARCHAR(255) NOT NULL,
    description     TEXT,
    problem_solved  TEXT,
    target_audience TEXT,
    status          VARCHAR(30) DEFAULT 'En cours',  -- En projet, En cours, Terminé
    budget_total    NUMERIC(12,2) DEFAULT 0,
    budget_spent    NUMERIC(12,2) DEFAULT 0,
    budget_engaged  NUMERIC(12,2) DEFAULT 0,
    launch_date     DATE,
    progress        INTEGER DEFAULT 0,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS project_tasks (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    project_id  UUID NOT NULL REFERENCES entrepreneur_projects(id) ON DELETE CASCADE,
    title       VARCHAR(255) NOT NULL,
    status      VARCHAR(20) DEFAULT 'todo',   -- todo, in_progress, done
    position    INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS project_goals (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    project_id  UUID NOT NULL REFERENCES entrepreneur_projects(id) ON DELETE CASCADE,
    label       VARCHAR(255) NOT NULL,
    percent     INTEGER DEFAULT 0,
    position    INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS project_documents (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    project_id  UUID NOT NULL REFERENCES entrepreneur_projects(id) ON DELETE CASCADE,
    file_name   VARCHAR(255) NOT NULL,
    file_format VARCHAR(10),
    file_size   VARCHAR(20),
    file_url    TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ============ BOOTCAMPS ============
CREATE TABLE IF NOT EXISTS bootcamps (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title        VARCHAR(255) NOT NULL,
    description  TEXT,
    category     VARCHAR(100),
    level        VARCHAR(30) DEFAULT 'Débutant',
    instructor_id UUID REFERENCES users(id) ON DELETE SET NULL,
    start_date   TIMESTAMPTZ,
    end_date     TIMESTAMPTZ,
    mode         VARCHAR(30) DEFAULT 'visio',   -- visio, présentiel, hybride
    seats        INTEGER DEFAULT 0,
    is_free      BOOLEAN DEFAULT true,
    status       VARCHAR(20) DEFAULT 'À venir',  -- En projet, À venir, En cours, Terminé
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bootcamp_enrollments (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id      UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    bootcamp_id  UUID NOT NULL REFERENCES bootcamps(id) ON DELETE CASCADE,
    enrolled_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, bootcamp_id)
);

-- ============ HABITUDES ============
CREATE TABLE IF NOT EXISTS habits (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id       UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name          VARCHAR(255) NOT NULL,
    frequency     VARCHAR(20) DEFAULT 'daily',   -- daily, weekly
    current_streak INTEGER DEFAULT 0,
    best_streak   INTEGER DEFAULT 0,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS habit_logs (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    habit_id    UUID NOT NULL REFERENCES habits(id) ON DELETE CASCADE,
    done_date   DATE NOT NULL,
    UNIQUE (habit_id, done_date)
);

-- ============ NOTIFICATIONS / CENTRE D'ALERTES ============
CREATE TABLE IF NOT EXISTS notifications (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    type        VARCHAR(30) NOT NULL,           -- message, forum, session, bootcamp, like
    title       VARCHAR(255) NOT NULL,
    body        TEXT,
    read_at     TIMESTAMPTZ,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id, created_at DESC);

-- ============ SEED de base pour catégories ============
INSERT INTO forum_categories (name, color, icon) VALUES
    ('Python', '#2563EB', 'code'), ('Maths', '#16a34a', 'sigma'),
    ('IA & ML', '#9333ea', 'brain'), ('Emploi', '#ea580c', 'briefcase'),
    ('Autres', '#64748b', 'dots')
ON CONFLICT (name) DO NOTHING;

INSERT INTO dev_categories (name, icon, color, course_count) VALUES
    ('Discipline', 'target', '#2563EB', 18), ('Yoga', 'lotus', '#16a34a', 14),
    ('Méditation', 'lotus', '#9333ea', 12), ('Productivité', 'clipboard', '#f59e0b', 16),
    ('Confiance en soi', 'user', '#f97316', 13), ('Habitudes', 'check-circle', '#0ea5e9', 15),
    ('Bien-être', 'leaf', '#22c55e', 17), ('Intelligence émotionnelle', 'heart', '#ec4899', 11)
ON CONFLICT (name) DO NOTHING;

INSERT INTO entrepreneur_categories (name, icon, color, course_count) VALUES
    ('Idée & Validation', 'bulb', '#f59e0b', 12), ('Business Plan', 'clipboard', '#2563EB', 18),
    ('Finance', 'pie', '#16a34a', 14), ('Marketing', 'megaphone', '#9333ea', 16),
    ('Vente', 'bag', '#ec4899', 10), ('E-commerce', 'cart', '#2563EB', 13),
    ('Leadership', 'users', '#f97316', 11), ('Business en ligne', 'globe', '#0d9488', 15)
ON CONFLICT (name) DO NOTHING;
