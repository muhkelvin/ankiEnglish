'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { BookOpen, ChevronRight } from 'lucide-react'
import { clsx } from 'clsx'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'

export default function SystemClient({ levels, modules, reviewedMap }) {
  const router = useRouter()
  const [activeLevel, setActiveLevel] = useState(levels[0]?.id || null)

  const filtered = modules.filter(m => m.level_id === activeLevel)
  const activeLabel = levels.find(l => l.id === activeLevel)

  return (
    <div className="page-enter space-y-5">
      <div>
        <h2 className="text-lg font-semibold text-[var(--text-primary)]">Pilih Modul</h2>
        <p className="text-sm text-[var(--text-muted)] mt-0.5">Pilih level lalu mulai sesi belajar</p>
      </div>

      {/* Level Pills */}
      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-wider mb-2.5">Level</p>
        <div className="flex gap-2 flex-wrap">
          {levels.map(level => (
            <button
              key={level.id}
              onClick={() => setActiveLevel(level.id)}
              className={clsx(
                'px-4 py-1.5 rounded-full text-xs font-semibold border transition-all',
                activeLevel === level.id
                  ? 'bg-[var(--accent)] text-white border-[var(--accent)] shadow-sm'
                  : 'bg-[var(--surface)] text-[var(--text-secondary)] border-[var(--border)] hover:border-[var(--border-hover)]'
              )}
            >
              {level.name}
              <span className={clsx('ml-1.5 text-[10px]', activeLevel === level.id ? 'text-blue-200' : 'text-[var(--text-muted)]')}>
                {level.label}
              </span>
            </button>
          ))}
        </div>
      </div>

      {/* Modules */}
      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-wider mb-2.5">
          Modul {activeLabel?.name}
        </p>

        {filtered.length === 0 ? (
          <div className="text-center py-10 text-[var(--text-muted)] text-sm">
            Belum ada modul untuk level ini.
          </div>
        ) : (
          <div className="flex flex-col gap-2">
            {filtered.map(mod => {
              const reviewed = reviewedMap[mod.id] || 0
              const pct = mod.total_cards > 0 ? Math.round((reviewed / mod.total_cards) * 100) : 0

              return (
                <Card
                  key={mod.id}
                  hover
                  onClick={() => router.push(`/flashcard?moduleId=${mod.id}`)}
                  className="p-4"
                >
                  <div className="flex items-center justify-between gap-3">
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-0.5">
                        <p className="text-sm font-semibold text-[var(--text-primary)] truncate">{mod.name}</p>
                        {pct === 100 && <Badge variant="green">Selesai</Badge>}
                        {pct > 0 && pct < 100 && <Badge variant="blue">Sedang</Badge>}
                      </div>
                      {mod.description && (
                        <p className="text-xs text-[var(--text-muted)] truncate">{mod.description}</p>
                      )}
                      <div className="mt-2.5 flex items-center gap-2">
                        <div className="flex-1 h-1 bg-[var(--surface-2)] rounded-full overflow-hidden">
                          <div
                            className="h-full bg-[var(--accent)] rounded-full transition-all"
                            style={{ width: `${pct}%` }}
                          />
                        </div>
                        <span className="text-[10px] text-[var(--text-muted)] shrink-0">
                          {reviewed}/{mod.total_cards}
                        </span>
                      </div>
                    </div>
                    <ChevronRight size={16} className="text-[var(--text-muted)] shrink-0" />
                  </div>
                </Card>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}
