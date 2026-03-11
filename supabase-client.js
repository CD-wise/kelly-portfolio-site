// ════════════════════════════════════════
// SUPABASE INTEGRATION FOR KELLY PORTFOLIO
// CRUD Operations & Data Management
// ════════════════════════════════════════

// ⚠️ IMPORTANT: Replace these with your actual Supabase credentials
const SUPABASE_URL = 'https://YOUR_PROJECT_ID.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';

// Initialize Supabase client
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ════════════════════════════════════════
// DATABASE HELPER FUNCTIONS
// ════════════════════════════════════════

// PROFILE OPERATIONS
const profileOps = {
  async get() {
    const { data, error } = await supabase
      .from('profile')
      .select('*')
      .single();
    if (error) console.error('Error fetching profile:', error);
    return data;
  },

  async update(updates) {
    const { data, error } = await supabase
      .from('profile')
      .update({ ...updates, updated_at: new Date() })
      .select()
      .single();
    if (error) console.error('Error updating profile:', error);
    return data;
  }
};

// SKILLS OPERATIONS
const skillsOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('skills')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching skills:', error);
    return data || [];
  },

  async create(skill) {
    const { data, error } = await supabase
      .from('skills')
      .insert([skill])
      .select()
      .single();
    if (error) console.error('Error creating skill:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('skills')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating skill:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('skills')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting skill:', error);
  }
};

// EXPERTISE OPERATIONS
const expertiseOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('expertise')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching expertise:', error);
    return data || [];
  },

  async create(item) {
    const { data, error } = await supabase
      .from('expertise')
      .insert([item])
      .select()
      .single();
    if (error) console.error('Error creating expertise:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('expertise')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating expertise:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('expertise')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting expertise:', error);
  }
};

// EXPERIENCE OPERATIONS
const experienceOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('experience')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching experience:', error);
    return data || [];
  },

  async create(item) {
    const { data, error } = await supabase
      .from('experience')
      .insert([item])
      .select()
      .single();
    if (error) console.error('Error creating experience:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('experience')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating experience:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('experience')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting experience:', error);
  }
};

// EDUCATION OPERATIONS
const educationOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('education')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching education:', error);
    return data || [];
  },

  async create(item) {
    const { data, error } = await supabase
      .from('education')
      .insert([item])
      .select()
      .single();
    if (error) console.error('Error creating education:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('education')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating education:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('education')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting education:', error);
  }
};

// CREDENTIALS OPERATIONS
const credentialsOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('credentials')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching credentials:', error);
    return data || [];
  },

  async create(item) {
    const { data, error } = await supabase
      .from('credentials')
      .insert([item])
      .select()
      .single();
    if (error) console.error('Error creating credential:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('credentials')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating credential:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('credentials')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting credential:', error);
  }
};

// CONTACT OPERATIONS
const contactOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('contact')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching contact:', error);
    return data || [];
  },

  async create(item) {
    const { data, error } = await supabase
      .from('contact')
      .insert([item])
      .select()
      .single();
    if (error) console.error('Error creating contact:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('contact')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating contact:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('contact')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting contact:', error);
  }
};

// HERO STATS OPERATIONS
const heroStatsOps = {
  async getAll() {
    const { data, error } = await supabase
      .from('hero_stats')
      .select('*')
      .order('id', { ascending: true });
    if (error) console.error('Error fetching hero stats:', error);
    return data || [];
  },

  async create(item) {
    const { data, error } = await supabase
      .from('hero_stats')
      .insert([item])
      .select()
      .single();
    if (error) console.error('Error creating hero stat:', error);
    return data;
  },

  async update(id, updates) {
    const { data, error } = await supabase
      .from('hero_stats')
      .update({ ...updates, updated_at: new Date() })
      .eq('id', id)
      .select()
      .single();
    if (error) console.error('Error updating hero stat:', error);
    return data;
  },

  async delete(id) {
    const { error } = await supabase
      .from('hero_stats')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting hero stat:', error);
  }
};

