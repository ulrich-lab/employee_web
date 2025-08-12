'use client'

import { useState } from 'react'
import { useRouter, usePathname } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { useAuthStore } from '@/store/auth-store'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { LanguageSelector } from '@/components/ui/language-selector'
import { 
  Shield, 
  LogOut, 
  Home, 
  Users, 
  Calendar, 
  MessageSquare,
  Settings,
  Bell,
  QrCode,
  User,
  ChevronLeft,
  ChevronRight
} from 'lucide-react'
import toast from 'react-hot-toast'

interface SidebarItem {
  id: string
  label: string
  icon: React.ReactNode
  href: string
  badge?: number
}

export function Sidebar() {
  const router = useRouter()
  const pathname = usePathname()
  const { t } = useTranslation()
  const { user, logout } = useAuthStore()
  const [isCollapsed, setIsCollapsed] = useState(false)

  const handleLogout = () => {
    logout()
    toast.success('Déconnexion réussie')
    router.push('/user-type')
  }

  const handleNavigation = (href: string) => {
    // Navigation optimisée - pas de re-vérification d'auth
    if (pathname !== href) {
      router.push(href)
    }
  }

  const sidebarItems: SidebarItem[] = [
    {
      id: 'dashboard',
      label: t('navigation.dashboard'),
      icon: <Home className="h-4 w-4" />,
      href: '/dashboard',
    },
    {
      id: 'visitors',
      label: t('navigation.visitors'),
      icon: <Users className="h-4 w-4" />,
      href: '/dashboard/visitors',
    },
    {
      id: 'schedule',
      label: t('navigation.schedule'),
      icon: <Calendar className="h-4 w-4" />,
      href: '/dashboard/schedule',
    },
    {
      id: 'messages',
      label: t('navigation.messages'),
      icon: <MessageSquare className="h-4 w-4" />,
      href: '/dashboard/messages',
    },
    {
      id: 'profile',
      label: t('navigation.profile'),
      icon: <User className="h-4 w-4" />,
      href: '/dashboard/profile',
    },
  ]

  return (
    <div className={`h-screen bg-white border-r border-gray-200 transition-all duration-300 ${
      isCollapsed ? 'w-16' : 'w-64'
    }`}>
      {/* Header */}
      <div className="flex items-center justify-between p-4 border-b border-gray-200">
        {!isCollapsed && (
          <div className="flex items-center gap-2">
            <Shield className="h-7 w-7 text-blue-600" />
            <span className="text-base font-bold text-gray-900">vvims </span>
          </div>
        )}
        <Button
          variant="ghost"
          size="sm"
          onClick={() => setIsCollapsed(!isCollapsed)}
          className={`${isCollapsed ? 'mx-auto' : ''} h-7 w-7 p-0 hover:bg-gray-100 transition-colors`}
        >
          {isCollapsed ? (
            <ChevronRight className="h-3 w-3" />
          ) : (
            <ChevronLeft className="h-3 w-3" />
          )}
        </Button>
      </div>

      {/* User Profile */}
      <div className="p-4 border-b border-gray-200">
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 bg-blue-600 rounded-full flex items-center justify-center">
            <User className="h-4 w-4 text-white" />
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
          {sidebarItems.map((item) => {
            const isActive = pathname === item.href
            return (
              <li key={item.id}>
                <Button
                  variant={isActive ? 'default' : 'ghost'}
                  className={`w-full justify-start h-9 transition-all duration-200 ${
                    isActive 
                      ? 'bg-blue-600 text-white hover:bg-blue-700' 
                      : 'text-gray-700 hover:bg-gray-100'
                  } ${isCollapsed ? 'justify-center' : ''}`}
                  onClick={() => handleNavigation(item.href)}
                >
                  <div className={`flex items-center ${isCollapsed ? 'justify-center' : 'gap-3'}`}>
                    {item.icon}
                    {!isCollapsed && (
                      <span className="flex-1 text-left text-sm">{item.label}</span>
                    )}
                  </div>
                </Button>
              </li>
            )
          })}
        </ul>
      </nav>

    </div>
  )
} 