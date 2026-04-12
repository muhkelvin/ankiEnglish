import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import { Plus, Pencil, Trash2 } from 'lucide-react'
import Card from '@/components/ui/Card'
import Button from '@/components/ui/Button'
import Badge from '@/components/ui/Badge'
import AdminDeleteCard from '@/components/admin/AdminDeleteCard'

export default async function AdminCardsPage({ searchParams }) {
  const { levelId, moduleId } = await searchParams
  const supabase = await createClient()

  const [{ data: levels }, { data: modules }] = await Promise.all([
    supabase.from('levels').select('id, name').order('order'),
    supabase.from('modules').select('id, name, level_id').order('order'),
  ])

  let query = supabase.from('cards').select('*, modules(name)').eq('is_system', true).order('created_at', { ascending: false })
  if (moduleId) query = query.eq('module_id', moduleId)
  else if (levelId) {
    const mids = modules?.filter(m => m.level_id === levelId).map(m => m.id)
    if (mids?.length) query = query.in('module_id', mids)
  }
  const { data: cards } = await query.limit(100)

  const typeLabel = { fill_blank: 'Fill Blank', multiple_choice: 'Pilihan Ganda', error_correction: 'Error Correction' }
  const typeBadge = { fill_blank: 'blue', multiple_choice: 'amber', error_correction: 'default' }

  return (
    <div className="page-enter space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-[var(--text-primary)]">Kelola Kartu</h1>
          <p className="text-sm text-[var(--text-muted)] mt-0.5">{cards?.length || 0} kartu ditemukan</p>
        </div>
        <Link href="/admin/cards/new">
          <Button size="sm"><Plus size={13} /> Tambah Kartu</Button>
        </Link>
      </div>

      {/* Filters */}
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

      <Card className="divide-y divide-[var(--border)]">
        {!cards?.length ? (
          <div className="py-10 text-center text-sm text-[var(--text-muted)]">Belum ada kartu.</div>
        ) : cards.map(card => (
          <div key={card.id} className="flex items-start gap-3 px-4 py-3.5">
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2 mb-1">
                <Badge variant={typeBadge[card.type]}>{typeLabel[card.type]}</Badge>
                <span className="text-[10px] text-[var(--text-muted)]">{card.modules?.name}</span>
              </div>
              <p className="text-sm text-[var(--text-primary)] line-clamp-1">{card.question}</p>
              <p className="text-xs text-[var(--text-muted)] mt-0.5 line-clamp-1">{card.answer}</p>
            </div>
            <div className="flex gap-1 shrink-0">
              <Link href={`/admin/cards/${card.id}/edit`}>
                <button className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] hover:text-[var(--accent)] transition-all">
                  <Pencil size={13} />
                </button>
              </Link>
              <AdminDeleteCard cardId={card.id} />
            </div>
          </div>
        ))}
      </Card>
    </div>
  )
}
