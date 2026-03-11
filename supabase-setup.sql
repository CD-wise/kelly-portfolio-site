-- ════════════════════════════════════════
-- KELLY PORTFOLIO WEBSITE - SUPABASE SETUP
-- Full CRUD Database Structure
-- ════════════════════════════════════════

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ════════════════════════════════════════
-- ADMIN/USERS TABLE
-- ════════════════════════════════════════
CREATE TABLE admin_users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  full_name VARCHAR(255),
  role VARCHAR(50) DEFAULT 'admin',
  is_active BOOLEAN DEFAULT true,
  last_login TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- PROFILE TABLE
-- ════════════════════════════════════════
CREATE TABLE profile (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  dob VARCHAR(50),
  pob VARCHAR(100),
  nationality VARCHAR(100),
  religion VARCHAR(100),
  marital_status VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(255),
  role VARCHAR(255),
  bio1 TEXT,
  bio2 TEXT,
  bio3 TEXT,
  bio4 TEXT,
  bio5 TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- SKILLS TABLE
-- ════════════════════════════════════════
CREATE TABLE skills (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  category VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- EXPERTISE TABLE
-- ════════════════════════════════════════
CREATE TABLE expertise (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  icon VARCHAR(10),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- EXPERIENCE TABLE
-- ════════════════════════════════════════
CREATE TABLE experience (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  period VARCHAR(100),
  role VARCHAR(255) NOT NULL,
  organization VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- EDUCATION TABLE
-- ════════════════════════════════════════
CREATE TABLE education (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  period VARCHAR(100),
  qualification VARCHAR(255) NOT NULL,
  institution VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- CREDENTIALS TABLE
-- ════════════════════════════════════════
CREATE TABLE credentials (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  icon VARCHAR(10),
  title VARCHAR(255) NOT NULL,
  organization VARCHAR(255),
  detail TEXT,
  badge VARCHAR(100),
  badge_type VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- CONTACT TABLE
-- ════════════════════════════════════════
CREATE TABLE contact (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  icon VARCHAR(10),
  label VARCHAR(100),
  value VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- HERO STATS TABLE
-- ════════════════════════════════════════
CREATE TABLE hero_stats (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  num VARCHAR(50),
  label VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- PROFILE PHOTO TABLE
-- ════════════════════════════════════════
CREATE TABLE profile_photo (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  file_url VARCHAR(500),
  file_name VARCHAR(255),
  file_size BIGINT,
  mime_type VARCHAR(50),
  uploaded_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ════════════════════════════════════════
-- INSERT DEFAULT DATA
-- ════════════════════════════════════════

-- Insert Admin User
-- Note: Password is hashed using bcrypt (or use MD5/SHA256 for simple setup)
-- For this setup, storing plaintext for simplicity (⚠️ DO NOT use in production)
-- Use bcrypt or similar: https://bcrypt-generator.com/
INSERT INTO admin_users (username, password_hash, email, full_name, role)
VALUES (
  'druterus',
  'kelly123', -- In production, use bcrypt: bcryptjs.hashSync('kelly123', 10)
  'admin@emmanuel-abakah.com',
  'Admin User',
  'admin'
);

-- Insert Profile
INSERT INTO profile (first_name, last_name, dob, pob, nationality, religion, marital_status, phone, email, role, bio1, bio2, bio3, bio4, bio5)
VALUES (
  'Emmanuel',
  'Abakah',
  '7th August, 1996',
  'Mankessim',
  'Ghanaian',
  'Christian',
  'Single',
  '0245 870 387',
  'emmanuel.abakah.1806@gmail.com',
  'Medical Sonographer & Hospital Administrator',
  'I am a dedicated and results-oriented <strong>Diagnostic Medical Sonographer and Hospital Administrator</strong>, currently serving in a dual capacity at <strong>Soloboat (SB) Hospital</strong> in Assin Fosu, Central Region of Ghana.',
  'I hold a <strong>B.Sc. in Diagnostic Medical Sonography</strong> from Klintaps University College, affiliated with the University of Cape Coast — a rigorous four-year programme covering diagnostic imaging science, clinical sonography practice, anatomy, and patient management.',
  'As a <strong>provisionally registered Sonographer</strong> with the Allied Health Professions Council (AHPC) of Ghana (Reg. No: 0022395), I perform a wide range of ultrasound examinations while also overseeing day-to-day administrative operations.',
  'I pride myself on <strong>attention to detail, adaptability</strong>, and a genuine drive to keep learning. I work effectively both independently and as part of a multidisciplinary healthcare team.',
  'Outside the clinic, I am passionate about music — I play the acoustic guitar and have served as a music teacher at the Ebenezer Methodist Regimental Band in Mankessim.'
);

-- Insert Skills
INSERT INTO skills (name, category) VALUES
('Abdominal Ultrasound', 'Clinical'),
('Obstetrics & Gynaecology', 'Clinical'),
('Vascular Imaging', 'Clinical'),
('Small Parts', 'Clinical'),
('Hospital Administration', 'Management'),
('Records Management', 'Management'),
('MS Word & Excel', 'IT'),
('Team Leadership', 'Soft Skills');

-- Insert Expertise
INSERT INTO expertise (icon, title, description) VALUES
('🔬', 'Abdominal Ultrasound', 'Comprehensive abdominal sonographic examinations covering liver, gallbladder, spleen, kidneys, pancreas, and bladder assessments.'),
('🤰', 'Obstetrics & Gynaecology', 'First, second, and third trimester obstetric scans, gynaecological examinations including follicular studies and uterine assessments.'),
('🩺', 'Vascular & Special Procedures', 'Vascular sonography and special ultrasound procedures requiring precise imaging technique and clinical judgement.'),
('🔭', 'Small Parts Imaging', 'High-frequency imaging of small anatomical structures including thyroid, scrotal, breast, and musculoskeletal soft tissue.'),
('🗂️', 'Hospital Administration', 'Overseeing scheduling, patient records management, regulatory compliance, staff coordination at SB Hospital.'),
('🤝', 'Patient Care & Relations', 'Considerable practical experience in compassionate patient communication and exceptional care in clinical environments.');

-- Insert Experience
INSERT INTO experience (period, role, organization, description) VALUES
('Present', 'Medical Sonographer & Administrator', 'Soloboat (SB) Hospital · Assin Fosu, Central Region', 'Performs full-range diagnostic ultrasound examinations daily\nOversees hospital administrative operations & workflow\nManages patient scheduling, records & compliance\nServes as key liaison between clinical staff & management'),
('2023 – 2024', 'National Service Personnel — Sonographer', 'St. Francis Xavier Hospital · Central Region', 'Conducted diagnostic ultrasound across multiple modalities\nCollaborated with physicians & radiologists\nNSS Number: NSSAHC7423523'),
('2021', 'Clinical Practical Training', 'Soloboat Medical Diagnostic Centre · Assin Fosu', 'Observation and practical training covering abdominal, OBG, vascular & small parts imaging.'),
('Ongoing', 'Music Teacher — Regimental Band', 'Ebenezer Methodist Regimental Band · Mankessim', 'Teaches children to play musical instruments\nAssists in reading & understanding music');

-- Insert Education
INSERT INTO education (period, qualification, institution, description) VALUES
('2020 – 2024', 'B.Sc. Diagnostic Medical Sonography', 'Klintaps University College · Tema (Cert. by UCC)', 'Four-year programme. Admission No: 2020089 · ID: KUC/DMS/19/0076'),
('2013 – 2016', 'WASSCE — Secondary Education', 'Sammo Otto Senior High School · Cape Coast', 'Health Prefect (2015–2016)\nMember, Regimental Band (2013–2016)'),
('2010 – 2011', 'B.E.C.E — Basic Education Certificate', 'Wright Memorial School', 'Completed the Basic Education Certificate Examination.');

-- Insert Credentials
INSERT INTO credentials (icon, title, organization, detail, badge, badge_type) VALUES
('📜', 'Certificate of Provisional Registration — Sonographer', 'Allied Health Professions Council (AHPC), Ghana', 'Reg. No: AHPC / 0022395\nPIN: 90072823\nValid: 01 Dec 2023 – 30 Nov 2024', 'Provisionally Registered', 'green'),
('🎓', 'B.Sc. Diagnostic Medical Sonography', 'Klintaps University College · Certified by UCC', 'Admission No: 2020089\nStudent ID: KUC/DMS/19/0076\n4-Year Bachelor''s Programme', 'Degree', 'gold'),
('🏅', 'Certificate of National Service', 'Ghana National Service Scheme', 'NSS No: NSSAHC7423523\nPlace: St. Francis Xavier Hospital\nPeriod: 2023/2024', 'Completed', 'green'),
('🏫', 'WASSCE Certificate', 'Sammo Otto Senior High School · Cape Coast', 'Year: 2013–2016\nHealth Prefect (2015–2016)', 'Completed', 'green'),
('📋', 'B.E.C.E — Basic Education Certificate', 'Wright Memorial School', 'Year: 2010–2011', 'Completed', 'green'),
('🔬', 'Letter of Introduction — Clinical Training', 'Klintaps University College', 'Signed by: Douglas Frimpong-Nnuroh\nPlacement: Soloboat Medical Diagnostic Centre\nDate: June 1, 2021', 'Clinical', 'gold');

-- Insert Contact
INSERT INTO contact (icon, label, value) VALUES
('📞', 'Phone', '0245 870 387'),
('✉️', 'Email', 'emmanuel.abakah.1806@gmail.com'),
('📍', 'Location', 'Mankessim, Central Region, Ghana'),
('🏥', 'Current Workplace', 'Soloboat (SB) Hospital, Assin Fosu');

-- Insert Hero Stats
INSERT INTO hero_stats (num, label) VALUES
('B.Sc.', 'Degree'),
('AHPC', 'Registered'),
('NSS', 'Certified'),
('2', 'Roles @ SB');

-- ════════════════════════════════════════
-- ROW LEVEL SECURITY (RLS) POLICIES
-- ════════════════════════════════════════

-- Enable RLS on all tables
ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE profile ENABLE ROW LEVEL SECURITY;
ALTER TABLE skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE expertise ENABLE ROW LEVEL SECURITY;
ALTER TABLE experience ENABLE ROW LEVEL SECURITY;
ALTER TABLE education ENABLE ROW LEVEL SECURITY;
ALTER TABLE credentials ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact ENABLE ROW LEVEL SECURITY;
ALTER TABLE hero_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE profile_photo ENABLE ROW LEVEL SECURITY;

-- Admin users policy - allow login verification (select only)
CREATE POLICY "Allow login verification" ON admin_users FOR SELECT USING (true);

-- Create public read policies (anyone can view)
CREATE POLICY "Public can view profile" ON profile FOR SELECT USING (true);
CREATE POLICY "Public can view skills" ON skills FOR SELECT USING (true);
CREATE POLICY "Public can view expertise" ON expertise FOR SELECT USING (true);
CREATE POLICY "Public can view experience" ON experience FOR SELECT USING (true);
CREATE POLICY "Public can view education" ON education FOR SELECT USING (true);
CREATE POLICY "Public can view credentials" ON credentials FOR SELECT USING (true);
CREATE POLICY "Public can view contact" ON contact FOR SELECT USING (true);
CREATE POLICY "Public can view hero_stats" ON hero_stats FOR SELECT USING (true);
CREATE POLICY "Public can view profile_photo" ON profile_photo FOR SELECT USING (true);

-- Create admin update/insert/delete policies
-- NOTE: You'll need to add a users table and set up authentication
-- For now, these policies will prevent unauthorized updates
CREATE POLICY "Admin only update profile" ON profile FOR UPDATE USING (false);
CREATE POLICY "Admin only insert profile" ON profile FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete profile" ON profile FOR DELETE USING (false);

CREATE POLICY "Admin only update skills" ON skills FOR UPDATE USING (false);
CREATE POLICY "Admin only insert skills" ON skills FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete skills" ON skills FOR DELETE USING (false);

CREATE POLICY "Admin only update expertise" ON expertise FOR UPDATE USING (false);
CREATE POLICY "Admin only insert expertise" ON expertise FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete expertise" ON expertise FOR DELETE USING (false);

CREATE POLICY "Admin only update experience" ON experience FOR UPDATE USING (false);
CREATE POLICY "Admin only insert experience" ON experience FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete experience" ON experience FOR DELETE USING (false);

CREATE POLICY "Admin only update education" ON education FOR UPDATE USING (false);
CREATE POLICY "Admin only insert education" ON education FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete education" ON education FOR DELETE USING (false);

CREATE POLICY "Admin only update credentials" ON credentials FOR UPDATE USING (false);
CREATE POLICY "Admin only insert credentials" ON credentials FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete credentials" ON credentials FOR DELETE USING (false);

CREATE POLICY "Admin only update contact" ON contact FOR UPDATE USING (false);
CREATE POLICY "Admin only insert contact" ON contact FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete contact" ON contact FOR DELETE USING (false);

CREATE POLICY "Admin only update hero_stats" ON hero_stats FOR UPDATE USING (false);
CREATE POLICY "Admin only insert hero_stats" ON hero_stats FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete hero_stats" ON hero_stats FOR DELETE USING (false);

CREATE POLICY "Admin only update profile_photo" ON profile_photo FOR UPDATE USING (false);
CREATE POLICY "Admin only insert profile_photo" ON profile_photo FOR INSERT WITH CHECK (false);
CREATE POLICY "Admin only delete profile_photo" ON profile_photo FOR DELETE USING (false);

-- ════════════════════════════════════════
-- INDEXES FOR PERFORMANCE
-- ════════════════════════════════════════
CREATE INDEX idx_profile_email ON profile(email);
CREATE INDEX idx_skills_category ON skills(category);
CREATE INDEX idx_experience_period ON experience(period);
CREATE INDEX idx_education_period ON education(period);
CREATE INDEX idx_credentials_title ON credentials(title);
CREATE INDEX idx_hero_stats_label ON hero_stats(label);
CREATE INDEX idx_profile_photo_uploaded ON profile_photo(uploaded_at);
