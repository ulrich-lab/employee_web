'use client'

import { useState, useEffect } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Eye, EyeOff, ArrowLeft } from 'lucide-react'
import Link from 'next/link'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { LanguageSelector } from '@/components/ui/language-selector'
import { useAuthStore } from '@/store/auth-store'
import toast from 'react-hot-toast'
import { Suspense } from 'react'

export default function LoginPage() {
  return (
    <Suspense>
      <LoginPageContent />
    </Suspense>
  )
}

function LoginPageContent() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const { t } = useTranslation()
  const { login, isLoading, error, clearError, checkAuth } = useAuthStore()
  
  const [phoneNumber, setPhoneNumber] = useState('')
  const [password, setPassword] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [userType, setUserType] = useState<'admin' | 'staff' | null>(null)

  useEffect(() => {
    const isUserAuthenticated = checkAuth()
    if (isUserAuthenticated) {
      router.push('/dashboard')
      return
    }

    const type = searchParams.get('type') as 'admin' | 'staff'
    if (type && (type === 'admin' || type === 'staff')) {
      setUserType(type)
    } else {
      router.push('/user-type')
    }
  }, [searchParams, router, checkAuth])

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!userType) {
      toast.error('Type d\'utilisateur non défini')
      return
    }
    if (!phoneNumber.trim() || !password.trim()) {
      toast.error('Veuillez remplir tous les champs')
      return
    }
    try {
      clearError()
      await login(phoneNumber, password, userType)
      toast.success('Connexion réussie !')
      router.push('/dashboard')
    } catch (error) {
      const errorMessage = error instanceof Error ? error.message : 'Erreur de connexion'
      toast.error(errorMessage)
    }
  }

  if (!userType) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-500 via-blue-600 to-blue-700 flex items-center justify-center">
        <div className="text-white text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto mb-4"></div>
          <p>Chargement...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-500 via-blue-600 to-blue-700 relative">
      {/* Language selector */}
      <div className="absolute top-6 right-6 z-50">
        <LanguageSelector />
      </div>

      {/* Back button */}
      <div className="absolute top-6 left-6 z-50">
        <Button
          variant="ghost"
          size="sm"
          onClick={() => router.back()}
          className="flex items-center gap-2 px-4 py-2 text-sm bg-white/90 backdrop-blur-sm border border-white/50 text-gray-900 hover:bg-white shadow-lg rounded-xl"
        >
          <ArrowLeft className="h-4 w-4" />
          <span className="hidden sm:inline">{t('userType.back')}</span>
        </Button>
      </div>

      {/* Main content */}
      <div className="flex items-center justify-center min-h-screen p-4">
        <Card className="w-full max-w-md shadow-2xl border-0 bg-white rounded-2xl overflow-hidden">
          <CardContent className="p-8">
            <div className="text-center mb-8">
              <h2 className="text-2xl font-bold text-gray-900 mb-2">
                {t('userType.login')}
              </h2>
              <p className="text-gray-600">
                {t('userType.loginSubtitle')} - {userType === 'admin' ? t('userType.admin') : t('userType.staff')}
              </p>
            </div>
            
            <form onSubmit={handleLogin} className="space-y-6">
              <div className="space-y-2">
                <Label htmlFor="phoneNumber" className="text-gray-700 font-medium">
                  {t('userType.emailPlaceholder')}
                </Label>
                <Input
                  id="phoneNumber"
                  type="text"
                  placeholder={t('userType.emailPlaceholder')}
                  value={phoneNumber}
                  onChange={(e) => setPhoneNumber(e.target.value)}
                  required
                  className="h-12 text-base rounded-xl border-gray-300 focus:border-blue-500 focus:ring-blue-500 transition-all duration-200"
                />
              </div>
              
              <div className="space-y-2">
                <Label htmlFor="password" className="text-gray-700 font-medium">
                  {t('userType.passwordPlaceholder')}
                </Label>
                <div className="relative">
                  <Input
                    id="password"
                    type={showPassword ? 'text' : 'password'}
                    placeholder={t('userType.passwordPlaceholder')}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                    className="h-12 text-base rounded-xl border-gray-300 focus:border-blue-500 focus:ring-blue-500 pr-12 transition-all duration-200"
                  />
                  <button
                    type="button"
                    className="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-gray-700 transition-colors"
                    onClick={() => setShowPassword(!showPassword)}
                  >
                    {showPassword ? (
                      <EyeOff className="h-5 w-5" />
                    ) : (
                      <Eye className="h-5 w-5" />
                    )}
                  </button>
                </div>
              </div>

              <div className="text-left">
                <Link 
                  href="/forgot-password" 
                  className="text-sm text-blue-600 hover:text-blue-700 font-medium transition-colors"
                >
                  {t('userType.forgotPassword')}
                </Link>
              </div>

              <Button 
                type="submit" 
                className="w-full h-12 text-base font-semibold rounded-xl shadow-lg bg-blue-600 hover:bg-blue-700 transition-all duration-200 hover:scale-105" 
                disabled={isLoading}
              >
                {isLoading ? t('userType.loading') : t('userType.loginButton')}
              </Button>
            </form>
          </CardContent>
        </Card>
      </div>
    </div>
  )
} 
