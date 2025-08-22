'use client'

import { memo } from 'react'
import { 
  Home, 
  Users, 
  Calendar, 
  MessageSquare, 
  User, 
  Activity,
  Shield,
  ChevronLeft,
  ChevronRight,
  Settings,
  Bell,
  QrCode,
  LogOut,
  LucideProps
} from 'lucide-react'

interface IconProps extends LucideProps {
  name: string
}

// Composant Icon optimisé avec memo
export const Icon = memo(function Icon({ 
  name, 
  className = "h-4 w-4", 
  size = 16, 
  color,
  ...props
}: IconProps) {
  // Mapping des noms d'icônes vers les composants
  const iconMap = {
    home: Home,
    users: Users,
    calendar: Calendar,
    messageSquare: MessageSquare,
    user: User,
    activity: Activity,
    shield: Shield,
    chevronLeft: ChevronLeft,
    chevronRight: ChevronRight,
    settings: Settings,
    bell: Bell,
    qrCode: QrCode,
    logOut: LogOut,
  }

  const IconComponent = iconMap[name as keyof typeof iconMap]

  if (!IconComponent) {
    console.warn(`Icon "${name}" not found`)
    return (
      <div 
        className={`${className} bg-gray-200 animate-pulse rounded`}
        style={{ 
          width: size, 
          height: size,
          backgroundColor: color || '#e5e7eb'
        }}
      />
    )
  }

  return (
    <IconComponent 
      className={className}
      size={size}
      color={color}
      {...props}
    />
  )
})
