'use client'

import { useState, useEffect } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { Button } from '@/components/ui/button'
import { Globe, Check } from 'lucide-react'

export function LanguageSelector() {
  const { language, changeLanguage, getAvailableLanguages, getLanguageName } = useTranslation()
  const [isOpen, setIsOpen] = useState(false)
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMounted(true)
  }, [])

  // Ne pas rendre le composant avant l'hydratation
  if (!mounted) {
    return (
      <div className="relative">
        <Button
          variant="ghost"
          size="sm"
          className="flex items-center gap-2 px-3 py-2 text-sm bg-white/90 backdrop-blur-sm border border-white/50 text-gray-900 hover:bg-white shadow-lg rounded-xl"
        >
          <Globe className="h-4 w-4" />
          <span className="hidden sm:inline">Français</span>
          <span className="sm:hidden">FR</span>
        </Button>
      </div>
    )
  }

  const availableLanguages = getAvailableLanguages()

  const handleLanguageChange = (lang: string) => {
    changeLanguage(lang as 'fr' | 'en')
    setIsOpen(false)
  }

  return (
    <div className="relative">
      <Button
        variant="ghost"
        size="sm"
        onClick={() => setIsOpen(!isOpen)}
        className="flex items-center gap-2 px-3 py-2 text-sm bg-white/90 backdrop-blur-sm border border-white/50 text-gray-900 hover:bg-white shadow-lg rounded-xl"
      >
        <Globe className="h-4 w-4" />
        <span className="hidden sm:inline" suppressHydrationWarning>{getLanguageName(language)}</span>
        <span className="sm:hidden" suppressHydrationWarning>{language.toUpperCase()}</span>
      </Button>

      {isOpen && (
        <div className="absolute top-full right-0 mt-2 bg-white rounded-lg shadow-lg border border-gray-200 py-2 z-50 min-w-[150px]">
          {availableLanguages.map((lang) => (
            <button
              key={lang}
              onClick={() => handleLanguageChange(lang)}
              className={`w-full px-4 py-2 text-left text-sm hover:bg-gray-50 flex items-center justify-between ${
                language === lang ? 'bg-blue-50 text-blue-600' : 'text-gray-700'
              }`}
            >
              <span>{getLanguageName(lang)}</span>
              {language === lang && <Check className="h-4 w-4" />}
            </button>
          ))}
        </div>
      )}

      {/* Overlay pour fermer le menu quand on clique ailleurs */}
      {isOpen && (
        <div
          className="fixed inset-0 z-40"
          onClick={() => setIsOpen(false)}
        />
      )}
    </div>
  )
} 