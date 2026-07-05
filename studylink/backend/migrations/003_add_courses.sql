-- ============================================================
-- Migration additive : Module Catalogue de cours + apprentissage
-- À exécuter dans le SQL Editor de Supabase (une seule fois)
-- ============================================================

-- Catégories de cours (Informatique, Maths, Physique...)
CREATE TABLE IF NOT EXISTS course_categories (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    icon        VARCHAR(50),                  -- clé d'icône côté frontend
    color       VARCHAR(20),                  -- couleur d'accent (ex: '#2563eb')
    course_count INTEGER NOT NULL DEFAULT 0   -- dénormalisé pour l'affichage
);

-- Cours
CREATE TABLE IF NOT EXISTS courses (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title           VARCHAR(255) NOT NULL,
    subtitle        VARCHAR(255),
    description     TEXT,
    category_id     INTEGER REFERENCES course_categories(id),
    instructor_id   UUID REFERENCES users(id) ON DELETE SET NULL,
    level           VARCHAR(20) DEFAULT 'Débutant' CHECK (level IN ('Débutant', 'Intermédiaire', 'Avancé', 'Tous niveaux')),
    language         VARCHAR(10) DEFAULT 'FR',
    thumbnail_url   TEXT,
    rating          NUMERIC(2,1) DEFAULT 0,
    rating_count    INTEGER DEFAULT 0,
    duration_minutes INTEGER DEFAULT 0,
    is_published    BOOLEAN NOT NULL DEFAULT true,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_courses_category ON courses(category_id);

-- Objectifs pédagogiques d'un cours (liste à puces sur la page détail)
CREATE TABLE IF NOT EXISTS course_objectives (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    course_id   UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    label       TEXT NOT NULL,
    position    INTEGER NOT NULL DEFAULT 0
);

-- Modules d'un cours
CREATE TABLE IF NOT EXISTS course_modules (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    course_id   UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    title       VARCHAR(255) NOT NULL,
    position    INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_modules_course ON course_modules(course_id, position);

-- Leçons d'un module
CREATE TABLE IF NOT EXISTS lessons (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    module_id       UUID NOT NULL REFERENCES course_modules(id) ON DELETE CASCADE,
    title           VARCHAR(255) NOT NULL,
    youtube_id      VARCHAR(50),              -- identifiant de la vidéo YouTube intégrée
    duration_minutes INTEGER DEFAULT 0,
    summary         TEXT,                     -- résumé "Dans cette leçon vous allez..."
    position        INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_lessons_module ON lessons(module_id, position);

-- Inscription d'un utilisateur à un cours + progression globale
CREATE TABLE IF NOT EXISTS enrollments (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    course_id       UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    is_favorite     BOOLEAN NOT NULL DEFAULT false,
    last_lesson_id  UUID REFERENCES lessons(id) ON DELETE SET NULL,
    enrolled_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, course_id)
);

-- Progression leçon par leçon
CREATE TABLE IF NOT EXISTS lesson_progress (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    lesson_id   UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    completed   BOOLEAN NOT NULL DEFAULT false,
    completed_at TIMESTAMPTZ,
    UNIQUE (user_id, lesson_id)
);

CREATE INDEX IF NOT EXISTS idx_progress_user ON lesson_progress(user_id);
