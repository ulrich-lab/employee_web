import { format, parseISO } from 'date-fns'
import { fr } from 'date-fns/locale'
import { getCurrentConfig, isCNPS } from '@/lib/config/environments'

export const formatTime = (dateString: string | null | undefined): string => {
  if (!dateString) return '--:--'
  
  try {
    const date = parseISO(dateString)
    const config = getCurrentConfig()
    
    // Format différent selon l'environnement
    if (isCNPS()) {
      // Format CNPS : HH:mm:ss.SSSSSS
      return format(date, 'HH:mm:ss.SSSSSS')
    } else {
      // Format FODECC : HH'h'mm
      return format(date, "HH'h'mm", { locale: fr })
    }
  } catch (error) {
    console.error('Error formatting time:', error)
    return '--:--'
  }
}

export const formatDate = (dateString: string | null | undefined): string => {
  if (!dateString) return '--'
  
  try {
    const date = parseISO(dateString)
    const config = getCurrentConfig()
    
    // Format de date commun : EEEE d MMMM
    return format(date, 'EEEE d MMMM', { locale: fr })
  } catch (error) {
    console.error('Error formatting date:', error)
    return '--'
  }
}

export const formatDateTime = (dateString: string | null | undefined): string => {
  if (!dateString) return '--'
  
  try {
    const date = parseISO(dateString)
    const config = getCurrentConfig()
    
    if (isCNPS()) {
      // Format CNPS : date + heure complète
      return format(date, 'EEEE d MMMM à HH:mm:ss', { locale: fr })
    } else {
      // Format FODECC : date + heure simplifiée
      return format(date, "EEEE d MMMM à HH'h'mm", { locale: fr })
    }
  } catch (error) {
    console.error('Error formatting datetime:', error)
    return '--'
  }
}

export const getCurrentTime = (): string => {
  const now = new Date()
  const config = getCurrentConfig()
  
  if (isCNPS()) {
    return format(now, 'HH:mm:ss.SSSSSS')
  } else {
    return format(now, "HH'h'mm", { locale: fr })
  }
}

export const getCurrentDate = (): string => {
  const now = new Date()
  return format(now, 'EEEE d MMMM', { locale: fr })
}
