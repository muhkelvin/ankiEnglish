'use client'
import { useState } from 'react'
import { Trash2 } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'

export default function AdminDeleteCard({ cardId }) {
  const router = useRouter()
  const [loading, setLoading] = useState(false)

  async function handleDelete() {
    if (!confirm('Hapus kartu ini?')) return
    setLoading(true)
    const supabase = createClient()
    await supabase.from('cards').delete().eq('id', cardId)
    router.refresh()
  }

  return (
    <button
      onClick={handleDelete}
      disabled={loading}
      className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--red-light)] hover:text-[var(--red)] transition-all disabled:opacity-50"
    >
      <Trash2 size={13} />
    </button>
  )
}
