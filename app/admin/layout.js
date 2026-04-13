import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import AdminSidebar from '@/components/admin/AdminSidebar'

export default async function AdminLayout({ children }) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('users')
    .select('role, name')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') redirect('/')

  return (
    <div style={{ display: 'flex', minHeight: '100dvh' }}>
      <AdminSidebar admin={profile} />
      <main style={{ flex: 1, minWidth: 0, padding: '32px 40px', overflowY: 'auto' }}>
        <div style={{ maxWidth: '860px', margin: '0 auto' }} className="page-enter">
          {children}
        </div>
      </main>
    </div>
  )
}
