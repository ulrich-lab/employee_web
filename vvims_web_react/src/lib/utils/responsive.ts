import { useEffect, useState } from 'react'

// Configuration responsive comme flutter_screenutil
const DESIGN_WIDTH = 360
const DESIGN_HEIGHT = 800
const MIN_WIDTH = 320
const MAX_WIDTH = 1920

export interface ResponsiveConfig {
  width: number
  height: number
  scale: number
  isMobile: boolean
  isTablet: boolean
  isDesktop: boolean
}

export function useResponsive(): ResponsiveConfig {
  const [dimensions, setDimensions] = useState<ResponsiveConfig>({
    width: 0,
    height: 0,
    scale: 1,
    isMobile: false,
    isTablet: false,
    isDesktop: false,
  })

  useEffect(() => {
    function updateDimensions() {
      const width = window.innerWidth
      const height = window.innerHeight
      
      // Calcul du scale comme flutter_screenutil
      const scaleX = width / DESIGN_WIDTH
      const scaleY = height / DESIGN_HEIGHT
      const scale = Math.min(scaleX, scaleY, 1.5) // Limite max à 1.5
      
      // Détermination du type d'écran
      const isMobile = width < 768
      const isTablet = width >= 768 && width < 1024
      const isDesktop = width >= 1024
      
      setDimensions({
        width,
        height,
        scale,
        isMobile,
        isTablet,
        isDesktop,
      })
    }

    updateDimensions()
    window.addEventListener('resize', updateDimensions)
    
    return () => window.removeEventListener('resize', updateDimensions)
  }, [])

  return dimensions
}

// Fonction pour calculer les tailles responsives
export function getResponsiveSize(size: number, config: ResponsiveConfig): number {
  return Math.round(size * config.scale)
}

// Fonction pour obtenir les classes CSS responsives
export function getResponsiveClasses(
  mobile: string,
  tablet: string = mobile,
  desktop: string = tablet
): string {
  return `${mobile} md:${tablet} lg:${desktop}`
}

// Hook pour les breakpoints
export function useBreakpoints() {
  const { isMobile, isTablet, isDesktop } = useResponsive()
  
  return {
    isMobile,
    isTablet,
    isDesktop,
    isSmallScreen: isMobile,
    isMediumScreen: isTablet,
    isLargeScreen: isDesktop,
  }
} 