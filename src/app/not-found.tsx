'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { AlertCircle, Home, ArrowLeft } from 'lucide-react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { useLogger } from '@/lib/utils/logger'

export default function NotFound() {
  const router = useRouter()
  const { t } = useTranslation()
  const logger = useLogger('NotFound')

  useEffect(() => {
    // Logger l'erreur 404 pour le monitoring
    logger.warn('404 - Page not found')
  }, [logger])

  const handleGoHome = () => {
    router.push('/dashboard')
  }

  const handleGoBack = () => {
    router.back()
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <Card className="max-w-md w-full">
        <CardHeader className="text-center">
          <div className="mx-auto mb-4 p-3 bg-red-100 rounded-full w-fit">
            <AlertCircle className="h-8 w-8 text-red-600" />
          </div>
          <CardTitle className="text-xl font-bold text-gray-900">
            {t('errors.notFound.title')}
          </CardTitle>
        </CardHeader>
        
        <CardContent className="space-y-4">
          <p className="text-gray-600 text-center">
            {t('errors.notFound.message')}
          </p>
          
          <div className="flex gap-3">
            <Button
              onClick={handleGoBack}
              variant="outline"
              className="flex-1"
            >
              <ArrowLeft className="h-4 w-4 mr-2" />
              {t('errors.notFound.back')}
            </Button>
            
            <Button
              onClick={handleGoHome}
              className="flex-1 bg-blue-600 hover:bg-blue-700"
            >
              <Home className="h-4 w-4 mr-2" />
              {t('errors.notFound.home')}
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
