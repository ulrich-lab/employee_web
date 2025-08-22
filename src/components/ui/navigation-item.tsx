'use client'

import { memo } from 'react'
import { Button } from '@/components/ui/button'

interface NavigationItemProps {
  id: string
  label: string
  icon: React.ReactNode
  href: string
  isActive: boolean
  onClick: (href: string) => void
  variant?: 'sidebar' | 'bottom'
  isCollapsed?: boolean
}

export const NavigationItem = memo(function NavigationItem({
  id,
  label,
  icon,
  href,
  isActive,
  onClick,
  variant = 'sidebar',
  isCollapsed = false
}: NavigationItemProps) {
  const handleClick = () => onClick(href)

  if (variant === 'bottom') {
    return (
      <Button
        variant="ghost"
        size="sm"
        className={`flex flex-col items-center gap-0.5 h-12 w-full rounded-none transition-all duration-200 ${
          isActive 
            ? 'text-blue-600 bg-blue-50' 
            : 'text-gray-600 hover:bg-gray-50'
        }`}
        onClick={handleClick}
      >
        {icon}
        <span className="text-[10px] leading-tight">{label}</span>
      </Button>
    )
  }

  // Sidebar variant
  return (
    <Button
      variant={isActive ? 'default' : 'ghost'}
      className={`w-full justify-start h-9 transition-all duration-200 ${
        isActive 
          ? 'bg-blue-600 text-white hover:bg-blue-700' 
          : 'text-gray-700 hover:bg-gray-100'
      } ${isCollapsed ? 'justify-center' : ''}`}
      onClick={handleClick}
    >
      <div className={`flex items-center ${isCollapsed ? 'justify-center' : 'gap-3'}`}>
        {icon}
        {!isCollapsed && (
          <span className="flex-1 text-left text-sm">{label}</span>
        )}
      </div>
    </Button>
  )
})
