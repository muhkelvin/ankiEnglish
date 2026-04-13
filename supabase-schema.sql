-- ============================================================
-- EnglishAnki — Supabase Schema
-- Run this in Supabase SQL Editor (Project > SQL Editor > New Query)
-- ============================================================
-- ENUMS
CREATE TYPE user_role AS ENUM ('admin', 'user');
CREATE TYPE card_type AS ENUM ('fill_blank', 'multiple_choice', 'error_correction');
CREATE TYPE card_status AS ENUM ('new', 'learning', 'review');
CREATE TYPE rating_type AS ENUM ('again', 'hard', 'good', 'easy');

-- USERS (mirrors Supabase auth.users)
CREATE TABLE users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  role user_role NOT NULL DEFAULT 'user',
  created_at TIMESTAMP DEFAULT NOW(),
  last_active_at TIMESTAMP
);

-- LEVELS
CREATE TABLE levels (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(10) NOT NULL UNIQUE,
  label VARCHAR(50) NOT NULL,
  "order" INT NOT NULL
);

-- MODULES
CREATE TABLE modules (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id UUID NOT NULL REFERENCES levels(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  total_cards INT NOT NULL DEFAULT 0,
  "order" INT NOT NULL
);

-- CARDS
CREATE TABLE cards (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  module_id UUID REFERENCES modules(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  type card_type NOT NULL DEFAULT 'fill_blank',
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  options JSONB,
  correct_index INT,
  category VARCHAR(100),
  is_system BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  CONSTRAINT chk_card_owner CHECK (
    (is_system = true AND module_id IS NOT NULL AND user_id IS NULL) OR
    (is_system = false AND user_id IS NOT NULL AND module_id IS NULL)
  )
);

-- USER CARD PROGRESS
CREATE TABLE user_card_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  card_id UUID NOT NULL REFERENCES cards(id) ON DELETE CASCADE,
  interval_days INT NOT NULL DEFAULT 0,
  ease_factor FLOAT NOT NULL DEFAULT 2.5,
  repetition_count INT NOT NULL DEFAULT 0,
  due_date DATE NOT NULL DEFAULT CURRENT_DATE,
  last_reviewed TIMESTAMP,
  status card_status NOT NULL DEFAULT 'new',
  UNIQUE (user_id, card_id)
);

-- SESSIONS
CREATE TABLE sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  module_id UUID REFERENCES modules(id) ON DELETE SET NULL,
  started_at TIMESTAMP NOT NULL DEFAULT NOW(),
  ended_at TIMESTAMP,
  total_cards INT NOT NULL DEFAULT 0,
  count_again INT NOT NULL DEFAULT 0,
  count_hard INT NOT NULL DEFAULT 0,
  count_good INT NOT NULL DEFAULT 0,
  count_easy INT NOT NULL DEFAULT 0
);

-- SESSION CARDS
CREATE TABLE session_cards (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
  card_id UUID NOT NULL REFERENCES cards(id) ON DELETE CASCADE,
  rating rating_type NOT NULL,
  answered_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ============================================================
-- INDEXES
-- ============================================================
CREATE INDEX idx_modules_level ON modules(level_id);
CREATE INDEX idx_cards_module ON cards(module_id);
CREATE INDEX idx_cards_user ON cards(user_id);
CREATE INDEX idx_progress_user ON user_card_progress(user_id);
CREATE INDEX idx_progress_due ON user_card_progress(due_date);
CREATE INDEX idx_progress_user_card ON user_card_progress(user_id, card_id);
CREATE INDEX idx_sessions_user ON sessions(user_id);
CREATE INDEX idx_sessions_started ON sessions(started_at);
CREATE INDEX idx_session_cards_sess ON session_cards(session_id);

-- ============================================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================================
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_card_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE session_cards ENABLE ROW LEVEL SECURITY;

-- Users: can only read/update their own row
CREATE POLICY "users_own" ON users FOR ALL USING (auth.uid() = id);

-- Cards: system cards readable by all authenticated; own cards by owner
CREATE POLICY "cards_system_read" ON cards FOR SELECT USING (is_system = true OR user_id = auth.uid());
CREATE POLICY "cards_own_write" ON cards FOR INSERT WITH CHECK (user_id = auth.uid() AND is_system = false);
CREATE POLICY "cards_own_update" ON cards FOR UPDATE USING (user_id = auth.uid() AND is_system = false);
CREATE POLICY "cards_own_delete" ON cards FOR DELETE USING (user_id = auth.uid() AND is_system = false);

-- Progress: own rows only
CREATE POLICY "progress_own" ON user_card_progress FOR ALL USING (user_id = auth.uid());

-- Sessions: own rows only
CREATE POLICY "sessions_own" ON sessions FOR ALL USING (user_id = auth.uid());
CREATE POLICY "session_cards_own" ON session_cards FOR ALL USING (
  session_id IN (SELECT id FROM sessions WHERE user_id = auth.uid())
);

-- ============================================================
-- TRIGGER: Auto-sync auth.users → public.users saat register
-- ============================================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, name, email, role)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'name', 'User'),
    NEW.email,
    'user'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================================
-- SYNC: User yang sudah terlanjur register sebelum trigger dipasang
-- ============================================================
INSERT INTO public.users (id, name, email, role)
SELECT
  id,
  COALESCE(raw_user_meta_data->>'name', 'User'),
  email,
  'user'
FROM auth.users
ON CONFLICT (id) DO NOTHING;

