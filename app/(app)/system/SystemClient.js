'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { ChevronRight, CheckCircle } from 'lucide-react'
import { clsx } from 'clsx'

const LEVEL_COLORS = {
  A1: 'level-a1',
  A2: 'level-a2',
  B1: 'level-b1',
  B2: 'level-b2',
}

export default function SystemClient({ levels, modules, reviewedMap }) {
  const router = useRouter()
  const [activeLevel, setActiveLevel] = useState(levels[0]?.id || null)

  const filtered = modules.filter(m => m.level_id === activeLevel)
  const activeLevel_ = levels.find(l => l.id === activeLevel)
  const levelClass = LEVEL_COLORS[activeLevel_?.name] || 'level-a1'

  return (
    <div className="page-enter space-y-8">
      <div className="page-header">
        <h1>Pilih Modul</h1>
        <p>Pilih level lalu mulai sesi belajar</p>
      </div>

      {/* Level selector — card style */}
      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-widest mb-4">Level</p>
        <div className="card-grid-2">
          {levels.map(level => {
            const cls = LEVEL_COLORS[level.name] || 'level-a1'
            const active = activeLevel === level.id
            const levelModules = modules.filter(m => m.level_id === level.id)
            const reviewed = levelModules.reduce((sum, m) => sum + (reviewedMap[m.id] || 0), 0)
            const total = levelModules.reduce((sum, m) => sum + (m.total_cards || 0), 0)
            const pct = total > 0 ? Math.round((reviewed / total) * 100) : 0
            return (
              <button
                key={level.id}
                onClick={() => setActiveLevel(level.id)}
                className={clsx(
                  cls,
                  'rounded-[var(--radius)] p-5 text-left transition-all border-2',
                  active
                    ? 'border-[var(--lc)] shadow-md scale-[1.01]'
                    : 'border-transparent bg-[var(--surface)] hover:border-[var(--lc)] hover:shadow-sm shadow-[var(--shadow-sm)]'
                )}
                style={active ? { background: 'var(--lc-bg)' } : { background: 'var(--surface)' }}
              >
                <div className="flex items-start justify-between gap-2 mb-3">
                  <span
                    className="text-2xl font-black tracking-tight"
                    style={{ color: active ? 'var(--lc)' : 'var(--text-primary)' }}
                  >
                    {level.name}
                  </span>
                  {pct === 100 && (
                    <CheckCircle size={16} style={{ color: 'var(--lc)' }} className="flex-shrink-0 mt-1" />
                  )}
                </div>
                <p className="text-sm font-medium mb-1" style={{ color: active ? 'var(--lc)' : 'var(--text-secondary)' }}>
                  {level.label}
                </p>
                <p className="text-xs" style={{ color: active ? 'var(--lc)' : 'var(--text-muted)', opacity: 0.8 }}>
                  {levelModules.length} modul
                  {total > 0 && ` · ${pct}%`}
                </p>
              </button>
            )
          })}
        </div>
      </div>

      {/* Modules */}
      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-widest mb-4">
          Modul {activeLevel_?.name}
        </p>

        {filtered.length === 0 ? (
          <div className="text-center py-16 text-[var(--text-muted)] text-sm bg-[var(--surface)] rounded-[var(--radius)] border border-[var(--border)]">
            Belum ada modul untuk level ini.
          </div>
        ) : (
          <div className="space-y-2.5">
            {filtered.map(mod => {
              const reviewed = reviewedMap[mod.id] || 0
              const pct = mod.total_cards > 0 ? Math.round((reviewed / mod.total_cards) * 100) : 0
              const done = pct === 100
              const inProgress = pct > 0 && pct < 100

              return (
                <button
                  key={mod.id}
                  onClick={() => router.push(`/flashcard?moduleId=${mod.id}`)}
                  className="w-full bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-4 text-left card-hover shadow-[var(--shadow-sm)] group"
                >
                  <div className="flex items-center justify-between gap-4">
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-1">
                        <p className="text-sm font-semibold text-[var(--text-primary)] truncate">{mod.name}</p>
                        {done && (
                          <span className="text-[10px] font-semibold px-2 py-0.5 rounded-full bg-[var(--green-light)] text-[var(--green)] border border-[var(--green-muted)] flex-shrink-0">
                            Selesai
                          </span>
                        )}
                        {inProgress && (
                          <span className="text-[10px] font-semibold px-2 py-0.5 rounded-full bg-[var(--accent-light)] text-[var(--accent)] border border-[var(--accent-muted)] flex-shrink-0">
                            Berlangsung
                          </span>
                        )}
                      </div>
                      {mod.description && (
                        <p className="text-xs text-[var(--text-muted)] mb-2.5">{mod.description}</p>
                      )}
                      <div className="flex items-center gap-2.5">
                        <div className="flex-1 h-1 bg-[var(--surface-2)] rounded-full overflow-hidden">
                          <div
                            className="h-full rounded-full transition-all"
                            style={{
                              width: `${pct}%`,
                              background: done ? 'var(--green)' : 'var(--accent)'
                            }}
                          />
                        </div>
                        <span className="text-[11px] text-[var(--text-muted)] shrink-0 font-medium tabular-nums">
                          {reviewed}/{mod.total_cards}
                        </span>
                      </div>
                    </div>
                    <ChevronRight
                      size={16}
                      className="text-[var(--text-muted)] flex-shrink-0 group-hover:text-[var(--accent)] group-hover:translate-x-0.5 transition-all"
                    />
                  </div>
                </button>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}
