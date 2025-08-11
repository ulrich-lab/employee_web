'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { useAuthStore } from '@/store/auth-store'

export default function HomePage() {
  const router = useRouter()
  const { isAuthenticated, checkAuth } = useAuthStore()

  useEffect(() => {
    // Vérifier si l'utilisateur est déjà connecté
    const isUserAuthenticated = checkAuth()
    
    if (isUserAuthenticated || isAuthenticated) {
          router.push('/dashboard')
    } else {
      router.push('/user-type')
    }
  }, [isAuthenticated, checkAuth, router])

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-500 via-blue-600 to-blue-700 flex items-center justify-center">
      <div className="text-white text-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto mb-4"></div>
        <p>Vérification de l'authentification...</p>
        </div>
    </div>
  )
} 