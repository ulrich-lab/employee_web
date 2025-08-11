import { NextRequest, NextResponse } from 'next/server'

// Types pour la réponse
interface LoginRequest {
  email: string
  password: string
  userType: 'admin' | 'staff'
}

interface LoginResponse {
  user: {
    id: string
    email: string
    name: string
    type: 'admin' | 'staff'
    avatar?: string
  }
  token: string
  message: string
}

export async function POST(request: NextRequest) {
  try {
    const body: LoginRequest = await request.json()
    const { email, password, userType } = body

    // Validation des données
    if (!email || !password || !userType) {
      return NextResponse.json(
        { error: 'Tous les champs sont requis' },
        { status: 400 }
      )
    }

    // Validation du userType
    if (userType !== 'admin' && userType !== 'staff') {
      return NextResponse.json(
        { error: 'Type d\'utilisateur invalide' },
        { status: 400 }
      )
    }

    // Pour le moment, on accepte n'importe quel email/téléphone et mot de passe
    // La validation se fera côté serveur réel plus tard
    
    // Génération d'un token JWT simulé
    const token = `mock-jwt-token-${userType}-${Date.now()}`

    // Création d'un utilisateur simulé basé sur le type
    const user = {
      id: userType === 'admin' ? '1' : '2',
      email: email,
      name: userType === 'admin' ? 'Administrateur' : 'Employé',
      type: userType as 'admin' | 'staff',
    }

    // Réponse de succès
    const response: LoginResponse = {
      user,
      token,
      message: 'Connexion réussie',
    }

    return NextResponse.json(response, { status: 200 })
  } catch (error) {
    console.error('Erreur lors de la connexion:', error)
    return NextResponse.json(
      { error: 'Erreur interne du serveur' },
      { status: 500 }
    )
  }
} 