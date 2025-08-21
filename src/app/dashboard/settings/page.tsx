'use client'

import { useState, useEffect } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { Settings, User, Building, MapPin, Save } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Select, SelectOption } from '@/components/ui/select'
import { useEmployeeProfile, useUpdateEmployeeProfile } from '@/lib/graphql/hooks'
import { useWorkSites, useUpdateEmployeeWorkSite, useEmployeeWorkSite } from '@/lib/graphql/hooks'
import { isFODECC, getCurrentConfig } from '@/lib/config/environments'
import { toast } from 'sonner'
import { WorkSite } from '@/types'

export default function SettingsPage() {
  const { t } = useTranslation()
  const config = getCurrentConfig()
  const [activeTab, setActiveTab] = useState<'profile' | 'professional'>('profile')

  // État local pour les formulaires
  const [profileForm, setProfileForm] = useState({
    firstname: '',
    lastname: '',
    email: '',
    phone_number: '',
    address: '',
    region: ''
  })

  const [professionalForm, setProfessionalForm] = useState({
    work_site_id: ''
  })

  // Récupérer l'ID de l'employé depuis le localStorage ou une autre source
  const employeeId = typeof window !== 'undefined' ? localStorage.getItem('employeeId') || '' : ''

  // Hooks GraphQL
  const { profile, loading: profileLoading, error: profileError } = useEmployeeProfile(employeeId)
  const { updateProfile, loading: updateProfileLoading } = useUpdateEmployeeProfile()
  const { workSites, loading: workSitesLoading } = useWorkSites(profile?.company_id)
  const { updateWorkSite, loading: updateWorkSiteLoading } = useUpdateEmployeeWorkSite()
  const { workSite: currentWorkSite, loading: currentWorkSiteLoading } = useEmployeeWorkSite(employeeId)

  // Convertir les work sites en options pour le select
  const workSiteOptions: SelectOption[] = (workSites as WorkSite[]).map((site: WorkSite) => ({
    value: site.id,
    label: site.name
  }))

  // Initialiser le formulaire avec les données du profil
  useEffect(() => {
    if (profile) {
      setProfileForm({
        firstname: profile.firstname || '',
        lastname: profile.lastname || '',
        email: profile.email || '',
        phone_number: profile.phone_number || '',
        address: profile.address || '',
        region: profile.region || ''
      })

      if (profile.work_site_id) {
        setProfessionalForm({
          work_site_id: profile.work_site_id
        })
      }
    }
  }, [profile])

  // Gérer la soumission du profil
  const handleProfileSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!employeeId) return

    try {
      await updateProfile({
        id: employeeId,
        ...profileForm
      })
      toast.success('Profil mis à jour avec succès')
    } catch (error) {
      console.error('Erreur lors de la mise à jour du profil:', error)
    }
  }

  // Gérer la mise à jour de la zone de travail
  const handleWorkSiteUpdate = async () => {
    if (!employeeId || !professionalForm.work_site_id) return

    try {
      await updateWorkSite({
        id: employeeId,
        work_site_id: professionalForm.work_site_id
      })
      toast.success('Zone de travail mise à jour avec succès')
    } catch (error) {
      console.error('Erreur lors de la mise à jour de la zone de travail:', error)
    }
  }

  if (profileLoading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Chargement...</p>
        </div>
      </div>
    )
  }

  if (profileError) {
    return (
      <div className="text-center py-8">
        <p className="text-red-600">Erreur lors du chargement du profil: {profileError}</p>
      </div>
    )
  }

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

      {/* Navigation des onglets */}
      <div className="flex space-x-1 bg-gray-100 p-1 rounded-lg">
        <button
          onClick={() => setActiveTab('profile')}
          className={`flex-1 py-2 px-4 rounded-md text-sm font-medium transition-colors ${activeTab === 'profile'
              ? 'bg-white text-gray-900 shadow-sm'
              : 'text-gray-600 hover:text-gray-900'
            }`}
        >
          <User className="h-4 w-4 inline mr-2" />
          Informations Personnelles
        </button>
        <button
          onClick={() => setActiveTab('professional')}
          className={`flex-1 py-2 px-4 rounded-md text-sm font-medium transition-colors ${activeTab === 'professional'
              ? 'bg-white text-gray-900 shadow-sm'
              : 'text-gray-600 hover:text-gray-900'
            }`}
        >
          <Building className="h-4 w-4 inline mr-2" />
          Informations Professionnelles
        </button>
      </div>

      {/* Contenu des onglets */}
      {activeTab === 'profile' && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <User className="h-5 w-5" />
              Informations Personnelles
            </CardTitle>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleProfileSubmit} className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <Label htmlFor="firstname">Prénom</Label>
                  <Input
                    id="firstname"
                    value={profileForm.firstname}
                    onChange={(e) => setProfileForm(prev => ({ ...prev, firstname: e.target.value }))}
                    placeholder="Votre prénom"
                  />
                </div>
                <div>
                  <Label htmlFor="lastname">Nom</Label>
                  <Input
                    id="lastname"
                    value={profileForm.lastname}
                    onChange={(e) => setProfileForm(prev => ({ ...prev, lastname: e.target.value }))}
                    placeholder="Votre nom"
                  />
                </div>
                <div>
                  <Label htmlFor="email">Email</Label>
                  <Input
                    id="email"
                    type="email"
                    value={profileForm.email}
                    onChange={(e) => setProfileForm(prev => ({ ...prev, email: e.target.value }))}
                    placeholder="votre.email@exemple.com"
                  />
                </div>
                <div>
                  <Label htmlFor="phone_number">Téléphone</Label>
                  <Input
                    id="phone_number"
                    value={profileForm.phone_number}
                    onChange={(e) => setProfileForm(prev => ({ ...prev, phone_number: e.target.value }))}
                    placeholder="+237 XXX XXX XXX"
                  />
                </div>
                <div className="md:col-span-2">
                  <Label htmlFor="address">Adresse</Label>
                  <Input
                    id="address"
                    value={profileForm.address}
                    onChange={(e) => setProfileForm(prev => ({ ...prev, address: e.target.value }))}
                    placeholder="Votre adresse complète"
                  />
                </div>
                <div>
                  <Label htmlFor="region">Région</Label>
                  <Input
                    id="region"
                    value={profileForm.region}
                    onChange={(e) => setProfileForm(prev => ({ ...prev, region: e.target.value }))}
                    placeholder="Votre région"
                  />
                </div>
              </div>
              <Button
                type="submit"
                disabled={updateProfileLoading}
                className="w-full md:w-auto"
              >
                <Save className="h-4 w-4 mr-2" />
                {updateProfileLoading ? 'Mise à jour...' : 'Mettre à jour le profil'}
              </Button>
            </form>
          </CardContent>
        </Card>
      )}

      {activeTab === 'professional' && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Building className="h-5 w-5" />
              Informations Professionnelles
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-6">
              {/* Affichage de l'entreprise selon l'environnement */}
              <div className="p-4 bg-gray-50 rounded-lg">
                <div className="flex items-center gap-2 mb-2">
                  <Building className="h-4 w-4 text-gray-600" />
                  <Label className="text-sm font-medium text-gray-700">Entreprise</Label>
                </div>
                <p className="text-gray-900 font-medium">{config.companyDisplayName}</p>
              </div>

              {/* Sélecteur de zone de travail pour FODECC */}
              {isFODECC() && (
                <div className="space-y-4">
                  <div>
                    <Label htmlFor="work_site" className="flex items-center gap-2">
                      <MapPin className="h-4 w-4" />
                      Zone de Travail
                    </Label>
                    <p className="text-sm text-gray-600 mb-2">
                      Sélectionnez votre zone de travail actuelle
                    </p>
                    <Select
                      options={workSiteOptions}
                      value={professionalForm.work_site_id}
                      onChange={(value) => setProfessionalForm(prev => ({ ...prev, work_site_id: value }))}
                      placeholder="Choisir une zone de travail"
                      disabled={workSitesLoading}
                    />

                    {/* Affichage du work site actuel */}
                    {currentWorkSite && (
                      <div className="mt-2 p-2 bg-green-50 border border-green-200 rounded-lg">
                        <p className="text-xs text-green-700">
                          <strong>Zone actuelle :</strong> {currentWorkSite.name}
                          {currentWorkSite.location && (
                            <span className="block text-xs text-green-600 mt-1">
                              📍 {currentWorkSite.location}
                            </span>
                          )}
                        </p>
                      </div>
                    )}
                  </div>

                  <Button
                    onClick={handleWorkSiteUpdate}
                    disabled={updateWorkSiteLoading || !professionalForm.work_site_id}
                    className="w-full md:w-auto"
                  >
                    <Save className="h-4 w-4 mr-2" />
                    {updateWorkSiteLoading ? 'Mise à jour...' : 'Mettre à jour la zone de travail'}
                  </Button>
                </div>
              )}

              {/* Message pour CNPS */}
              {!isFODECC() && (
                <div className="p-4 bg-blue-50 border border-blue-200 rounded-lg">
                  <div className="flex items-center gap-2">
                    <MapPin className="h-4 w-4 text-blue-600" />
                    <p className="text-blue-800 text-sm">
                      Pour l'environnement CNPS, la zone de travail est gérée automatiquement par l'administrateur.
                    </p>
                  </div>
                </div>
              )}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
} 