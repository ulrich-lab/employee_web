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
        setLocation(config.staticLocation)
        setLoading(false)
        return config.staticLocation
      }

      // Pour FODECC, utiliser la géolocalisation dynamique avec optimisations iPhone
      return new Promise((resolve, reject) => {
        if (!navigator.geolocation) {
          const error = 'Géolocalisation non supportée par ce navigateur'
          setError(error)
          setLoading(false)
          reject(new Error(error))
          return
        }

        // Détecter si c'est un iPhone/iOS
        const isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent)

        // Options optimisées pour iPhone
        const options = {
          enableHighAccuracy: isIOS ? false : true,  // False pour iOS (plus fiable)
          timeout: isIOS ? 30000 : 15000,           // 30s pour iOS, 15s pour autres
          maximumAge: isIOS ? 300000 : 60000        // 5min pour iOS, 1min pour autres
        }

        navigator.geolocation.getCurrentPosition(
          (position) => {
            const newLocation: Location = {
              lat: position.coords.latitude,
              long: position.coords.longitude
            }
            setLocation(newLocation)
            setLoading(false)
            resolve(newLocation)
          },
          (error) => {
            let errorMessage = 'Erreur de géolocalisation'
            
            switch (error.code) {
              case error.PERMISSION_DENIED:
                errorMessage = isIOS 
                  ? 'Permission de géolocalisation refusée sur iPhone. Vérifiez les Paramètres > Confidentialité > Localisation'
                  : 'Permission de géolocalisation refusée'
                break
              case error.POSITION_UNAVAILABLE:
                errorMessage = isIOS
                  ? 'Localisation indisponible sur iPhone. Vérifiez que la localisation est activée dans les Paramètres'
                  : 'Informations de localisation indisponibles'
                break
              case error.TIMEOUT:
                errorMessage = isIOS
                  ? 'Délai de géolocalisation dépassé sur iPhone. Vérifiez votre connexion et les paramètres de localisation'
                  : 'Délai de géolocalisation dépassé'
                break
              default:
                errorMessage = isIOS
                  ? 'Erreur de géolocalisation sur iPhone. Vérifiez les paramètres de localisation'
                  : 'Erreur inconnue de géolocalisation'
                break
            }
            
            setError(errorMessage)
            setLoading(false)
            reject(new Error(errorMessage))
          },
          options
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
