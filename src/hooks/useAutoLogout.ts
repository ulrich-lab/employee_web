import { useEffect, useRef } from 'react'
import { useRouter } from 'next/navigation'
import { useAuthStore } from '@/store/auth-store'

export function useAutoLogout() {
  const router = useRouter()
  const { logout } = useAuthStore()
  const timeoutRef = useRef<NodeJS.Timeout>()

  const resetTimer = () => {
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current)
    }
    
    // 5 minutes = 5 * 60 * 1000 = 300000ms
    timeoutRef.current = setTimeout(() => {
      logout()
      router.push('/user-type')
    }, 300000)
  }

  useEffect(() => {
    // Démarrer le timer
    resetTimer()

    // Événements à écouter pour l'activité utilisateur
    const events = ['mousedown', 'mousemove', 'keypress', 'scroll', 'touchstart', 'click']

    const handleActivity = () => {
      resetTimer()
    }

    // Ajouter les écouteurs d'événements
    events.forEach(event => {
      document.addEventListener(event, handleActivity, true)
    })

    // Nettoyer
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current)
      }
      events.forEach(event => {
        document.removeEventListener(event, handleActivity, true)
      })
    }
  }, [logout, router])
}
