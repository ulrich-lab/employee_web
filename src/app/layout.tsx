import type { Metadata } from 'next'
import './globals.css'
import { Providers } from '@/components/providers'
import { DynamicTitle } from '@/components/DynamicTitle'

export const metadata: Metadata = {
  title: 'VVIMS - Plateforme de gestion',
  description: 'Plateforme de gestion des employés',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="fr" suppressHydrationWarning data-scroll-behavior="smooth">
      <body className="font-sans antialiased">
        <DynamicTitle />
        <Providers>
          {children}
        </Providers>
      </body>
    </html>
  )
} 