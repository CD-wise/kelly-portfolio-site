# Kelly Portfolio - Supabase Integration Guide

## Overview

This guide will help you integrate Supabase (a PostgreSQL backend-as-a-service) with your portfolio website to enable full CRUD (Create, Read, Update, Delete) functionality for the admin panel.

---

## Step 1: Set Up Supabase Account

1. Go to [supabase.com](https://supabase.com)
2. Click **"Start your project"** and sign up
3. Create a new project:
   - **Project Name:** kelly-portfolio
   - **Database Password:** Create a strong password (save it!)
   - **Region:** Choose one closest to you
4. Wait for the project to initialize (~2 minutes)

---

## Step 2: Create Tables from SQL Script

1. In Supabase dashboard, go to **SQL Editor**
2. Click **"New Query"**
3. Copy the entire contents of `supabase-setup.sql`
4. Paste it into the SQL editor
5. Click **"Run"** (Play button)
6. Wait for completion (you should see all tables created with green checkmarks)

**Tables created:**
- `profile` - Main profile information
- `skills` - Skills/tags
- `expertise` - Clinical expertise cards
- `experience` - Work experience
- `education` - Education history
- `credentials` - Licenses & credentials
- `contact` - Contact information
- `hero_stats` - Hero section statistics
- `profile_photo` - Profile photo storage

---

## Step 3: Enable Storage for Profile Photos

1. In Supabase, go to **Storage** (left sidebar)
2. Click **"New bucket"**
3. Name it: `profile-photos`
4. Choose **Public** bucket (so photos are accessible)
5. Click **Create**

---

## Step 4: Get Your Credentials

1. In Supabase, go to **Project Settings** (bottom left)
2. Click **API** tab
3. Copy these values:
   - **Project URL** → `SUPABASE_URL`
   - **Anon Public Key** → `SUPABASE_ANON_KEY`

---

## Step 5: Update Your HTML File

Open `index.html` and add the Supabase integration:

### Add this to the `<head>` section (after the `<style>` tag):

```html
<!-- Supabase Client -->
<script src="https://esm.sh/@supabase/supabase-js@2"></script>
```

### Add this before the closing `</script>` tag:

```javascript
// ════════════════════════════════════════
// SUPABASE CONFIGURATION
// ════════════════════════════════════════
const SUPABASE_URL = 'https://YOUR_PROJECT_ID.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY'; // Copy from Settings > API
const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ════════════════════════════════════════
// DATABASE OPERATIONS
// ════════════════════════════════════════

async function loadDataFromSupabase() {
  try {
    // Load all data from Supabase
    const [profileData, skillsData, expertiseData, experienceData, educationData, credentialsData, contactData, statsData] = await Promise.all([
      supabase.from('profile').select('*').single(),
      supabase.from('skills').select('*'),
      supabase.from('expertise').select('*'),
      supabase.from('experience').select('*'),
      supabase.from('education').select('*'),
      supabase.from('credentials').select('*'),
      supabase.from('contact').select('*'),
      supabase.from('hero_stats').select('*')
    ]);

    // Map Supabase data to DB object
    if (profileData.data) {
      const p = profileData.data;
      DB.profile = {
        firstName: p.first_name,
        lastName: p.last_name,
        dob: p.dob,
        pob: p.pob,
        nationality: p.nationality,
        religion: p.religion,
        marital: p.marital_status,
        phone: p.phone,
        email: p.email,
        role: p.role,
        bio1: p.bio1,
        bio2: p.bio2,
        bio3: p.bio3,
        bio4: p.bio4,
        bio5: p.bio5
      };
    }

    if (skillsData.data) DB.skills = skillsData.data.map(s => ({ id: s.id, name: s.name, category: s.category }));
    if (expertiseData.data) DB.expertise = expertiseData.data.map(e => ({ id: e.id, icon: e.icon, title: e.title, desc: e.description }));
    if (experienceData.data) DB.experience = experienceData.data.map(e => ({ id: e.id, period: e.period, role: e.role, org: e.organization, desc: e.description }));
    if (educationData.data) DB.education = educationData.data.map(e => ({ id: e.id, period: e.period, qualification: e.qualification, institution: e.institution, desc: e.description }));
    if (credentialsData.data) DB.credentials = credentialsData.data.map(c => ({ id: c.id, icon: c.icon, title: c.title, org: c.organization, detail: c.detail, badge: c.badge, badgeType: c.badge_type }));
    if (contactData.data) DB.contact = contactData.data.map(c => ({ id: c.id, icon: c.icon, label: c.label, value: c.value }));
    if (statsData.data) DB.heroStats = statsData.data.map(s => ({ id: s.id, num: s.num, label: s.label }));

    renderAll();
    console.log('✅ Data loaded from Supabase');
  } catch (error) {
    console.error('❌ Error loading Supabase data:', error);
    // Falls back to hardcoded data if Supabase fails
  }
}

// Load data when page loads
document.addEventListener('DOMContentLoaded', loadDataFromSupabase);

// ════════════════════════════════════════
// FUNCTION TO SAVE CHANGES TO SUPABASE
// ════════════════════════════════════════

async function saveToSupabase(table, id, data) {
  try {
    const { error } = await supabase
      .from(table)
      .update({ ...data, updated_at: new Date() })
      .eq('id', id);
    
    if (error) throw error;
    showToast('✅ Changes saved to Supabase!', 'success');
    return true;
  } catch (error) {
    console.error(`❌ Error saving to ${table}:`, error);
    showToast('❌ Error saving changes', 'error');
    return false;
  }
}

async function createInSupabase(table, data) {
  try {
    const { data: newData, error } = await supabase
      .from(table)
      .insert([data])
      .select()
      .single();
    
    if (error) throw error;
    showToast('✅ Item created!', 'success');
    return newData;
  } catch (error) {
    console.error(`❌ Error creating in ${table}:`, error);
    showToast('❌ Error creating item', 'error');
    return null;
  }
}

async function deleteFromSupabase(table, id) {
  try {
    const { error } = await supabase
      .from(table)
      .delete()
      .eq('id', id);
    
    if (error) throw error;
    showToast('✅ Item deleted!', 'success');
    return true;
  } catch (error) {
    console.error(`❌ Error deleting from ${table}:`, error);
    showToast('❌ Error deleting item', 'error');
    return false;
  }
}

async function uploadPhoto(file) {
  try {
    const fileName = `profile-${Date.now()}-${file.name}`;
    
    // Upload to storage
    const { data: uploadData, error: uploadError } = await supabase.storage
      .from('profile-photos')
      .upload(fileName, file);
    
    if (uploadError) throw uploadError;

    // Get public URL
    const { data: urlData } = supabase.storage
      .from('profile-photos')
      .getPublicUrl(fileName);

    // Save record to database
    const { data: photoData, error: dbError } = await supabase
      .from('profile_photo')
      .insert([{
        file_url: urlData.publicUrl,
        file_name: fileName,
        file_size: file.size,
        mime_type: file.type
      }])
      .select()
      .single();

    if (dbError) throw dbError;
    showToast('✅ Photo uploaded!', 'success');
    return photoData;
  } catch (error) {
    console.error('❌ Error uploading photo:', error);
    showToast('❌ Error uploading photo', 'error');
    return null;
  }
}
```

---

## Step 6: Connect Admin Save Functions

Update the `saveModal()` function in your admin panel to save to Supabase:

**Find this function and modify it:**

```javascript
async function saveModal() {
  const form = document.getElementById('modalBody');
  const formData = new FormData(form);
  const data = Object.fromEntries(formData);
  
  if (editId && editSection) {
    // UPDATE existing item
    const tableName = editSection === 'profile' ? 'profile' : editSection;
    const success = await saveToSupabase(tableName, editId, data);
    if (success) {
      DB[editSection][DB[editSection].findIndex(x => x.id === editId)] = data;
      if (editSection !== 'profile') renderAll();
      loadDataFromSupabase(); // Refresh from DB
      closeModal();
    }
  } else {
    // CREATE new item
    const newData = await createInSupabase(editSection, data);
    if (newData) {
      DB[editSection].push(newData);
      renderAll();
      loadDataFromSupabase(); // Refresh from DB
      closeModal();
    }
  }
}
```

---

## Step 7: Test the Integration

1. Open your `index.html` in a browser
2. Open **DevTools** (F12) → Console
3. You should see: `✅ Data loaded from Supabase`
4. Go to admin panel (🔐 Admin button)
5. Login with: `druterus` / `kelly123`
6. Try adding/editing an item
7. Check Supabase dashboard to confirm data was saved

---

## Step 8: Deploy to Vercel

1. Update `index.html` with your Supabase credentials
2. Push to GitHub:
   ```bash
   git add .
   git commit -m "Add Supabase integration"
   git push origin main
   ```
3. Deploy to Vercel as before
4. Your live site will now have full CRUD functionality!

---

## Important Security Notes

⚠️ **DO NOT expose your credentials in publicly visible code**

In production, use Supabase authentication:
- Implement sign-up/login system
- Create admin role with specific RLS policies
- Only authenticated admins can modify data

For now, the setup is functional but used with your trust.

---

## Database Schema Reference

| Table | Columns | Purpose |
|-------|---------|---------|
| profile | id, first_name, last_name, dob, phone, email, role, bio1-5 | Main profile data |
| skills | id, name, category | Skills/tags |
| expertise | id, icon, title, description | Clinical expertise |
| experience | id, period, role, organization, description | Work history |
| education | id, period, qualification, institution, description | Education |
| credentials | id, icon, title, organization, detail, badge, badge_type | Licenses |
| contact | id, icon, label, value | Contact info |
| hero_stats | id, num, label | Hero section stats |
| profile_photo | id, file_url, file_name, file_size, mime_type | Photo metadata |

---

## Troubleshooting

**"SUPABASE_URL not found"**
- Make sure you copied the correct Project URL from Settings > API

**"Error: Missing anon key"**
- Copy your Anon Public Key from Settings > API

**"Row-level security (RLS) rejected"**
- Check that RLS policies are correct in SQL script

**"404 bucket not found"**
- Make sure you created the `profile-photos` bucket in Storage

---

## Next Steps

- Set up user authentication (Supabase Auth)
- Create admin-only RLS policies
- Add email notifications on form submissions
- Set up automatic backups
- Monitor with Supabase Analytics

Happy coding! 🚀
