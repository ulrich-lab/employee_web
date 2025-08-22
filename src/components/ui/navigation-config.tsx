import { useMemo } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { 
  Home, 
  Users, 
  Calendar, 
  MessageSquare, 
  User, 
  Activity 
} from 'lucide-react'

export function useNavigationConfig() {
  const { t } = useTranslation()

  // Memoizer les icônes pour éviter la recréation
  const icons = useMemo(() => ({
    home: <Home className="h-4 w-4" />,
    users: <Users className="h-4 w-4" />,
    calendar: <Calendar className="h-4 w-4" />,
    messageSquare: <MessageSquare className="h-4 w-4" />,
    user: <User className="h-4 w-4" />,
    activity: <Activity className="h-4 w-4" />,
  }), [])

  // Memoizer la configuration de navigation
  const navigationItems = useMemo(() => [
    {
      id: 'dashboard',
      label: t('navigation.dashboard'),
      icon: icons.home,
      href: '/dashboard',
    },
    {
      id: 'visitors',
      label: t('navigation.visitors'),
      icon: icons.users,
      href: '/dashboard/visitors',
    },
    {
      id: 'attendance',
      label: t('navigation.attendance'),
      icon: icons.activity,
      href: '/dashboard/attendance',
    },
    {
      id: 'schedule',
      label: t('navigation.schedule'),
      icon: icons.calendar,
      href: '/dashboard/schedule',
    },
    {
      id: 'messages',
      label: t('navigation.messages'),
      icon: icons.messageSquare,
      href: '/dashboard/messages',
    },
    {
      id: 'profile',
      label: t('navigation.profile'),
      icon: icons.user,
      href: '/dashboard/profile',
    },
  ], [t, icons])

  return {
    navigationItems,
    icons
  }
}
