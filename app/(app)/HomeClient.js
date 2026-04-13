'use client'
import { useRouter } from 'next/navigation'
import { BookOpen, PenSquare, ArrowRight, Zap, Clock } from 'lucide-react'

export default function HomeClient({ profile, dueCount, lastSession }) {
  const router = useRouter()

  const progress = lastSession
    ? Math.round(((lastSession.count_good + lastSession.count_easy) / (lastSession.total_cards || 1)) * 100)
    : 0

  const firstName = profile?.name?.split(' ')[0] || 'Kamu'

  return (
    <div className="page-enter space-y-8">
      <div className="page-header">
        <h1>Halo, {firstName}! 👋</h1>
        <p>Mau belajar apa hari ini?</p>
      </div>

      {dueCount > 0 && (
        <div
          className="rounded-[var(--radius)] p-5 text-white relative overflow-hidden cursor-pointer"
          style={{ background: 'linear-gradient(135deg, #2155e8 0%, #1841cc 100%)' }}
          onClick={() => router.push('/system')}
        >
          <div
            className="absolute right-0 top-0 w-40 h-40 rounded-full opacity-10 pointer-events-none"
            style={{ background: 'white', transform: 'translate(30%, -40%)' }}
          />
          <div className="flex items-center gap-2 mb-1">
            <Zap size={14} className="opacity-70" />
            <p className="text-xs font-medium opacity-70">Review hari ini</p>
          </div>
          <p className="text-4xl font-bold tracking-tight">
            {dueCount}
            <span className="text-xl font-medium opacity-70 ml-2">kartu</span>
          </p>
          <p className="text-sm opacity-60 mt-1 mb-4">siap di-review sekarang</p>
          <div className="inline-flex items-center gap-2 bg-white/20 hover:bg-white/30 transition-all text-white text-sm font-semibold px-4 py-2 rounded-full">
            Mulai review <ArrowRight size={14} />
          </div>
        </div>
      )}

      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-widest mb-4">
          Mode belajar
        </p>
        <div className="card-grid-2">
          <button
            onClick={() => router.push('/system')}
            className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 text-left card-hover shadow-[var(--shadow-sm)] group"
          >
            <div className="w-10 h-10 bg-[var(--accent-light)] rounded-[12px] flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <BookOpen size={20} className="text-[var(--accent)]" />
            </div>
            <p className="text-base font-semibold text-[var(--text-primary)] mb-1.5">Dari sistem</p>
            <p className="text-sm text-[var(--text-muted)] leading-relaxed">
              Kartu sudah disiapkan per modul — tinggal pilih level dan mulai belajar.
            </p>
            <div className="mt-4 flex items-center gap-1.5 text-sm text-[var(--accent)] font-semibold">
              Pilih modul <ArrowRight size={14} />
            </div>
          </button>

          <button
            onClick={() => router.push('/my-cards')}
            className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 text-left card-hover shadow-[var(--shadow-sm)] group"
          >
            <div className="w-10 h-10 bg-[var(--green-light)] rounded-[12px] flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <PenSquare size={20} className="text-[var(--green)]" />
            </div>
            <p className="text-base font-semibold text-[var(--text-primary)] mb-1.5">Buat sendiri</p>
            <p className="text-sm text-[var(--text-muted)] leading-relaxed">
              Tambah kartu kamu sendiri, simpan, dan latihan kapan saja.
            </p>
            <div className="mt-4 flex items-center gap-1.5 text-sm text-[var(--green)] font-semibold">
              Buat kartu <ArrowRight size={14} />
            </div>
          </button>
        </div>
      </div>

      {lastSession?.modules && (
        <div>
          <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-widest mb-4">
            Lanjutkan sesi
          </p>
          <button
            onClick={() => router.push(`/flashcard?moduleId=${lastSession.module_id}`)}
            className="w-full bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 text-left card-hover shadow-[var(--shadow-sm)]"
          >
            <div className="flex items-center justify-between gap-4">
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <Clock size={13} className="text-[var(--text-muted)] flex-shrink-0" />
                  <p className="text-xs text-[var(--text-muted)]">Level {lastSession.modules.levels?.name}</p>
                </div>
                <p className="text-base font-semibold text-[var(--text-primary)] mb-3">{lastSession.modules.name}</p>
                <div className="flex items-center gap-3">
                  <div className="flex-1 h-1.5 bg-[var(--surface-2)] rounded-full overflow-hidden">
                    <div className="h-full bg-[var(--accent)] rounded-full transition-all" style={{ width: `${progress}%` }} />
                  </div>
                  <span className="text-xs text-[var(--text-muted)] shrink-0 font-medium">{progress}%</span>
                </div>
              </div>
              <span className="flex-shrink-0 text-xs bg-[var(--amber-light)] text-[var(--amber)] px-3 py-1.5 rounded-full font-semibold border border-[var(--amber-muted)]">
                Lanjut →
              </span>
            </div>
          </button>
        </div>
      )}
    </div>
  )
}
