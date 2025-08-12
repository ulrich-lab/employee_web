"use client"

import { ApolloProvider } from '@apollo/client'
import { ThemeProvider } from '@/components/ui/theme-provider'
import { Toaster } from 'sonner'
import { apolloClient } from '@/lib/graphql/client'

interface ProvidersProps {
  children: React.ReactNode
}

export function Providers({ children }: ProvidersProps) {
  return (
    <ApolloProvider client={apolloClient}>
      <ThemeProvider
        attribute="class"
        defaultTheme="system"
        enableSystem
        disableTransitionOnChange
      >
        {children}
        <Toaster />
      </ThemeProvider>
    </ApolloProvider>
  )
} 