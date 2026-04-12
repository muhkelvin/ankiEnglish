'use client'
import { useRouter } from 'next/navigation'
import { BookOpen, PenSquare, ArrowRight, Zap, LogOut } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import Card from '@/components/ui/Card'
import Button from '@/components/ui/Button'

export default function HomeClient({ profile, dueCount, lastSession }) {
  const router = useRouter()

  async function handleLogout() {
    const supabase = createClient()
    await supabase.auth.signOut()
    router.push('/login')
    router.refresh()
  }

  const progress = lastSession
    ? Math.round(((lastSession.count_good + lastSession.count_easy) / (lastSession.total_cards || 1)) * 100)
    : 0

  return (
    <div className="page-enter space-y-6">
      {/* Header */}
      <div className="flex items-start justify-between">
        <div>
          <h1 className="text-xl font-semibold text-[var(--text-primary)]">
            Halo, {profile?.name?.split(' ')[0] || 'Kamu'}! 👋
          </h1>
          <p className="text-sm text-[var(--text-muted)] mt-0.5">Mau latihan apa hari ini?</p>
        </div>
        <button
          onClick={handleLogout}
          className="p-2 rounded-[8px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] hover:text-[var(--red)] transition-all"
          title="Keluar"
        >
          <LogOut size={16} />
        </button>
      </div>

      {/* 2 Mode Cards */}
      <div className="grid grid-cols-2 gap-3">
        <Card hover onClick={() => router.push('/system')} className="p-4">
          <div className="w-9 h-9 bg-[var(--accent-light)] rounded-[10px] flex items-center justify-center mb-3">
            <BookOpen size={18} className="text-[var(--accent)]" />
          </div>
          <p className="text-sm font-semibold text-[var(--text-primary)] mb-1">Dari sistem</p>
          <p className="text-xs text-[var(--text-muted)] leading-relaxed">
            Kartu sudah disiapkan per modul — tinggal pilih dan belajar.
          </p>
          <div className="mt-3 flex items-center gap-1 text-xs text-[var(--accent)] font-medium">
            Pilih modul <ArrowRight size={11} />
          </div>
        </Card>

        <Card hover onClick={() => router.push('/my-cards')} className="p-4">
          <div className="w-9 h-9 bg-[var(--green-light)] rounded-[10px] flex items-center justify-center mb-3">
            <PenSquare size={18} className="text-[var(--green)]" />
          </div>
          <p className="text-sm font-semibold text-[var(--text-primary)] mb-1">Buat sendiri</p>
          <p className="text-xs text-[var(--text-muted)] leading-relaxed">
            Tambah kartu kamu sendiri, simpan, dan latihan kapan saja.
          </p>
          <div className="mt-3 flex items-center gap-1 text-xs text-[var(--green)] font-medium">
            Buat kartu <ArrowRight size={11} />
          </div>
        </Card>
      </div>

      {/* Last session */}
      {lastSession?.modules && (
        <div>
          <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-wider mb-2">
            Lanjutkan sesi
          </p>
          <Card
            hover
            onClick={() => router.push(`/flashcard?moduleId=${lastSession.module_id}`)}
            className="p-4"
          >
            <div className="flex items-center justify-between">
              <div className="flex-1 min-w-0">
                <p className="text-sm font-semibold text-[var(--text-primary)] truncate">
                  {lastSession.modules.name}
                </p>
                <p className="text-xs text-[var(--text-muted)] mt-0.5">
                  Level {lastSession.modules.levels?.name} · {lastSession.total_cards} kartu
                </p>
                <div className="mt-2.5 w-36 h-1.5 bg-[var(--surface-2)] rounded-full overflow-hidden">
                  <div
                    className="h-full bg-[var(--accent)] rounded-full transition-all"
                    style={{ width: `${progress}%` }}
                  />
                </div>
              </div>
              <span className="ml-3 text-xs bg-[var(--amber-light)] text-[var(--amber)] px-2.5 py-1 rounded-full font-semibold shrink-0">
                Lanjut
              </span>
            </div>
          </Card>
        </div>
      )}

      {/* Due today */}
      <div className="bg-gradient-to-br from-[var(--accent)] to-blue-700 rounded-[var(--radius)] p-5 text-white shadow-[var(--shadow)]">
        <div className="flex items-center gap-2 mb-1">
          <Zap size={14} className="text-blue-200" />
          <p className="text-xs font-medium text-blue-200">Review hari ini</p>
        </div>
        <p className="text-3xl font-bold">{dueCount} <span className="text-lg font-semibold text-blue-200">kartu</span></p>
        <p className="text-xs text-blue-300 mt-0.5 mb-4">jatuh tempo dan siap di-review</p>
        <Button
          onClick={() => router.push('/system')}
          className="bg-white !text-[var(--accent)] hover:bg-blue-50 w-full justify-center text-sm font-semibold"
          size="md"
        >
          Mulai review →
        </Button>
      </div>
    </div>
  )
}
