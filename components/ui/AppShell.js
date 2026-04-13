'use client'
import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { clsx } from 'clsx'
import {
  LayoutGrid, BookOpen, PenSquare, BarChart2,
  LogOut, Settings, ChevronDown, Shield
} from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { useState, useRef, useEffect } from 'react'

const navItems = [
  { label: 'Home',      href: '/',         icon: LayoutGrid, exact: true },
  { label: 'Sistem',    href: '/system',   icon: BookOpen },
  { label: 'Kartu Saya',href: '/my-cards', icon: PenSquare },
  { label: 'Statistik', href: '/stats',    icon: BarChart2 },
]

function getInitials(name) {
  if (!name) return '?'
  return name.split(' ').slice(0, 2).map(w => w[0]).join('').toUpperCase()
}

export default function AppShell({ children, profile }) {
  const pathname = usePathname()
  const router = useRouter()
  const [dropdownOpen, setDropdownOpen] = useState(false)
  const dropRef = useRef(null)

  useEffect(() => {
    function close(e) {
      if (dropRef.current && !dropRef.current.contains(e.target)) {
        setDropdownOpen(false)
      }
    }
    document.addEventListener('mousedown', close)
    return () => document.removeEventListener('mousedown', close)
  }, [])

  async function handleLogout() {
    const supabase = createClient()
    await supabase.auth.signOut()
    router.push('/login')
    router.refresh()
  }

  function isActive(href, exact) {
    if (exact) return pathname === href
    return pathname === href || pathname.startsWith(href + '/')
  }

  return (
    <div className="app-shell">
      {/* ── Desktop Sidebar ─────────────────────── */}
      <aside className="app-sidebar">
        {/* Brand */}
        <div className="px-5 pt-6 pb-5 border-b border-[var(--border)]">
          <span
            className="text-lg font-semibold tracking-tight text-[var(--text-primary)]"
            style={{ fontFamily: "'Instrument Serif', serif" }}
          >
            EnglishAnki
          </span>
          <p className="text-[11px] text-[var(--text-muted)] mt-0.5">Flashcard SRS</p>
        </div>

        {/* Nav links */}
        <nav className="flex-1 px-3 py-4 space-y-0.5">
          {navItems.map(({ label, href, icon: Icon, exact }) => {
            const active = isActive(href, exact)
            return (
              <Link
                key={href}
                href={href}
                className={clsx(
                  'flex items-center gap-3 px-3.5 py-2.5 rounded-[10px] text-sm font-medium transition-all',
                  active
                    ? 'bg-[var(--accent)] text-white shadow-sm'
                    : 'text-[var(--text-secondary)] hover:bg-[var(--surface-2)] hover:text-[var(--text-primary)]'
                )}
              >
                <Icon size={16} strokeWidth={active ? 2.2 : 2} />
                {label}
              </Link>
            )
          })}

          {/* Admin link – only for admins */}
          {profile?.role === 'admin' && (
            <Link
              href="/admin"
              className={clsx(
                'flex items-center gap-3 px-3.5 py-2.5 rounded-[10px] text-sm font-medium transition-all mt-2',
                pathname.startsWith('/admin')
                  ? 'bg-[var(--purple-light)] text-[var(--purple)] border border-[var(--purple)]/20'
                  : 'text-[var(--text-muted)] hover:bg-[var(--surface-2)] hover:text-[var(--text-primary)]'
              )}
            >
              <Shield size={16} strokeWidth={2} />
              Admin Panel
            </Link>
          )}
        </nav>

        {/* User profile footer */}
        <div className="px-3 pb-4 border-t border-[var(--border)] pt-3" ref={dropRef}>
          <button
            onClick={() => setDropdownOpen(p => !p)}
            className="w-full flex items-center gap-3 px-3 py-2.5 rounded-[10px] hover:bg-[var(--surface-2)] transition-all group"
          >
            <div className="w-8 h-8 rounded-full bg-[var(--accent)] text-white text-xs font-bold flex items-center justify-center flex-shrink-0">
              {getInitials(profile?.name)}
            </div>
            <div className="flex-1 min-w-0 text-left">
              <p className="text-sm font-medium text-[var(--text-primary)] truncate leading-tight">
                {profile?.name || 'Pengguna'}
              </p>
              <p className="text-[11px] text-[var(--text-muted)] capitalize">{profile?.role || 'user'}</p>
            </div>
            <ChevronDown
              size={14}
              className={clsx(
                'text-[var(--text-muted)] transition-transform flex-shrink-0',
                dropdownOpen && 'rotate-180'
              )}
            />
          </button>

          {/* Dropdown */}
          {dropdownOpen && (
            <div className="mt-1.5 bg-[var(--surface)] border border-[var(--border)] rounded-[10px] shadow-[var(--shadow)] overflow-hidden scale-in">
              <button
                onClick={handleLogout}
                className="flex w-full items-center gap-2.5 px-4 py-2.5 text-sm text-[var(--red)] hover:bg-[var(--red-light)] transition-all"
              >
                <LogOut size={14} />
                Keluar
              </button>
            </div>
          )}
        </div>
      </aside>

      {/* ── Content area ───────────────────────── */}
      <div className="app-content">
        <main className="app-main page-enter">
          {children}
        </main>
      </div>

      {/* ── Mobile Bottom Nav ────────────────────── */}
      <nav className="bottom-nav">
        <div className="grid grid-cols-4 w-full">
          {navItems.map(({ label, href, icon: Icon, exact }) => {
            const active = isActive(href, exact)
            return (
              <Link
                key={href}
                href={href}
                className={clsx(
                  'flex flex-col items-center gap-1 py-1.5 px-2 transition-all',
                  active ? 'text-[var(--accent)]' : 'text-[var(--text-muted)]'
                )}
              >
                <div className={clsx(
                  'p-1.5 rounded-[8px] transition-all',
                  active && 'bg-[var(--accent-light)]'
                )}>
                  <Icon size={18} strokeWidth={active ? 2.2 : 1.8} />
                </div>
                <span className={clsx('text-[10px] font-medium', active && 'font-semibold')}>
                  {label}
                </span>
              </Link>
            )
          })}
        </div>
      </nav>
    </div>
  )
}
