import { clsx } from 'clsx'

const variants = {
  default: 'bg-[var(--surface-2)] text-[var(--text-secondary)]',
  blue: 'bg-[var(--accent-light)] text-[var(--accent)]',
  green: 'bg-[var(--green-light)] text-[var(--green)]',
  red: 'bg-[var(--red-light)] text-[var(--red)]',
  amber: 'bg-[var(--amber-light)] text-[var(--amber)]',
}

export default function Badge({ children, variant = 'default', className }) {
  return (
    <span className={clsx(
      'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium',
      variants[variant],
      className
    )}>
      {children}
    </span>
  )
}
