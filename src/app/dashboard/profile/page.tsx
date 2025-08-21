'use client'

import React, { useState } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { User, Edit, Save, X, Eye, EyeOff, Camera, MapPin, Phone, Mail, Building, Briefcase, Calendar, Shield, Key, LogOut, Settings, Globe } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { useAuthStore } from '@/store/auth-store'
import { useEmployeeProfile, useUpdateEmployeeProfile, useChangePassword, useWorkSites, useUpdateEmployeeWorkSite, useEmployeeWorkSite } from '@/lib/graphql/hooks'
import { useRouter } from 'next/navigation'
import { Select, SelectOption } from '@/components/ui/select'
import { isFODECC, getCurrentConfig } from '@/lib/config/environments'
import { WorkSite } from '@/types'
import { toast } from 'sonner'

export default function ProfilePage() {
  const { t, language, changeLanguage, getLanguageName } = useTranslation()
  const { user, logout } = useAuthStore()
  const router = useRouter()
  const [isEditing, setIsEditing] = useState(false)
  const [isChangingPassword, setIsChangingPassword] = useState(false)
  const [showPassword, setShowPassword] = useState(false)
  const [showNewPassword, setShowNewPassword] = useState(false)
  const [showConfirmPassword, setShowConfirmPassword] = useState(false)
  const [showLanguageModal, setShowLanguageModal] = useState(false)
  const [showSettingsModal, setShowSettingsModal] = useState(false)

  // Form states
  const [formData, setFormData] = useState({
    firstname: user?.firstname || '',
    lastname: user?.lastname || '',
    email: user?.email || '',
    phone_number: user?.phone_number || '',
    address: user?.address || '',
    region: user?.region || '',
  })

  const [passwordData, setPasswordData] = useState({
    old_password: '',
    new_password: '',
    confirm_password: '',
  })

  // GraphQL hooks
  const { profile, loading: profileLoading } = useEmployeeProfile(user?.id || '')
  const { updateProfile, loading: updateLoading } = useUpdateEmployeeProfile()
  const { changePassword, loading: passwordLoading } = useChangePassword()
  const { workSites, loading: workSitesLoading } = useWorkSites(profile?.company_id)
  const { updateWorkSite, loading: updateWorkSiteLoading } = useUpdateEmployeeWorkSite()
  const { workSite: currentWorkSite, loading: currentWorkSiteLoading } = useEmployeeWorkSite(user?.id)
  
  // Configuration de l'environnement
  const config = getCurrentConfig()
  
  // État pour la zone de travail
  const [selectedWorkSite, setSelectedWorkSite] = useState<string>('')
  
  // Convertir les work sites en options pour le select
  const workSiteOptions: SelectOption[] = (workSites as WorkSite[]).map((site: WorkSite) => ({
    value: site.id,
    label: site.name
  }))

  const handleInputChange = (field: string, value: string) => {
    setFormData(prev => ({ ...prev, [field]: value }))
  }
  
  // Initialiser la zone de travail sélectionnée quand le profil se charge
  React.useEffect(() => {
    if (profile?.work_site_id) {
      setSelectedWorkSite(profile.work_site_id)
    }
  }, [profile?.work_site_id])

  const handlePasswordChange = (field: string, value: string) => {
    setPasswordData(prev => ({ ...prev, [field]: value }))
  }

  const handleSaveProfile = async () => {
    try {
      await updateProfile({
        id: user?.id || '',
        ...formData
      })
      setIsEditing(false)
    } catch (error) {
      console.error('Erreur lors de la mise à jour du profil:', error)
    }
  }

  const handleChangePassword = async () => {
    if (passwordData.new_password !== passwordData.confirm_password) {
      alert('Les mots de passe ne correspondent pas')
      return
    }

    try {
      await changePassword({
        id: user?.id || '',
        old_password: passwordData.old_password,
        new_password: passwordData.new_password,
      })
      setIsChangingPassword(false)
      setPasswordData({
        old_password: '',
        new_password: '',
        confirm_password: '',
      })
    } catch (error) {
      console.error('Erreur lors du changement de mot de passe:', error)
    }
  }
  
  const handleWorkSiteUpdate = async () => {
    if (!user?.id || !selectedWorkSite) return
    
    try {
      await updateWorkSite({
        id: user.id,
        work_site_id: selectedWorkSite
      })
      toast.success('Zone de travail mise à jour avec succès')
    } catch (error) {
      console.error('Erreur lors de la mise à jour de la zone de travail:', error)
    }
  }

  const formatDate = (dateString: string) => {
    const locale = language === 'fr' ? 'fr-FR' : 'en-US'
    return new Date(dateString).toLocaleDateString(locale, {
      day: 'numeric',
      month: 'long',
      year: 'numeric'
    })
  }

  const handleLogout = () => {
    logout()
    router.push('/user-type')
  }

  const handleLanguageChange = (newLanguage: string) => {
    changeLanguage(newLanguage as 'fr' | 'en')
    setShowLanguageModal(false)
  }

  const handleSettings = () => {
    setShowSettingsModal(true)
  }

  if (profileLoading) {
    return (
      <div className="flex items-center justify-center h-full">
        <div className="text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Chargement du profil...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-3">
          <div className="p-2 bg-blue-100 rounded-lg">
            <User className="h-5 w-5 text-blue-600" />
          </div>
          <div>
            <h1 className="text-lg font-semibold text-gray-900">
              {t('navigation.profile')}
            </h1>
            <p className="text-sm text-gray-600">
              {t('profile.personalInfo')}
            </p>
          </div>
        </div>
        <div className="flex gap-2">
          {!isEditing && (
            <Button
              onClick={() => setIsEditing(true)}
              size="sm"
              variant="outline"
            >
              <Edit className="h-4 w-4 mr-2" />
              {t('common.edit')}
            </Button>
          )}
          {isEditing && (
            <>
              <Button
                onClick={() => setIsEditing(false)}
                size="sm"
                variant="outline"
              >
                <X className="h-4 w-4 mr-2" />
                {t('common.cancel')}
              </Button>
              <Button
                onClick={handleSaveProfile}
                disabled={updateLoading}
                size="sm"
                className="bg-blue-600 hover:bg-blue-700"
              >
                <Save className="h-4 w-4 mr-2" />
                {t('common.save')}
              </Button>
            </>
          )}
        </div>
      </div>

      <div className="grid gap-6 md:grid-cols-2">
        {/* Profile Information */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-sm">
              <User className="h-5 w-5 text-blue-600" />
              {t('profile.personalInfo')}
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            {/* Profile Picture */}
            <div className="flex items-center gap-4">
              <div className="w-16 h-16 bg-gray-200 rounded-full flex items-center justify-center">
                {profile?.profile_picture ? (
                  <img
                    src={profile.profile_picture}
                    alt="Photo de profil"
                    className="w-16 h-16 rounded-full object-cover"
                  />
                ) : (
                  <User className="h-8 w-8 text-gray-400" />
                )}
              </div>
              <div>
                <h3 className="font-medium text-gray-900">
                  {profile?.firstname} {profile?.lastname}
                </h3>
                <p className="text-sm text-gray-600">{profile?.function}</p>
              </div>
                             {isEditing && (
                 <Button size="sm" variant="outline">
                   <Camera className="h-4 w-4 mr-2" />
                   {t('profile.changePhoto')}
                 </Button>
               )}
            </div>

            {/* Form Fields */}
            <div className="grid gap-4 md:grid-cols-2">
              <div>
                                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.firstName')}
                 </label>
                <Input
                  value={isEditing ? formData.firstname : profile?.firstname || ''}
                  onChange={(e) => handleInputChange('firstname', e.target.value)}
                  disabled={!isEditing}
                  className="text-sm"
                />
              </div>
              <div>
                                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.lastName')}
                 </label>
                <Input
                  value={isEditing ? formData.lastname : profile?.lastname || ''}
                  onChange={(e) => handleInputChange('lastname', e.target.value)}
                  disabled={!isEditing}
                  className="text-sm"
                />
              </div>
              <div>
                                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.email')}
                 </label>
                <Input
                  type="email"
                  value={isEditing ? formData.email : profile?.email || ''}
                  onChange={(e) => handleInputChange('email', e.target.value)}
                  disabled={!isEditing}
                  className="text-sm"
                />
              </div>
              <div>
                                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.phone')}
                 </label>
                <Input
                  value={isEditing ? formData.phone_number : profile?.phone_number || ''}
                  onChange={(e) => handleInputChange('phone_number', e.target.value)}
                  disabled={!isEditing}
                  className="text-sm"
                />
              </div>
              <div>
                                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.address')}
                 </label>
                <Input
                  value={isEditing ? formData.address : profile?.address || ''}
                  onChange={(e) => handleInputChange('address', e.target.value)}
                  disabled={!isEditing}
                  className="text-sm"
                />
              </div>
              <div>
                                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.region')}
                 </label>
                <Input
                  value={isEditing ? formData.region : profile?.region || ''}
                  onChange={(e) => handleInputChange('region', e.target.value)}
                  disabled={!isEditing}
                  className="text-sm"
                />
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Work Information */}
        <Card>
          <CardHeader>
                         <CardTitle className="flex items-center gap-2 text-sm">
               <Briefcase className="h-5 w-5 text-green-600" />
               {t('profile.professionalInfo')}
             </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="grid gap-4">
              {/* Affichage de l'entreprise selon l'environnement */}
              <div className="flex items-center gap-3">
                <Building className="h-4 w-4 text-gray-400" />
                <div>
                  <p className="text-sm font-medium text-gray-900">Entreprise</p>
                  <p className="text-sm text-gray-600">{config.companyDisplayName}</p>
                </div>
              </div>
              
              {/* Zone de travail pour FODECC */}
              {isFODECC() && (
                <div className="space-y-3">
                  <div className="flex items-center gap-3">
                    <MapPin className="h-4 w-4 text-gray-400" />
                    <div className="flex-1">
                      <p className="text-sm font-medium text-gray-900 mb-2">Zone de Travail</p>
                      {isEditing ? (
                        <div className="space-y-2">
                          <Select
                            options={workSiteOptions}
                            value={selectedWorkSite}
                            onChange={setSelectedWorkSite}
                            placeholder="Choisir une zone de travail"
                            disabled={workSitesLoading}
                          />
                          <Button
                            onClick={handleWorkSiteUpdate}
                            disabled={updateWorkSiteLoading || !selectedWorkSite}
                            size="sm"
                            className="w-full"
                          >
                            <Save className="h-4 w-4 mr-2" />
                            {updateWorkSiteLoading ? 'Mise à jour...' : 'Mettre à jour'}
                          </Button>
                        </div>
                      ) : (
                        <p className="text-sm text-gray-600">
                          {currentWorkSite ? 
                            currentWorkSite.name :
                            'Non spécifié'
                          }
                        </p>
                      )}
                    </div>
                  </div>
                </div>
              )}
              
              {/* Message pour CNPS */}
              {!isFODECC() && (
                <div className="flex items-center gap-3">
                  <MapPin className="h-4 w-4 text-gray-400" />
                  <div>
                    <p className="text-sm font-medium text-gray-900">Zone de Travail</p>
                    <p className="text-sm text-gray-600">Gérée automatiquement par l'administrateur</p>
                  </div>
                </div>
              )}
               <div className="flex items-center gap-3">
                 <Briefcase className="h-4 w-4 text-gray-400" />
                 <div>
                   <p className="text-sm font-medium text-gray-900">{t('profile.department')}</p>
                   <p className="text-sm text-gray-600">{profile?.department?.text_content?.content || t('profile.notSpecified')}</p>
                 </div>
               </div>
               <div className="flex items-center gap-3">
                 <Briefcase className="h-4 w-4 text-gray-400" />
                 <div>
                   <p className="text-sm font-medium text-gray-900">{t('profile.service')}</p>
                   <p className="text-sm text-gray-600">{profile?.service?.text_content?.content || t('profile.notSpecified')}</p>
                 </div>
               </div>
               <div className="flex items-center gap-3">
                 <User className="h-4 w-4 text-gray-400" />
                 <div>
                   <p className="text-sm font-medium text-gray-900">{t('profile.position')}</p>
                   <p className="text-sm text-gray-600">{profile?.position?.name || t('profile.notSpecified')}</p>
                 </div>
               </div>
               <div className="flex items-center gap-3">
                 <Calendar className="h-4 w-4 text-gray-400" />
                 <div>
                   <p className="text-sm font-medium text-gray-900">{t('profile.hireDate')}</p>
                   <p className="text-sm text-gray-600">
                     {profile?.created_at ? formatDate(profile.created_at) : t('profile.notSpecified')}
                   </p>
                 </div>
               </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Security Section */}
      <Card>
        <CardHeader>
                   <CardTitle className="flex items-center gap-2 text-sm">
           <Shield className="h-5 w-5 text-red-600" />
           {t('profile.security')}
         </CardTitle>
        </CardHeader>
        <CardContent>
          {!isChangingPassword ? (
                         <Button
               onClick={() => setIsChangingPassword(true)}
               variant="outline"
               className="w-full md:w-auto"
             >
               <Key className="h-4 w-4 mr-2" />
               {t('profile.changePassword')}
             </Button>
          ) : (
            <div className="space-y-4">
              <div className="grid gap-4 md:grid-cols-2">
                                 <div>
                   <label className="block text-sm font-medium text-gray-700 mb-1">
                     {t('profile.oldPassword')}
                   </label>
                  <div className="relative">
                    <Input
                      type={showPassword ? 'text' : 'password'}
                      value={passwordData.old_password}
                      onChange={(e) => handlePasswordChange('old_password', e.target.value)}
                      className="text-sm pr-10"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="sm"
                      className="absolute right-0 top-0 h-full px-3"
                      onClick={() => setShowPassword(!showPassword)}
                    >
                      {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                    </Button>
                  </div>
                </div>
                                 <div>
                   <label className="block text-sm font-medium text-gray-700 mb-1">
                     {t('profile.newPassword')}
                   </label>
                  <div className="relative">
                    <Input
                      type={showNewPassword ? 'text' : 'password'}
                      value={passwordData.new_password}
                      onChange={(e) => handlePasswordChange('new_password', e.target.value)}
                      className="text-sm pr-10"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="sm"
                      className="absolute right-0 top-0 h-full px-3"
                      onClick={() => setShowNewPassword(!showNewPassword)}
                    >
                      {showNewPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                    </Button>
                  </div>
                </div>
              </div>
                             <div>
                 <label className="block text-sm font-medium text-gray-700 mb-1">
                   {t('profile.confirmPassword')}
                 </label>
                <div className="relative">
                  <Input
                    type={showConfirmPassword ? 'text' : 'password'}
                    value={passwordData.confirm_password}
                    onChange={(e) => handlePasswordChange('confirm_password', e.target.value)}
                    className="text-sm pr-10"
                  />
                  <Button
                    type="button"
                    variant="ghost"
                    size="sm"
                    className="absolute right-0 top-0 h-full px-3"
                    onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                  >
                    {showConfirmPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                  </Button>
                </div>
              </div>
              <div className="flex gap-2">
                <Button
                  onClick={() => {
                    setIsChangingPassword(false)
                    setPasswordData({
                      old_password: '',
                      new_password: '',
                      confirm_password: '',
                    })
                  }}
                  variant="outline"
                  size="sm"
                >
                                     <X className="h-4 w-4 mr-2" />
                   {t('common.cancel')}
                 </Button>
                 <Button
                   onClick={handleChangePassword}
                   disabled={passwordLoading}
                   size="sm"
                   className="bg-blue-600 hover:bg-blue-700"
                 >
                   <Save className="h-4 w-4 mr-2" />
                   {t('profile.changePasswordButton')}
                 </Button>
              </div>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Account Actions Section */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2 text-lg">
            <Settings className="h-5 w-5 text-gray-600" />
            {t('profile.personalInfo')}
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {/* Language Settings */}
          <div className="flex items-center justify-between p-3 border rounded-lg hover:bg-gray-50 cursor-pointer" onClick={() => setShowLanguageModal(true)}>
            <div className="flex items-center gap-3">
              <div className="p-2 bg-blue-100 rounded-lg">
                <Globe className="h-4 w-4 text-blue-600" />
              </div>
              <div>
                <h3 className="font-medium text-gray-900">{t('profile.language')}</h3>
                <p className="text-sm text-gray-500">{t('profile.language')}</p>
              </div>
            </div>
            <div className="text-sm text-gray-500">{getLanguageName(language)}</div>
          </div>

          {/* Settings */}
          <div className="flex items-center justify-between p-3 border rounded-lg hover:bg-gray-50 cursor-pointer" onClick={handleSettings}>
            <div className="flex items-center gap-3">
              <div className="p-2 bg-gray-100 rounded-lg">
                <Settings className="h-4 w-4 text-gray-600" />
              </div>
              <div>
                <h3 className="font-medium text-gray-900">{t('settings.title')}</h3>
                <p className="text-sm text-gray-500">{t('settings.title')}</p>
              </div>
            </div>
            <div className="text-sm text-gray-500">→</div>
          </div>

          {/* Logout */}
          <div className="flex items-center justify-between p-3 border rounded-lg hover:bg-red-50 cursor-pointer" onClick={handleLogout}>
            <div className="flex items-center gap-3">
              <div className="p-2 bg-red-100 rounded-lg">
                <LogOut className="h-4 w-4 text-red-600" />
              </div>
              <div>
                <h3 className="font-medium text-gray-900">{t('profile.logout')}</h3>
                <p className="text-sm text-gray-500">{t('profile.logout')}</p>
              </div>
            </div>
            <div className="text-sm text-red-500">→</div>
          </div>
        </CardContent>
      </Card>

      {/* Language Modal */}
      {showLanguageModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-2xl max-w-sm w-full p-6">
            <div className="text-center">
              <div className="mx-auto w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                <Globe className="h-6 w-6 text-blue-600" />
              </div>
              <h3 className="text-lg font-semibold text-gray-900 mb-4">{t('profile.language')}</h3>
              <div className="space-y-2">
                <button
                  onClick={() => handleLanguageChange('fr')}
                  className={`w-full p-3 text-left border rounded-lg transition-colors ${
                    language === 'fr' ? 'bg-blue-50 border-blue-200' : 'hover:bg-blue-50'
                  }`}
                >
                  <div className="font-medium">Français</div>
                  <div className="text-sm text-gray-500">Langue française</div>
                </button>
                <button
                  onClick={() => handleLanguageChange('en')}
                  className={`w-full p-3 text-left border rounded-lg transition-colors ${
                    language === 'en' ? 'bg-blue-50 border-blue-200' : 'hover:bg-blue-50'
                  }`}
                >
                  <div className="font-medium">English</div>
                  <div className="text-sm text-gray-500">English language</div>
                </button>
              </div>
              <button
                onClick={() => setShowLanguageModal(false)}
                className="mt-4 px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              >
                {t('common.cancel')}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Settings Modal */}
      {showSettingsModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-2xl max-w-md w-full p-6">
            <div className="text-center">
              <div className="mx-auto w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center mb-4">
                <Settings className="h-6 w-6 text-gray-600" />
              </div>
              <h3 className="text-lg font-semibold text-gray-900 mb-4">Paramètres</h3>
              <div className="space-y-3 text-left">
                <div className="p-3 border rounded-lg">
                  <div className="font-medium text-sm">Notifications</div>
                  <div className="text-xs text-gray-500">Gérer les notifications push</div>
                </div>
                <div className="p-3 border rounded-lg">
                  <div className="font-medium text-sm">Confidentialité</div>
                  <div className="text-xs text-gray-500">Paramètres de confidentialité</div>
                </div>
                <div className="p-3 border rounded-lg">
                  <div className="font-medium text-sm">À propos</div>
                  <div className="text-xs text-gray-500">Informations sur l'application</div>
                </div>
              </div>
              <button
                onClick={() => setShowSettingsModal(false)}
                className="mt-4 px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              >
                Fermer
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
} 