// PROFILE PHOTO OPERATIONS
const photoOps = {
  async getLatest() {
    const { data, error } = await supabase
      .from('profile_photo')
      .select('*')
      .order('uploaded_at', { ascending: false })
      .limit(1)
      .single();
    if (error && error.code !== 'PGRST116') console.error('Error fetching photo:', error);
    return data;
  },

  async uploadPhoto(file) {
    const fileName = `profile-${Date.now()}-${file.name}`;
    const { data, error } = await supabase.storage
      .from('profile-photos')
      .upload(fileName, file);
    if (error) {
      console.error('Error uploading photo:', error);
      return null;
    }
    const publicUrl = supabase.storage
      .from('profile-photos')
      .getPublicUrl(fileName).data.publicUrl;

    // Save to profile_photo table
    const { photoData, photoError } = await supabase
      .from('profile_photo')
      .insert([{
        file_url: publicUrl,
        file_name: fileName,
        file_size: file.size,
        mime_type: file.type
      }])
      .select()
      .single();
    if (photoError) console.error('Error saving photo record:', photoError);
    return photoData;
  },

  async deletePhoto(id) {
    const { error } = await supabase
      .from('profile_photo')
      .delete()
      .eq('id', id);
    if (error) console.error('Error deleting photo:', error);
  }
};

// ════════════════════════════════════════
// BATCH LOADING FUNCTION
// ════════════════════════════════════════

async function loadAllDataFromSupabase() {
  try {
    const [profile, skills, expertise, experience, education, credentials, contact, heroStats] = await Promise.all([
      profileOps.get(),
      skillsOps.getAll(),
      expertiseOps.getAll(),
      experienceOps.getAll(),
      educationOps.getAll(),
      credentialsOps.getAll(),
      contactOps.getAll(),
      heroStatsOps.getAll()
    ]);

    if (profile) {
      DB.profile = {
        firstName: profile.first_name,
        lastName: profile.last_name,
        dob: profile.dob,
        pob: profile.pob,
        nationality: profile.nationality,
        religion: profile.religion,
        marital: profile.marital_status,
        phone: profile.phone,
        email: profile.email,
        role: profile.role,
        bio1: profile.bio1,
        bio2: profile.bio2,
        bio3: profile.bio3,
        bio4: profile.bio4,
        bio5: profile.bio5
      };
    }

    if (skills) DB.skills = skills.map(s => ({ id: s.id, name: s.name, category: s.category }));
    if (expertise) DB.expertise = expertise.map(e => ({ id: e.id, icon: e.icon, title: e.title, desc: e.description }));
    if (experience) DB.experience = experience.map(e => ({ id: e.id, period: e.period, role: e.role, org: e.organization, desc: e.description }));
    if (education) DB.education = education.map(e => ({ id: e.id, period: e.period, qualification: e.qualification, institution: e.institution, desc: e.description }));
    if (credentials) DB.credentials = credentials.map(c => ({ id: c.id, icon: c.icon, title: c.title, org: c.organization, detail: c.detail, badge: c.badge, badgeType: c.badge_type }));
    if (contact) DB.contact = contact.map(c => ({ id: c.id, icon: c.icon, label: c.label, value: c.value }));
    if (heroStats) DB.heroStats = heroStats.map(s => ({ id: s.id, num: s.num, label: s.label }));

    console.log('✅ All data loaded from Supabase');
    renderAll();
  } catch (error) {
    console.error('Error loading data from Supabase:', error);
  }
}

// Load data on page load
document.addEventListener('DOMContentLoaded', loadAllDataFromSupabase);

// Export for use
export { 
  supabase,
  profileOps,
  skillsOps,
  expertiseOps,
  experienceOps,
  educationOps,
  credentialsOps,
  contactOps,
  heroStatsOps,
  photoOps,
  loadAllDataFromSupabase
};
