import { useState, useEffect } from 'react'
import { getCurrentConfig, isCNPS } from '@/lib/config/environments'

export interface Location {
  lat: number
  long: number
}

export interface UseLocationReturn {
  location: Location | null
  loading: boolean
  error: string | null
  getCurrentLocation: () => Promise<Location>
}

export const useLocation = (): UseLocationReturn => {
  const [location, setLocation] = useState<Location | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  
  const config = getCurrentConfig()

  // Fonction pour obtenir la localisation actuelle
  const getCurrentLocation = async (): Promise<Location> => {
    setLoading(true)
    setError(null)

    try {
      // Si CNPS, utiliser les coordonnées statiques
      if (isCNPS() && config.useStaticLocation && config.staticLocation) {
        console.log('📍 Using static location for CNPS:', config.staticLocation)
        setLocation(config.staticLocation)
        setLoading(false)
        return config.staticLocation
      }

      // Pour FODECC, utiliser la géolocalisation dynamique
      return new Promise((resolve, reject) => {
        if (!navigator.geolocation) {
          const error = 'Géolocalisation non supportée par ce navigateur'
          setError(error)
          setLoading(false)
          reject(new Error(error))
          return
        }

        navigator.geolocation.getCurrentPosition(
          (position) => {
            const newLocation: Location = {
              lat: position.coords.latitude,
              long: position.coords.longitude
            }
            console.log('📍 Dynamic location obtained:', newLocation)
            setLocation(newLocation)
            setLoading(false)
            resolve(newLocation)
          },
          (error) => {
            let errorMessage = 'Erreur de géolocalisation'
            
            switch (error.code) {
              case error.PERMISSION_DENIED:
                errorMessage = 'Permission de géolocalisation refusée'
                break
              case error.POSITION_UNAVAILABLE:
                errorMessage = 'Informations de localisation indisponibles'
                break
              case error.TIMEOUT:
                errorMessage = 'Délai de géolocalisation dépassé'
                break
              default:
                errorMessage = 'Erreur inconnue de géolocalisation'
                break
            }
            
            setError(errorMessage)
            setLoading(false)
            reject(new Error(errorMessage))
          },
          {
            enableHighAccuracy: true,
            timeout: 10000,
            maximumAge: 60000
          }
        )
      })
    } catch (err) {
      const errorMessage = err instanceof Error ? err.message : 'Erreur de géolocalisation'
      setError(errorMessage)
      setLoading(false)
      throw err
    }
  }

  // Initialiser la localisation au montage du composant
  useEffect(() => {
    getCurrentLocation().catch(() => {
      // Erreur déjà gérée dans getCurrentLocation
    })
  }, [])

  return {
    location,
    loading,
    error,
    getCurrentLocation
  }
}
