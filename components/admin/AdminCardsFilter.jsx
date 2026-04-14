'use client'

export default function AdminCardsFilter({ levels, modules, levelId, moduleId }) {
  return (
    <div className="flex gap-2 flex-wrap">
      <select
        className="text-xs border border-[var(--border)] rounded-[8px] px-3 py-1.5 bg-[var(--surface)] text-[var(--text-primary)] focus:outline-none focus:border-[var(--accent)]"
        onChange={e => {
          const url = new URL(window.location.href)
          if (e.target.value) url.searchParams.set('levelId', e.target.value)
          else url.searchParams.delete('levelId')
          url.searchParams.delete('moduleId')
          window.location.href = url.toString()
        }}
        defaultValue={levelId || ''}
      >
        <option value="">Semua Level</option>
        {levels?.map(l => <option key={l.id} value={l.id}>{l.name}</option>)}
      </select>

      <select
        className="text-xs border border-[var(--border)] rounded-[8px] px-3 py-1.5 bg-[var(--surface)] text-[var(--text-primary)] focus:outline-none focus:border-[var(--accent)]"
        onChange={e => {
          const url = new URL(window.location.href)
          if (e.target.value) url.searchParams.set('moduleId', e.target.value)
          else url.searchParams.delete('moduleId')
          window.location.href = url.toString()
        }}
        defaultValue={moduleId || ''}
      >
        <option value="">Semua Modul</option>
        {modules?.map(m => <option key={m.id} value={m.id}>{m.name}</option>)}
      </select>
    </div>
  )
}