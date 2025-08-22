'use client'

import { useState, useMemo, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { useAuthStore } from '@/store/auth-store'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { LanguageSelector } from '@/components/ui/language-selector'
import { useNavigationConfig } from '@/components/ui/navigation-config'
import { useNavigation } from '@/hooks/useNavigation'
import { NavigationItem } from '@/components/ui/navigation-item'
import { 
  Shield, 
  LogOut, 
  User,
  ChevronLeft,
  ChevronRight
} from 'lucide-react'
import toast from 'react-hot-toast'

export function Sidebar() {
  const router = useRouter()
  const { t } = useTranslation()
  const { user, logout } = useAuthStore()
  const [isCollapsed, setIsCollapsed] = useState(false)
  
  const { navigationItems, icons } = useNavigationConfig()
  const { navigate, isActive } = useNavigation()

  // Memoizer les icônes spécifiques au sidebar
  const sidebarIcons = useMemo(() => ({
    shield: <Shield className="h-7 w-7 text-blue-600" />,
    chevronLeft: <ChevronLeft className="h-3 w-3" />,
    chevronRight: <ChevronRight className="h-3 w-3" />,
    user: <User className="h-4 w-4 text-white" />,
  }), [])

  // Memoizer handleLogout pour éviter la recréation
  const handleLogout = useCallback(() => {
    logout()
    toast.success('Déconnexion réussie')
    router.push('/user-type')
  }, [logout, router])

  // Memoizer les classes CSS pour éviter la recréation
  const sidebarClasses = useMemo(() => 
    `h-screen bg-white border-r border-gray-200 transition-all duration-300 ${
      isCollapsed ? 'w-16' : 'w-64'
    }`, [isCollapsed]
  )

  const toggleButtonClasses = useMemo(() => 
    `${isCollapsed ? 'mx-auto' : ''} h-7 w-7 p-0 hover:bg-gray-100 transition-colors`, [isCollapsed]
  )

  return (
    <div className={sidebarClasses}>
      {/* Header */}
      <div className="flex items-center justify-between p-4 border-b border-gray-200">
        {!isCollapsed && (
          <div className="flex items-center gap-2">
            {sidebarIcons.shield}
            <div className="flex items-baseline gap-1">
              <span className="text-base font-bold text-gray-900">vvims</span>
              <span className="text-xs text-gray-400 font-normal">v1.0.1</span>
            </div>
          </div>
        )}
        <Button
          variant="ghost"
          size="sm"
          onClick={() => setIsCollapsed(!isCollapsed)}
          className={toggleButtonClasses}
        >
          {isCollapsed ? sidebarIcons.chevronRight : sidebarIcons.chevronLeft}
        </Button>
      </div>

      {/* User Profile */}
      <div className="p-4 border-b border-gray-200">
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 bg-blue-600 rounded-full flex items-center justify-center">
            {sidebarIcons.user}
          </div>
          {!isCollapsed && (
            <div className="flex-1 min-w-0">
              <p className="text-xs font-medium text-gray-900 truncate">
                {user?.name || 'Utilisateur'}
              </p>
              <p className="text-xs text-gray-500 truncate">
                {user?.type === 'admin' ? 'Administrateur' : 'Employé'}
              </p>
            </div>
          )}
        </div>
      </div>

      {/* Navigation */}
      <nav className="flex-1 p-4">
        <ul className="space-y-2">
          {navigationItems.map((item) => (
            <li key={item.id}>
              <NavigationItem
                {...item}
                isActive={isActive(item.href)}
                onClick={navigate}
                variant="sidebar"
                isCollapsed={isCollapsed}
              />
            </li>
          ))}
        </ul>
      </nav>

    </div>
  )
} 