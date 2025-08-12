import { useState, useCallback, useEffect } from 'react'
import { translations, Language } from './translations'
import { getCurrentConfig } from '@/lib/config/environments'

// Fonction pour détecter la langue du navigateur
const detectBrowserLanguage = (): Language => {
  if (typeof window === 'undefined') return 'fr'
  
  // Récupérer la langue du navigateur
  const browserLang = navigator.language || navigator.languages?.[0] || 'fr'
  
  // Extraire le code de langue principal (fr, en, etc.)
  const langCode = browserLang.split('-')[0].toLowerCase()
  
  // Vérifier si la langue est supportée
  if (langCode === 'en') return 'en'
  if (langCode === 'fr') return 'fr'
  
  // Par défaut, retourner français
  return 'fr'
}

// Fonction pour obtenir la langue depuis localStorage ou détecter automatiquement
const getInitialLanguage = (): Language => {
  if (typeof window === 'undefined') return 'fr'
  
  // Essayer de récupérer depuis localStorage
  const savedLanguage = localStorage.getItem('language') as Language
  if (savedLanguage && (savedLanguage === 'fr' || savedLanguage === 'en')) {
    return savedLanguage
  }
  
  // Sinon, détecter automatiquement
  return detectBrowserLanguage()
}

export function useTranslation() {
  const [language, setLanguage] = useState<Language>('fr') // État initial cohérent
  const [isClient, setIsClient] = useState(false)
  const config = getCurrentConfig()

  // Initialiser la langue au démarrage côté client uniquement
  useEffect(() => {
    setIsClient(true)
    const initialLang = getInitialLanguage()
    setLanguage(initialLang)
    localStorage.setItem('language', initialLang)
  }, [])

  const t = useCallback((key: string, params?: Record<string, string>) => {
    const keys = key.split('.')
    let value: any = translations[language]
    
    for (const k of keys) {
      value = value?.[k]
    }
    
    if (typeof value !== 'string') {
      console.warn(`Translation key not found: ${key} for language: ${language}`)
      // Essayer de récupérer la traduction en français si elle n'existe pas dans la langue actuelle
      if (language !== 'fr') {
        let fallbackValue: any = translations.fr
        for (const k of keys) {
          fallbackValue = fallbackValue?.[k]
        }
        if (typeof fallbackValue === 'string') {
          return fallbackValue
        }
      }
      return key
    }
    
    // Remplacer dynamiquement le nom de l'entreprise
    if (value.includes('FODECC / CCODEF')) {
      value = value.replace('FODECC / CCODEF', config.companyDisplayName)
    }
    
    if (params) {
      return Object.entries(params).reduce((str, [key, val]) => {
        return str.replace(new RegExp(`{{${key}}}`, 'g'), val)
      }, value)
    }
    
    return value
  }, [language, config.companyDisplayName])

  const changeLanguage = useCallback((lang: Language) => {
    setLanguage(lang)
    localStorage.setItem('language', lang)
    
    // Mettre à jour l'attribut lang du document HTML
    if (typeof document !== 'undefined') {
      document.documentElement.lang = lang
    }
  }, [])

  // Fonction pour obtenir la liste des langues disponibles
  const getAvailableLanguages = useCallback(() => {
    return Object.keys(translations) as Language[]
  }, [])

  // Fonction pour obtenir le nom de la langue
  const getLanguageName = useCallback((lang: Language) => {
    const languageNames = {
      fr: 'Français',
      en: 'English'
    }
    return languageNames[lang] || lang
  }, [])

  // Fonction pour formater les dates selon la langue
  const formatDate = useCallback((date: Date | string, options?: Intl.DateTimeFormatOptions) => {
    const dateObj = typeof date === 'string' ? new Date(date) : date
    const locale = language === 'fr' ? 'fr-FR' : 'en-US'
    
    return dateObj.toLocaleDateString(locale, options)
  }, [language])

  // Fonction pour formater les nombres selon la langue
  const formatNumber = useCallback((number: number, options?: Intl.NumberFormatOptions) => {
    const locale = language === 'fr' ? 'fr-FR' : 'en-US'
    return number.toLocaleString(locale, options)
  }, [language])

  // Fonction pour formater la monnaie selon la langue
  const formatCurrency = useCallback((amount: number, currency: string = 'XAF') => {
    const locale = language === 'fr' ? 'fr-FR' : 'en-US'
    return new Intl.NumberFormat(locale, {
      style: 'currency',
      currency: currency
    }).format(amount)
  }, [language])

  return {
    t,
    language,
    changeLanguage,
    getAvailableLanguages,
    getLanguageName,
    formatDate,
    formatNumber,
    formatCurrency,
  }
} 