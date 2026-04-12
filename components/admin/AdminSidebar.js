'use client'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { LayoutDashboard, Layers, BookOpen, CreditCard, Users, LogOut, Home } from 'lucide-react'
import { clsx } from 'clsx'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'

const nav = [
  { label: 'Dashboard', href: '/admin', icon: LayoutDashboard, exact: true },
  { label: 'Level', href: '/admin/levels', icon: Layers },
  { label: 'Modul', href: '/admin/modules', icon: BookOpen },
  { label: 'Kartu', href: '/admin/cards', icon: CreditCard },
  { label: 'Users', href: '/admin/users', icon: Users },
]

export default function AdminSidebar({ admin }) {
  const pathname = usePathname()
  const router = useRouter()

  async function logout() {
    const supabase = createClient()
    await supabase.auth.signOut()
    router.push('/login')
  }

  return (
    <aside className="w-52 shrink-0 bg-[var(--surface)] border-r border-[var(--border)] flex flex-col min-h-dvh">
      <div className="p-4 border-b border-[var(--border)]">
        <p className="font-semibold text-sm text-[var(--text-primary)]" style={{ fontFamily: "'Instrument Serif', serif" }}>
          EnglishAnki
        </p>
        <p className="text-[10px] text-[var(--text-muted)] mt-0.5">Admin Panel</p>
      </div>

      <nav className="flex-1 p-3 space-y-0.5">
        {nav.map(({ label, href, icon: Icon, exact }) => {
          const active = exact ? pathname === href : pathname.startsWith(href)
          return (
            <Link key={href} href={href} className={clsx(
              'flex items-center gap-2.5 px-3 py-2 rounded-[8px] text-sm transition-all',
              active
                ? 'bg-[var(--accent)] text-white font-medium'
                : 'text-[var(--text-secondary)] hover:bg-[var(--surface-2)] hover:text-[var(--text-primary)]'
            )}>
              <Icon size={15} strokeWidth={2} />
              {label}
            </Link>
          )
        })}
      </nav>

      <div className="p-3 border-t border-[var(--border)] space-y-0.5">
        <Link href="/" className="flex items-center gap-2.5 px-3 py-2 rounded-[8px] text-sm text-[var(--text-secondary)] hover:bg-[var(--surface-2)] transition-all">
          <Home size={15} /> Ke App
        </Link>
        <button onClick={logout} className="flex w-full items-center gap-2.5 px-3 py-2 rounded-[8px] text-sm text-[var(--text-secondary)] hover:bg-[var(--red-light)] hover:text-[var(--red)] transition-all">
          <LogOut size={15} /> Logout
        </button>
        <div className="px-3 pt-2">
          <p className="text-xs font-medium text-[var(--text-primary)] truncate">{admin?.name}</p>
          <p className="text-[10px] text-[var(--text-muted)]">Administrator</p>
        </div>
      </div>
    </aside>
  )
}
