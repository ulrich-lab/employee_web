'use client'

import { useNavigationConfig } from '@/components/ui/navigation-config'
import { useNavigation } from '@/hooks/useNavigation'
import { NavigationItem } from '@/components/ui/navigation-item'

export function BottomNavigation() {
  const { navigationItems } = useNavigationConfig()
  const { navigate, isActive } = useNavigation()

  return (
    <nav className="fixed bottom-0 left-0 right-0 bg-white border-t shadow-lg md:hidden z-50">
      <div className="flex justify-around h-12">
        {navigationItems.map((item) => (
          <NavigationItem
            key={item.id}
            {...item}
            isActive={isActive(item.href)}
            onClick={navigate}
            variant="bottom"
          />
        ))}
      </div>
    </nav>
  )
} 