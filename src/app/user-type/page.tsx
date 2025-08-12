'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Shield, Crown, Users, Eye, EyeOff } from 'lucide-react'
import Link from 'next/link'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { LanguageSelector } from '@/components/ui/language-selector'
import { useAuthStore } from '@/store/auth-store'
import toast from 'react-hot-toast'

export default function UserTypePage() {
  const router = useRouter()
  const { t } = useTranslation()
  const { login, isLoading, error, clearError, checkAuth } = useAuthStore()
  
  const [switchToLogin, setSwitchToLogin] = useState(false)
  const [phoneNumber, setPhoneNumber] = useState('')
  const [password, setPassword] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [selectedUserType, setSelectedUserType] = useState<'admin' | 'staff' | null>(null)

  // Vérifier si l'utilisateur est déjà connecté
  useEffect(() => {
    const isUserAuthenticated = checkAuth()
    if (isUserAuthenticated) {
      router.push('/dashboard')
    }
  }, [checkAuth, router])

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    
    if (!selectedUserType) {
      toast.error(t('userType.selectUserType'))
      return
    }

    if (!phoneNumber.trim() || !password.trim()) {
      toast.error(t('userType.fillAllFields'))
      return
    }

    try {
      clearError()
      await login(phoneNumber, password, selectedUserType)
      toast.success(t('userType.loginSuccess'))
      router.push('/dashboard')
    } catch (error) {
      const errorMessage = error instanceof Error ? error.message : t('userType.loginError')
      toast.error(errorMessage)
    }
  }

  const handleTypeSelection = (type: 'admin' | 'staff') => {
    setSelectedUserType(type)
    setSwitchToLogin(true)
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-500 via-blue-600 to-blue-700 relative">
      {/* Language selector - Desktop */}
      <div className="hidden md:block absolute top-6 right-6 z-50">
        <LanguageSelector />
      </div>

      {/* Desktop Layout (width > 768px) */}
      <div className="hidden md:flex h-screen">
        {/* Left side - Illustration */}
        <div className="flex-1 flex items-center justify-center bg-gradient-to-br from-blue-500 via-blue-600 to-blue-700 relative overflow-hidden">
          {/* Background gradient */}
          <div className="absolute inset-0 bg-gradient-to-br from-blue-400 to-blue-600 opacity-30"></div>
          
          {/* Decorative elements */}
          <div className="absolute top-20 left-20 w-32 h-32 bg-white/10 rounded-full blur-xl"></div>
          <div className="absolute bottom-20 right-20 w-24 h-24 bg-cyan-400/20 rounded-full blur-lg"></div>
          
          {/* Type icon */}
          <div className="relative z-10">
            <div className="w-64 h-64 bg-white/10 backdrop-blur-sm rounded-full flex items-center justify-center border border-white/20 shadow-2xl">
              <Shield className="h-32 w-32 text-white drop-shadow-lg" />
            </div>
          </div>
        </div>

        {/* Right side - Login/Type Selection */}
        <div className="w-1/3 p-8">
          <Card className="h-full shadow-2xl border-0 bg-white rounded-2xl overflow-hidden">
            <CardContent className="h-full flex flex-col justify-center p-8">
              {!switchToLogin ? (
                <div className="space-y-6 animate-fade-in">
                  <div className="text-center mb-8">
                    <h2 className="text-2xl font-bold text-gray-900 mb-2">
                      {t('userType.title')}
                    </h2>
                    <p className="text-gray-600">
                      {t('userType.subtitle')}
                    </p>
                  </div>
                  
                  <Button
                    onClick={() => handleTypeSelection('admin')}
                    className="w-full h-14 text-lg font-semibold bg-blue-600 hover:bg-blue-700 text-white rounded-xl shadow-lg transition-all duration-200 hover:scale-105"
                  >
                    <Crown className="h-5 w-5 mr-3" />
                    {t('userType.admin')}
                  </Button>
                  
                  <Button
                    onClick={() => handleTypeSelection('staff')}
                    variant="outline"
                    className="w-full h-14 text-lg font-semibold border-2 border-blue-600 text-blue-600 hover:bg-blue-50 rounded-xl shadow-sm transition-all duration-200 hover:scale-105"
                  >
                    <Users className="h-5 w-5 mr-3" />
                    {t('userType.staff')}
                  </Button>
                </div>
              ) : (
                <form onSubmit={handleLogin} className="space-y-6 animate-slide-up">
                  <div className="text-center mb-8">
                    <h2 className="text-2xl font-bold text-gray-900 mb-2">
                      {t('userType.login')}
                    </h2>
                    <p className="text-gray-600">
                      {t('userType.loginSubtitle')} - {selectedUserType === 'admin' ? t('userType.admin') : t('userType.staff')}
                    </p>
                  </div>
                  
                  <div className="space-y-4">
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
                  </div>
                </form>
              )}
            </CardContent>
          </Card>
        </div>
      </div>

      {/* Mobile Layout (width <= 768px) */}
      <div className="md:hidden flex flex-col h-screen">
        {/* Language selector - Mobile */}
        <div className="absolute top-4 right-4 z-50">
          <LanguageSelector />
        </div>

        {/* Top spacer */}
        <div className="flex-1"></div>
        
        {/* Type icon */}
        <div className="flex justify-center mb-8 animate-bounce-gentle">
          <div className="w-48 h-48 bg-white/10 backdrop-blur-sm rounded-full flex items-center justify-center border border-white/20 shadow-2xl">
            <Shield className="h-24 w-24 text-white drop-shadow-lg" />
          </div>
        </div>
        
        {/* Buttons */}
        <div className="px-4 space-y-4 mb-8">
          <Button
            onClick={() => router.push('/login?type=admin')}
            className="w-full h-14 text-lg font-semibold bg-white/20 backdrop-blur-sm hover:bg-white/30 text-white border border-white/30 rounded-xl shadow-lg transition-all duration-200 hover:scale-105"
          >
            <Crown className="h-5 w-5 mr-3" />
            {t('userType.admin')}
          </Button>
          
          <Button
            onClick={() => router.push('/login?type=staff')}
            variant="outline"
            className="w-full h-14 text-lg font-semibold border-2 border-white/50 text-white hover:bg-white/20 rounded-xl shadow-sm transition-all duration-200 hover:scale-105 backdrop-blur-sm"
          >
            <Users className="h-5 w-5 mr-3" />
            {t('userType.staff')}
          </Button>
        </div>
        
        {/* Bottom spacer */}
        <div className="flex-1"></div>
      </div>
    </div>
  )
} 