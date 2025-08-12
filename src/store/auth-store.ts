'use client'

import { create } from 'zustand'
import { persist } from 'zustand/middleware'

export interface User {
  id: string
  email: string
  name: string
  type: 'admin' | 'staff'
  avatar?: string
  company_id?: string
  firstname?: string
  lastname?: string
  phone_number?: string
  department_id?: string
  service_id?: string
  position_id?: string
  function?: string
  address?: string
  region?: string
  license?: string
  profile_picture?: string
}

export interface AuthState {
  user: User | null
  token: string | null
  isAuthenticated: boolean
  isLoading: boolean
  error: string | null
  login: (phoneNumber: string, password: string, userType: 'admin' | 'staff') => Promise<void>
  logout: () => void
  setUser: (user: User) => void
  setToken: (token: string) => void
  setLoading: (isLoading: boolean) => void
  setError: (error: string | null) => void
  clearError: () => void
  checkAuth: () => boolean
}

import { buildApiUrl, apiRequest } from '@/lib/config/api'

export const useAuthStore = create<AuthState>()(
  persist(
    (set, get) => ({
      user: null,
      token: null,
      isAuthenticated: false,
      isLoading: false,
      error: null,

      login: async (phoneNumber: string, password: string, userType: 'admin' | 'staff') => {
        set({ isLoading: true, error: null })
        
        try {
          // Même body que la version Flutter
          const body = {
            phone_number: phoneNumber.trim(),
            password: password.trim(),
          }

          // Même endpoint que la version Flutter
          const response = await apiRequest(
            buildApiUrl('/api/v1/login'),
            {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json',
              },
              body: JSON.stringify(body),
            }
          )

          if (!response.ok) {
            const errorData = await response.json().catch(() => ({}))
            throw new Error(errorData.error || 'Identifiants invalides')
          }

          const data = await response.json()
          
          // Vérification de la réponse comme dans Flutter
          if (data.employee) {
            const employee = data.employee
            const token = `Bearer ${data.token}`
            
            // Création de l'utilisateur basé sur la réponse
            const user: User = {
              id: employee.id?.toString() || '1',
              email: employee.email || phoneNumber,
              name: `${employee.firstname || ''} ${employee.lastname || ''}`.trim() || (userType === 'admin' ? 'Administrateur' : 'Employé'),
              type: userType,
              avatar: employee.profile_picture,
              company_id: employee.company_id,
              firstname: employee.firstname,
              lastname: employee.lastname,
              phone_number: employee.phone_number,
              department_id: employee.department_id,
              service_id: employee.service_id,
              position_id: employee.position_id,
              function: employee.function,
              address: employee.address,
              region: employee.region,
              license: employee.license,
              profile_picture: employee.profile_picture,
            }
            
            // Stockage des données d'authentification
            set({
              user,
              token,
              isAuthenticated: true,
              isLoading: false,
              error: null,
            })

            // Stockage du token dans localStorage pour les appels API
            if (typeof window !== 'undefined') {
              localStorage.setItem('authToken', token)
              localStorage.setItem('user-id', user.id)
              localStorage.setItem('employee_id', user.id)
              localStorage.setItem('email', user.email)
              localStorage.setItem('name', user.name)
              localStorage.setItem('phone', phoneNumber)
              if (user.avatar) {
                localStorage.setItem('image', user.avatar)
              }
            }
            
          } else {
            throw new Error('Réponse invalide du serveur')
          }
          
        } catch (error) {
          set({
            isLoading: false,
            error: error instanceof Error ? error.message : 'Erreur de connexion',
          })
          throw error
        }
      },

      logout: () => {
        // Nettoyage des données d'authentification
        set({
          user: null,
          token: null,
          isAuthenticated: false,
          isLoading: false,
          error: null,
        })
        
        // Suppression des données du localStorage
        if (typeof window !== 'undefined') {
          localStorage.removeItem('authToken')
          localStorage.removeItem('user-id')
          localStorage.removeItem('employee_id')
          localStorage.removeItem('email')
          localStorage.removeItem('name')
          localStorage.removeItem('phone')
          localStorage.removeItem('image')
        }
      },

      setUser: (user: User) => {
        set({ user })
      },

      setToken: (token: string) => {
        set({ token, isAuthenticated: true })
        if (typeof window !== 'undefined') {
          localStorage.setItem('authToken', token)
        }
      },

      setLoading: (isLoading: boolean) => {
        set({ isLoading })
      },

      setError: (error: string | null) => {
        set({ error })
      },

      clearError: () => {
        set({ error: null })
      },

      checkAuth: () => {
        if (typeof window === 'undefined') {
          return false
        }
        
        const token = localStorage.getItem('authToken')
        const userData = localStorage.getItem('auth-storage')
        
        if (token && userData) {
          try {
            const parsed = JSON.parse(userData)
            if (parsed.state?.isAuthenticated && parsed.state?.user) {
              return true
            }
          } catch (error) {
            console.error('Error parsing auth data:', error)
          }
        }
        
        return false
      },
    }),
    {
      name: 'auth-storage',
      partialize: (state) => ({
        user: state.user,
        token: state.token,
        isAuthenticated: state.isAuthenticated,
      }),
    }
  )
) 