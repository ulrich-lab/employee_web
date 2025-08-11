'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { useAuthStore } from '@/store/auth-store'
import { Sidebar } from '@/components/layout/sidebar'
import { BottomNavigation } from '@/components/layout/bottom-navigation'
import { getCurrentConfig } from '@/lib/config/environments'

interface DashboardLayoutProps {
  children: React.ReactNode
}

export default function DashboardLayout({ children }: DashboardLayoutProps) {
  const router = useRouter()
  const { isAuthenticated, checkAuth, user } = useAuthStore()
  const [isInitialized, setIsInitialized] = useState(false)
  const config = getCurrentConfig()

  useEffect(() => {
    // Vérification d'authentification uniquement au montage du composant
    const initializeAuth = () => {
      const isUserAuthenticated = checkAuth()
      
      if (!isUserAuthenticated && !isAuthenticated) {
        router.push('/user-type')
      } else {
        setIsInitialized(true)
      }
    }

    // Vérification immédiate si les données sont déjà disponibles
    if (isAuthenticated) {
      setIsInitialized(true)
    } else {
      // Petit délai pour permettre l'hydratation du store
      const timer = setTimeout(initializeAuth, 50)
      return () => clearTimeout(timer)
    }
  }, []) // Dépendances vides pour ne s'exécuter qu'une fois

  // Loading state uniquement au démarrage
  if (!isInitialized) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-500 via-blue-600 to-blue-700 flex items-center justify-center">
        <div className="text-white text-center">
          <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-white mx-auto mb-3"></div>
          <p className="text-sm">Chargement...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="flex h-screen bg-gray-50">
      {/* Sidebar - Desktop only */}
      <div className="hidden md:block">
        <Sidebar />
      </div>

      {/* Main content */}
      <div className="flex-1 flex flex-col md:ml-0">
        {/* Mobile header */}
        <header className="md:hidden bg-white shadow-sm border-b px-4 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-9 h-9 bg-blue-600 rounded-full flex items-center justify-center">
                <span className="text-white font-semibold text-sm">V</span>
              </div>
              <div>
                <h1 className="text-base font-semibold text-gray-900">
                  {user?.name || 'Utilisateur'}
                </h1>
                <p className="text-xs text-gray-500">{config.companyName}</p>
              </div>
            </div>
            <div className="flex items-center gap-2">
              <button className="p-2 text-gray-600 hover:text-gray-900 transition-colors">
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 17h5l-5 5v-5z" />
                </svg>
              </button>
              <button className="p-2 text-gray-600 hover:text-gray-900 transition-colors">
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 17h5l-5 5v-5z" />
                </svg>
              </button>
            </div>
          </div>
        </header>

        {/* Content area */}
        <main className="flex-1 overflow-auto">
          <div className="p-4 md:p-6 pb-20 md:pb-6">
            {children}
          </div>
        </main>

        {/* Bottom navigation - Mobile only */}
        <BottomNavigation />
      </div>
    </div>
  )
} 