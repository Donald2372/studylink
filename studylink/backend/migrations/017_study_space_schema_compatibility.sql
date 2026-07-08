-- STUDYLINK — COMPATIBILITE DE L'ESPACE D'ETUDE
-- Idempotent. Met à niveau les anciennes bases sans supprimer les données.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS study_tasks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE study_tasks
  ADD COLUMN IF NOT EXISTS description TEXT,
  ADD COLUMN IF NOT EXISTS category VARCHAR(120) DEFAULT 'Général',
  ADD COLUMN IF NOT EXISTS color VARCHAR(20) DEFAULT '#1768ff',
  ADD COLUMN IF NOT EXISTS priority VARCHAR(20) DEFAULT 'medium',
  ADD COLUMN IF NOT EXISTS due_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS estimated_minutes INTEGER DEFAULT 30,
  ADD COLUMN IF NOT EXISTS linked_type VARCHAR(50),
  ADD COLUMN IF NOT EXISTS linked_id UUID,
  ADD COLUMN IF NOT EXISTS completed_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

CREATE TABLE IF NOT EXISTS study_planner_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  start_at TIMESTAMPTZ NOT NULL,
  end_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE study_planner_events
  ADD COLUMN IF NOT EXISTS description TEXT,
  ADD COLUMN IF NOT EXISTS category VARCHAR(120) DEFAULT 'Étude',
  ADD COLUMN IF NOT EXISTS color VARCHAR(20) DEFAULT '#1768ff',
  ADD COLUMN IF NOT EXISTS source_type VARCHAR(50) DEFAULT 'manual',
  ADD COLUMN IF NOT EXISTS source_id UUID,
  ADD COLUMN IF NOT EXISTS location TEXT,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

CREATE TABLE IF NOT EXISTS study_focus_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  subject VARCHAR(160) NOT NULL DEFAULT 'Session d’étude',
  objective TEXT NOT NULL DEFAULT 'Avancer sur mon apprentissage',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE study_focus_sessions
  ADD COLUMN IF NOT EXISTS category VARCHAR(120) DEFAULT 'Étude',
  ADD COLUMN IF NOT EXISTS mode VARCHAR(30) DEFAULT '50/10',
  ADD COLUMN IF NOT EXISTS planned_minutes INTEGER DEFAULT 50,
  ADD COLUMN IF NOT EXISTS elapsed_seconds INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS focus_score INTEGER,
  ADD COLUMN IF NOT EXISTS status VARCHAR(20) DEFAULT 'active',
  ADD COLUMN IF NOT EXISTS started_at TIMESTAMPTZ DEFAULT now(),
  ADD COLUMN IF NOT EXISTS ended_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

CREATE TABLE IF NOT EXISTS study_distractions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE study_distractions
  ADD COLUMN IF NOT EXISTS focus_session_id UUID,
  ADD COLUMN IF NOT EXISTS resolved_at TIMESTAMPTZ;

CREATE TABLE IF NOT EXISTS study_notes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE study_notes
  ADD COLUMN IF NOT EXISTS content TEXT DEFAULT '',
  ADD COLUMN IF NOT EXISTS category VARCHAR(120) DEFAULT 'Toutes les notes',
  ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS favorite BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS linked_type VARCHAR(50),
  ADD COLUMN IF NOT EXISTS linked_id UUID,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

CREATE TABLE IF NOT EXISTS study_goals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE study_goals
  ADD COLUMN IF NOT EXISTS description TEXT,
  ADD COLUMN IF NOT EXISTS category VARCHAR(120) DEFAULT 'Apprentissage',
  ADD COLUMN IF NOT EXISTS color VARCHAR(20) DEFAULT '#1768ff',
  ADD COLUMN IF NOT EXISTS icon VARCHAR(60) DEFAULT 'target',
  ADD COLUMN IF NOT EXISTS target_date DATE,
  ADD COLUMN IF NOT EXISTS effort_hours_per_week NUMERIC(5,1) DEFAULT 3,
  ADD COLUMN IF NOT EXISTS priority VARCHAR(20) DEFAULT 'medium',
  ADD COLUMN IF NOT EXISTS progress_percent NUMERIC(5,2) DEFAULT 0,
  ADD COLUMN IF NOT EXISTS status VARCHAR(20) DEFAULT 'active',
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

CREATE TABLE IF NOT EXISTS study_goal_milestones (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  goal_id UUID NOT NULL REFERENCES study_goals(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  position INTEGER NOT NULL DEFAULT 1,
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_study_tasks_user_due ON study_tasks(user_id, due_at);
CREATE INDEX IF NOT EXISTS idx_study_events_user_start ON study_planner_events(user_id, start_at);
CREATE INDEX IF NOT EXISTS idx_study_focus_user_start ON study_focus_sessions(user_id, started_at DESC);
CREATE INDEX IF NOT EXISTS idx_study_notes_user_updated ON study_notes(user_id, updated_at DESC);
CREATE INDEX IF NOT EXISTS idx_study_goals_user_status ON study_goals(user_id, status);
CREATE INDEX IF NOT EXISTS idx_study_distractions_user_created ON study_distractions(user_id, created_at DESC);

SELECT 'Study Space compatibility ready' AS result;
