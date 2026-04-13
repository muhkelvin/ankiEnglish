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

function getInitials(name) {
  if (!name) return 'A'
  return name.split(' ').slice(0, 2).map(w => w[0]).join('').toUpperCase()
}

export default function AdminSidebar({ admin }) {
  const pathname = usePathname()
  const router = useRouter()

  async function logout() {
    const supabase = createClient()
    await supabase.auth.signOut()
    router.push('/login')
  }

  return (
    <aside style={{ width: 'var(--sidebar-w)' }} className="flex-shrink-0 bg-[var(--surface)] border-r border-[var(--border)] flex flex-col min-h-dvh sticky top-0 h-dvh overflow-y-auto">
      <div className="px-5 pt-6 pb-5 border-b border-[var(--border)]">
        <span className="text-lg font-semibold tracking-tight text-[var(--text-primary)]"
          style={{ fontFamily: "'Instrument Serif', serif" }}>
          EnglishAnki
        </span>
        <p className="text-[11px] text-[var(--text-muted)] mt-0.5">Admin Panel</p>
      </div>

      <nav className="flex-1 px-3 py-4 space-y-0.5">
        {nav.map(({ label, href, icon: Icon, exact }) => {
          const active = exact ? pathname === href : pathname.startsWith(href)
          return (
            <Link key={href} href={href} className={clsx(
              'flex items-center gap-3 px-3.5 py-2.5 rounded-[10px] text-sm font-medium transition-all',
              active
                ? 'bg-[var(--accent)] text-white shadow-sm'
                : 'text-[var(--text-secondary)] hover:bg-[var(--surface-2)] hover:text-[var(--text-primary)]'
            )}>
              <Icon size={16} strokeWidth={active ? 2.2 : 2} />
              {label}
            </Link>
          )
        })}
      </nav>

      <div className="p-3 border-t border-[var(--border)] space-y-1">
        <Link href="/" className="flex items-center gap-3 px-3.5 py-2.5 rounded-[10px] text-sm text-[var(--text-secondary)] hover:bg-[var(--surface-2)] transition-all">
          <Home size={15} /> Ke App
        </Link>
        <button onClick={logout} className="flex w-full items-center gap-3 px-3.5 py-2.5 rounded-[10px] text-sm text-[var(--red)] hover:bg-[var(--red-light)] transition-all">
          <LogOut size={15} /> Logout
        </button>
        <div className="flex items-center gap-3 px-3 pt-3 mt-1 border-t border-[var(--border)]">
          <div className="w-7 h-7 rounded-full bg-[var(--accent)] text-white text-xs font-bold flex items-center justify-center flex-shrink-0">
            {getInitials(admin?.name)}
          </div>
          <div className="min-w-0">
            <p className="text-xs font-medium text-[var(--text-primary)] truncate">{admin?.name}</p>
            <p className="text-[10px] text-[var(--text-muted)]">Administrator</p>
          </div>
        </div>
      </div>
    </aside>
  )
}
