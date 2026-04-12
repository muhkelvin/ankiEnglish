import './globals.css'
import { Plus_Jakarta_Sans, Instrument_Serif } from 'next/font/google'

const jakarta = Plus_Jakarta_Sans({
  subsets: ['latin'],
  weight: ['400', '500', '600', '700'],
  variable: '--font-jakarta',
})

const serif = Instrument_Serif({
  subsets: ['latin'],
  weight: ['400'],
  style: ['normal', 'italic'],
  variable: '--font-serif',
})

export const metadata = {
  title: 'EnglishAnki — Belajar Grammar dengan Flashcard',
  description: 'Flashcard SRS untuk belajar grammar bahasa Inggris.',
}

export default function RootLayout({ children }) {
  return (
    <html
      lang="id"
      className={`${jakarta.variable} ${serif.variable}`}
    >
      <body>{children}</body>
    </html>
  )
}