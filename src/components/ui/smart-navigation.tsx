'use client'

import { useState, useMemo, useCallback } from 'react'
import { Search, X } from 'lucide-react'
import { Input } from '@/components/ui/input'
import { Button } from '@/components/ui/button'
import { useNavigationConfig } from './navigation-config'
import { useNavigation } from '@/hooks/useNavigation'
import { NavigationItem } from './navigation-item'
import { VirtualizedList, useNavigationList } from './virtualized-list'

interface SmartNavigationProps {
  variant: 'sidebar' | 'bottom'
  isCollapsed?: boolean
  showSearch?: boolean
  maxHeight?: number
}

export function SmartNavigation({ 
  variant, 
  isCollapsed = false, 
  showSearch = true,
  maxHeight = 400
}: SmartNavigationProps) {
  const [searchTerm, setSearchTerm] = useState('')
  const { navigationItems } = useNavigationConfig()
  const { navigate, isActive } = useNavigation()

  // Filtrer les éléments de navigation
  const filterNavigation = useCallback((item: any, search: string) => {
    if (!search) return true
    
    const searchLower = search.toLowerCase()
    return (
      item.label.toLowerCase().includes(searchLower) ||
      item.id.toLowerCase().includes(searchLower)
    )
  }, [])

  const { filteredItems, filteredCount, totalItems } = useNavigationList(
    navigationItems,
    searchTerm,
    filterNavigation
  )

  // Effacer la recherche
  const clearSearch = useCallback(() => {
    setSearchTerm('')
  }, [])

  // Navigation avec historique
  const handleNavigation = useCallback((href: string) => {
    navigate(href)
    // Effacer la recherche après navigation
    if (searchTerm) {
      setSearchTerm('')
    }
  }, [navigate, searchTerm])

  // Rendu d'un élément de navigation
  const renderNavigationItem = useCallback((item: any, index: number) => (
    <NavigationItem
      key={item.id}
      {...item}
      isActive={isActive(item.href)}
      onClick={handleNavigation}
      variant={variant}
      isCollapsed={isCollapsed}
    />
  ), [isActive, handleNavigation, variant, isCollapsed])

  // Afficher la recherche uniquement pour le sidebar et si activée
  const showSearchBar = showSearch && variant === 'sidebar' && !isCollapsed

  return (
    <div className="flex flex-col h-full">
      {/* Barre de recherche */}
      {showSearchBar && (
        <div className="p-3 border-b border-gray-200">
          <div className="relative">
            <Search className="absolute left-2 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
            <Input
              placeholder="Rechercher..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-8 pr-8 text-sm"
            />
            {searchTerm && (
              <Button
                variant="ghost"
                size="sm"
                onClick={clearSearch}
                className="absolute right-1 top-1/2 transform -translate-y-1/2 h-6 w-6 p-0"
              >
                <X className="h-3 w-3" />
              </Button>
            )}
          </div>
          {searchTerm && (
            <div className="mt-2 text-xs text-gray-500">
              {filteredCount} sur {totalItems} éléments
            </div>
          )}
        </div>
      )}

      {/* Liste de navigation */}
      <div className="flex-1 overflow-hidden">
        {variant === 'sidebar' && showSearch ? (
          // Utiliser la virtualisation pour le sidebar avec recherche
          <VirtualizedList
            items={filteredItems}
            height={maxHeight}
            itemHeight={36} // hauteur d'un élément de navigation
            renderItem={renderNavigationItem}
            overscan={3}
          />
        ) : (
          // Rendu simple pour la navigation mobile ou sans recherche
          <div className="p-4">
            <ul className="space-y-2">
              {filteredItems.map((item, index) => (
                <li key={item.id}>
                  {renderNavigationItem(item, index)}
                </li>
              ))}
            </ul>
          </div>
        )}
      </div>

      {/* Indicateur de résultats vides */}
      {searchTerm && filteredCount === 0 && (
        <div className="p-4 text-center text-gray-500 text-sm">
          Aucun résultat trouvé pour "{searchTerm}"
        </div>
      )}
    </div>
  )
}
