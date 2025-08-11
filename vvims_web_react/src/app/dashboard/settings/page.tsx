'use client'

import { useTranslation } from '@/lib/i18n/useTranslation'
import { Settings } from 'lucide-react'

export default function SettingsPage() {
  const { t } = useTranslation()

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center gap-3">
        <div className="p-2 bg-gray-100 rounded-lg">
          <Settings className="h-5 w-5 text-gray-600" />
        </div>
        <div>
          <h1 className="text-xl font-bold text-gray-900">
            {t('navigation.settings')}
          </h1>
          <p className="text-sm text-gray-600">
            Configuration et paramètres de l'application
          </p>
        </div>
      </div>

      {/* Content */}
      <div className="bg-white rounded-lg border border-gray-200 p-8">
        <div className="text-center">
          <Settings className="h-14 w-14 text-gray-400 mx-auto mb-4" />
          <h2 className="text-lg font-semibold text-gray-900 mb-2">
            Page Paramètres
          </h2>
          <p className="text-sm text-gray-600 max-w-md mx-auto">
            Cette page sera utilisée pour configurer les paramètres de l'application, 
            gérer les préférences, les notifications et les options système.
          </p>
        </div>
      </div>
    </div>
  )
} 