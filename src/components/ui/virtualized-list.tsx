'use client'

import { memo, useMemo, useCallback, useState, useEffect, useRef } from 'react'

interface VirtualizedListProps<T> {
  items: T[]
  height: number
  itemHeight: number
  renderItem: (item: T, index: number) => React.ReactNode
  overscan?: number
}

export function VirtualizedList<T>({
  items,
  height,
  itemHeight,
  renderItem,
  overscan = 5
}: VirtualizedListProps<T>) {
  const [scrollTop, setScrollTop] = useState(0)
  const containerRef = useRef<HTMLDivElement>(null)

  // Calculer les éléments visibles
  const visibleRange = useMemo(() => {
    const start = Math.floor(scrollTop / itemHeight)
    const end = Math.min(
      start + Math.ceil(height / itemHeight) + overscan,
      items.length
    )
    
    return {
      start: Math.max(0, start - overscan),
      end
    }
  }, [scrollTop, itemHeight, height, overscan, items.length])

  // Gérer le scroll
  const handleScroll = useCallback((e: React.UIEvent<HTMLDivElement>) => {
    setScrollTop(e.currentTarget.scrollTop)
  }, [])

  // Scroll vers un élément spécifique
  const scrollToItem = useCallback((index: number) => {
    if (containerRef.current) {
      containerRef.current.scrollTop = index * itemHeight
    }
  }, [itemHeight])

  // Calculer la hauteur totale du contenu
  const totalHeight = items.length * itemHeight

  // Calculer le décalage pour les éléments visibles
  const offsetY = visibleRange.start * itemHeight

  return (
    <div
      ref={containerRef}
      style={{ height, overflow: 'auto' }}
      onScroll={handleScroll}
      className="scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-gray-100"
    >
      <div style={{ height: totalHeight, position: 'relative' }}>
        <div style={{ transform: `translateY(${offsetY}px)` }}>
          {items.slice(visibleRange.start, visibleRange.end).map((item, index) => (
            <div key={visibleRange.start + index}>
              {renderItem(item, visibleRange.start + index)}
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}

// Hook pour optimiser les listes de navigation
export function useNavigationList<T>(
  items: T[],
  searchTerm: string = '',
  filterFn?: (item: T, search: string) => boolean
) {
  const filteredItems = useMemo(() => {
    if (!searchTerm || !filterFn) return items
    
    return items.filter(item => filterFn(item, searchTerm))
  }, [items, searchTerm, filterFn])

  const sortedItems = useMemo(() => {
    // Trier par ordre alphabétique ou par priorité
    return [...filteredItems].sort((a, b) => {
      // Logique de tri personnalisée ici
      return 0
    })
  }, [filteredItems])

  return {
    filteredItems: sortedItems,
    totalItems: items.length,
    filteredCount: filteredItems.length
  }
}
