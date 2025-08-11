// Types pour le système de chat basés sur les requêtes GraphQL

// Types de base
export interface Employee {
  id: string
  firstname: string
  lastname: string
  phone_number: string
  file?: {
    file_url: string
    file_name: string
  }
}

export interface Attachment {
  id: string
  filename: string
  file_type: string
  file_size: string
  file_path: string
  extension: string
  mime_type: string
  width?: string
  length?: string
  height?: string
  samples?: string
  message_id: string
  updated_at: string
}

export interface MessageStatus {
  status: 'PENDING' | 'SENT' | 'DELIVERED' | 'SEEN'
  employee_id: string
}

export interface Message {
  id: string
  content: string
  sender_id: string
  conversation_id: string
  is_read: boolean
  message_mobile_id: string
  created_at: string
  employee: {
    firstname: string
    lastname: string
    id: string
  }
  attachments: Attachment[]
  message_statuses: MessageStatus[]
}

export interface Conversation {
  id: string
  name?: string
  is_group: boolean
  messages: Message[]
  employee_conversations: {
    employee_id: string
  }[]
}

// Types pour les groupes
export interface Group {
  id: string
  name: string
  senderId: string
  members: string[]
}

// Types pour les conversations récentes
export interface RecentChat {
  conversation: Conversation
  lastMessage: Message
  unreadCount: number
  otherParticipants: Employee[]
}

// Types pour les contacts
export interface Contact {
  id: string
  displayName: string
  avatarUrl?: string
  phoneNumber: string
  isOnline: boolean
}

// Types pour les départements et services (pour la création de groupes)
export interface Department {
  id: string
  abrev_code: string
  text_content: {
    content: string
  }
  services: Service[]
}

export interface Service {
  id: string
  text_content: {
    content: string
  }
  employees: Employee[]
}

// Types pour les états de l'interface
export interface ChatState {
  currentConversation: Conversation | null
  recentChats: RecentChat[]
  contacts: Contact[]
  isLoading: boolean
  error: string | null
}

// Types pour les actions
export interface SendMessageData {
  conversationId: string
  content: string
  senderId: string
  messageMobileId: string
  attachment?: {
    file_path: string
    file_type: string
    mime_type: string
    file_size: string
    extension: string
    filename: string
    width?: string
    length?: string
    height?: string
    samples?: string
  }
}

export interface CreateGroupData {
  name: string
  members: {
    employee_id: string
  }[]
}

// Types pour les filtres et recherche
export interface ChatFilters {
  searchTerm: string
  showGroups: boolean
  showIndividuals: boolean
  showUnreadOnly: boolean
} 