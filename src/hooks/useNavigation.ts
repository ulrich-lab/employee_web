import { useCallback } from 'react'
import { useRouter, usePathname } from 'next/navigation'

export function useNavigation() {
  const router = useRouter()
  const pathname = usePathname()

  const navigate = useCallback((href: string) => {
    // Navigation optimisée - pas de re-vérification d'auth
    if (pathname !== href) {
      router.push(href)
    }
  }, [pathname, router])

  const isActive = useCallback((href: string) => {
    return pathname === href
  }, [pathname])

  return {
    navigate,
    isActive,
    pathname
  }
}
