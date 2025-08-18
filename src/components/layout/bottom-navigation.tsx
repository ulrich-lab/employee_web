'use client'

import { Home, Users, Calendar, MessageSquare, User, Activity } from 'lucide-react'
import { usePathname, useRouter } from 'next/navigation'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { Button } from '@/components/ui/button'

export function BottomNavigation() {
  const { t } = useTranslation()
  const router = useRouter()
  const pathname = usePathname()

  const handleNavigation = (href: string) => {
    // Navigation optimisée - pas de re-vérification d'auth
    if (pathname !== href) {
      router.push(href)
    }
  }

  const navigationItems = [
    {
      id: 'dashboard',
      label: t('navigation.dashboard'),
      icon: <Home className="h-3 w-3" />,
      href: '/dashboard',
    },
    {
      id: 'attendance',
      label: 'Présence',
      icon: <Activity className="h-3 w-3" />,
      href: '/dashboard/attendance',
    },
    {
      id: 'schedule',
      label: t('navigation.schedule'),
      icon: <Calendar className="h-3 w-3" />,
      href: '/dashboard/schedule',
    },
    {
      id: 'messages',
      label: t('navigation.messages'),
      icon: <MessageSquare className="h-3 w-3" />,
      href: '/dashboard/messages',
    },
    {
      id: 'profile',
      label: t('navigation.profile'),
      icon: <User className="h-3 w-3" />,
      href: '/dashboard/profile',
    },
  ]

  return (
    <nav className="fixed bottom-0 left-0 right-0 bg-white border-t shadow-lg md:hidden z-50">
      <div className="flex justify-around h-12">
        {navigationItems.map((item) => {
          const isActive = pathname === item.href
          return (
            <Button
              key={item.id}
              variant="ghost"
              size="sm"
              className={`flex flex-col items-center gap-0.5 h-12 w-full rounded-none transition-all duration-200 ${
                isActive 
                  ? 'text-blue-600 bg-blue-50' 
                  : 'text-gray-600 hover:bg-gray-50'
              }`}
              onClick={() => handleNavigation(item.href)}
            >
              {item.icon}
              <span className="text-[10px] leading-tight">{item.label}</span>
            </Button>
          )
        })}
      </div>
    </nav>
  )
} 