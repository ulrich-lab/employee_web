// Types de base pour l'application

export interface User {
  id: string
  firstname: string
  lastname: string
  email: string
  phone_number?: string
  image?: string
  company_id: string
  created_at: string
  updated_at: string
}

export interface AuthState {
  user: User | null
  token: string | null
  isAuthenticated: boolean
  isLoading: boolean
}

export interface Message {
  id: string
  content: string
  sender_id: string
  conversation_id: string
  is_read: boolean
  created_at: string
  attachments?: Attachment[]
  message_statuses?: MessageStatus[]
}

export interface Attachment {
  id: string
  filename: string
  file_type: string
  file_size: string
  file_path: string
  extension: string
  width?: string
  height?: string
  length?: string
  mime_type: string
  samples?: string
}

export interface MessageStatus {
  status: 'sent' | 'delivered' | 'read'
  employee_id: string
}

export interface Conversation {
  id: string
  name?: string
  is_group: boolean
  messages: Message[]
  employee_conversations: EmployeeConversation[]
}

export interface EmployeeConversation {
  employee_id: string
}

export interface Visitor {
  id: string
  firstname: string
  lastname: string
  email: string
  phone_number: string
  company_name?: string
  purpose: string
  status: 'pending' | 'approved' | 'rejected' | 'checked_in' | 'checked_out'
  check_in_time?: string
  check_out_time?: string
  created_at: string
  updated_at: string
}

export interface Attendance {
  id: string
  employee_id: string
  clock_in_time: string
  clock_out_time?: string
  status: 'present' | 'absent' | 'late'
  location?: string
  created_at: string
}

export interface Permission {
  id: string
  employee_id: string
  type: 'leave' | 'overtime' | 'remote_work'
  start_date: string
  end_date: string
  reason: string
  status: 'pending' | 'approved' | 'rejected'
  approved_by?: string
  created_at: string
}

export interface DashboardStats {
  total_visitors: number
  pending_visitors: number
  today_attendance: number
  total_employees: number
  recent_activities: Activity[]
}

export interface Activity {
  id: string
  type: 'visitor_checkin' | 'visitor_checkout' | 'attendance_clockin' | 'attendance_clockout'
  description: string
  created_at: string
  user_name: string
}

// Types pour les formulaires
export interface LoginForm {
  email: string
  password: string
}

export interface RegisterForm {
  firstname: string
  lastname: string
  email: string
  password: string
  phone_number: string
}

export interface VisitorForm {
  firstname: string
  lastname: string
  email: string
  phone_number: string
  company_name?: string
  purpose: string
}

// Types pour les réponses API
export interface ApiResponse<T> {
  data: T
  message: string
  success: boolean
}

export interface PaginatedResponse<T> {
  data: T[]
  total: number
  page: number
  limit: number
  totalPages: number
}

// Types pour les notifications
export interface Notification {
  id: string
  title: string
  body: string
  type: 'info' | 'success' | 'warning' | 'error'
  read: boolean
  created_at: string
}

// Types pour les thèmes
export interface Theme {
  mode: 'light' | 'dark'
  primaryColor: string
  backgroundColor: string
  textColor: string
}

// Types pour les erreurs
export interface AppError {
  message: string
  code?: string
  details?: any
} 