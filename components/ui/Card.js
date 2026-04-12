import { clsx } from 'clsx'

export default function Card({ children, className, hover, onClick, ...props }) {
  return (
    <div
      className={clsx(
        'bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)]',
        'shadow-[var(--shadow-sm)]',
        hover && 'card-hover cursor-pointer',
        className
      )}
      onClick={onClick}
      {...props}
    >
      {children}
    </div>
  )
}
