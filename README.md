# EnglishAnki

Flashcard SRS untuk belajar grammar bahasa Inggris. Dibangun dengan Next.js 15 + Supabase.

## Stack
- **Frontend:** Next.js 15 (App Router), Tailwind CSS, Lucide React
- **Backend:** Next.js API Routes + Supabase (PostgreSQL + Auth)
- **Algorithm:** SM-2 Spaced Repetition System

## Setup

### 1. Install dependencies
```bash
npm install
```

### 2. Setup Supabase
1. Buat project baru di [supabase.com](https://supabase.com)
2. Buka **SQL Editor** di Supabase dashboard
3. Copy-paste isi file `supabase-schema.sql` dan jalankan
4. Buat admin account: **Authentication > Users > Add user**
5. Setelah akun terbuat, jalankan di SQL Editor:
   ```sql
   UPDATE users SET role = 'admin' WHERE email = 'email-kamu@example.com';
   ```

### 3. Environment variables
Buat file `.env.local` di root project:
```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...
```
Credentials ada di: **Supabase Dashboard > Project Settings > API**

### 4. Jalankan development server
```bash
npm run dev
```
Buka [http://localhost:3000](http://localhost:3000)

## Struktur Project
```
app/
├── (auth)/login        → Halaman login
├── (auth)/register     → Halaman register
├── (app)/              → App user (dengan navbar)
│   ├── page.js         → Home
│   ├── system/         → Pilih level & modul
│   ├── my-cards/       → CRUD kartu sendiri
│   └── stats/          → Statistik
├── flashcard/          → Sesi belajar flashcard
└── admin/              → Admin panel
    ├── page.js         → Dashboard
    ├── levels/         → Kelola level
    ├── modules/        → Kelola modul
    ├── cards/          → Kelola kartu sistem
    └── users/          → Statistik user

lib/
├── srs.js              → SRS algorithm (SM-2)
├── auth.js             → Auth helpers
└── supabase/
    ├── client.js       → Browser client
    └── server.js       → Server client + admin client

components/
├── ui/                 → Button, Input, Card, Badge, Navbar
├── flashcard/          → FlashcardSession, FlashcardView, SessionSummary
└── admin/              → AdminSidebar, CardForm, AdminDeleteCard
```

## Fitur
- ✅ Auth (login, register, logout) via Supabase
- ✅ 3 tipe kartu: Fill in Blank, Pilihan Ganda, Error Correction
- ✅ SRS algorithm: Again/Hard/Good/Easy dengan interval otomatis
- ✅ Session system dengan streak dots & rating counter
- ✅ Kartu "Again" masuk kembali ke antrian (+3 sampai +5 posisi)
- ✅ Buat, edit, hapus kartu sendiri
- ✅ Statistik per user
- ✅ Admin panel: kelola level, modul, kartu, lihat statistik user
- ✅ Route protection via middleware
- ✅ Mobile-first responsive design
