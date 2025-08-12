import { useMutation, useQuery, useSubscription } from '@apollo/client'
import { useCallback } from 'react'
import { toast } from 'sonner'
import {
  // Attendance
  CLOCK_IN_MUTATION,
  CLOCK_OUT_MUTATION,
  ATTENDANCE_STATUS_SUBSCRIPTION,
  ATTENDANCE_LIST_SUBSCRIPTION,
  
  // Visitors
  GET_VISITORS_QUERY,
  GET_VISITOR_DETAILS_QUERY,
  ACCEPT_VISIT_MUTATION,
  REJECT_VISIT_MUTATION,
  CREATE_VISITOR_MUTATION,
  VISITOR_LIST_SUBSCRIPTION,
  GET_VISITOR_DETAILS,
  CLOCK_OUT_VISIT,
  ACCEPT_VISIT,
  REJECT_VISIT,
  
  // Permissions
  GET_EMPLOYEE_LEAVES_QUERY,
  INSERT_LEAVE_MUTATION,
  UPDATE_LEAVE_MUTATION,
  DELETE_LEAVE_MUTATION,
  
  // Chat
  GET_ALL_CONTACTS_LIST,
  CREATE_CONVERSATION,
  INSERT_MESSAGE_WITHOUT_ATTACHMENT,
  INSERT_MESSAGE_WITH_ATTACHMENT,
  GET_CONVERSATION_STREAM_WITH_MESSAGE,
  UPDATE_MESSAGE_STATUS,
  CREATE_GROUP,
  GET_ALL_EMPLOYEES,
  
  // Profile
  GET_EMPLOYEE_PROFILE_QUERY,
  UPDATE_EMPLOYEE_INFO_MUTATION,
  UPDATE_PASSWORD_MUTATION,
  GET_EMPLOYEE_PROFILE,
  UPDATE_EMPLOYEE_PROFILE,
  CHANGE_PASSWORD,
  
  // Notifications
  GET_NOTIFICATIONS_QUERY,
  MARK_NOTIFICATION_READ_MUTATION,
  
  // Appointments
  GET_APPOINTMENTS_QUERY,
  CREATE_APPOINTMENT_MUTATION,
} from './queries'

// ============================================================================
// ATTENDANCE HOOKS
// ============================================================================

export const useClockIn = () => {
  const [mutate, { loading, error }] = useMutation(CLOCK_IN_MUTATION)

  const clockIn = useCallback(async (variables: {
    employee_id: string
    location?: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Pointage d\'arrivée enregistré avec succès')
      return result.data?.insert_attendance_one?.id
    } catch (error) {
      toast.error('Erreur lors du pointage d\'arrivée')
      throw error
    }
  }, [mutate])

  return { clockIn, loading, error }
}

export const useClockOut = () => {
  const [mutate, { loading, error }] = useMutation(CLOCK_OUT_MUTATION)

  const clockOut = useCallback(async (employee_id: string) => {
    try {
      const result = await mutate({ variables: { employee_id } })
      toast.success('Pointage de départ enregistré avec succès')
      return result.data?.update_attendance?.affected_rows
    } catch (error) {
      toast.error('Erreur lors du pointage de départ')
      throw error
    }
  }, [mutate])

  return { clockOut, loading, error }
}

export const useAttendanceStatus = (employee_id: string) => {
  const { data, loading, error } = useSubscription(ATTENDANCE_STATUS_SUBSCRIPTION, {
    variables: { employee_id },
    skip: !employee_id,
  })

  return {
    attendanceStatus: data?.attendance?.[0] || null,
    loading,
    error,
  }
}

export const useAttendanceList = (employee_id: string) => {
  const { data, loading, error } = useSubscription(ATTENDANCE_LIST_SUBSCRIPTION, {
    variables: { employee_id },
    skip: !employee_id,
  })

  return {
    attendanceList: data?.attendance || [],
    loading,
    error,
  }
}

// ============================================================================
// VISITOR HOOKS
// ============================================================================

export const useVisitors = (host_employee: string) => {
  const { data, loading, error } = useSubscription(VISITOR_LIST_SUBSCRIPTION, {
    variables: { host_employee },
    skip: !host_employee,
  })

  return {
    visitors: data?.visits || [],
    loading,
    error,
  }
}

export const useVisitorDetails = (id: string) => {
  const { data, loading, error } = useQuery(GET_VISITOR_DETAILS, {
    variables: { id },
    skip: !id,
  })

  return {
    visitor: data?.visits_by_pk,
    loading,
    error,
  }
}

export const useAcceptVisit = () => {
  const [mutate, { loading, error }] = useMutation(ACCEPT_VISIT)

  const acceptVisit = useCallback(async (id: string) => {
    try {
      const result = await mutate({ variables: { id } })
      toast.success('Visiteur approuvé avec succès')
      return result.data?.update_visits_by_pk
    } catch (error) {
      toast.error('Erreur lors de l\'approbation du visiteur')
      throw error
    }
  }, [mutate])

  return { acceptVisit, loading, error }
}

export const useRejectVisit = () => {
  const [mutate, { loading, error }] = useMutation(REJECT_VISIT)

  const rejectVisit = useCallback(async (id: string) => {
    try {
      const result = await mutate({ variables: { id } })
      toast.success('Visiteur rejeté avec succès')
      return result.data?.update_visits_by_pk
    } catch (error) {
      toast.error('Erreur lors du rejet du visiteur')
      throw error
    }
  }, [mutate])

  return { rejectVisit, loading, error }
}

export const useClockOutVisit = () => {
  const [mutate, { loading, error }] = useMutation(CLOCK_OUT_VISIT)

  const clockOutVisit = useCallback(async (id: string) => {
    try {
      const result = await mutate({ variables: { id } })
      toast.success('Départ du visiteur enregistré avec succès')
      return result.data?.update_visits_by_pk
    } catch (error) {
      toast.error('Erreur lors de l\'enregistrement du départ')
      throw error
    }
  }, [mutate])

  return { clockOutVisit, loading, error }
}

export const useCreateVisitor = () => {
  const [mutate, { loading, error }] = useMutation(CREATE_VISITOR_MUTATION)

  const createVisitor = useCallback(async (variables: {
    name: string
    email: string
    phone: string
    company: string
    purpose: string
    host_name: string
    arrival_time: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Visiteur créé avec succès')
      return result.data?.insert_visitors_one
    } catch (error) {
      toast.error('Erreur lors de la création du visiteur')
      throw error
    }
  }, [mutate])

  return { createVisitor, loading, error }
}

// ============================================================================
// PERMISSION HOOKS
// ============================================================================

export const useEmployeeLeaves = (employee_id: string) => {
  const { data, loading, error, refetch } = useQuery(GET_EMPLOYEE_LEAVES_QUERY, {
    variables: { employee_id },
    skip: !employee_id,
  })

  // Log pour debug
  if (error) {
    console.error('Erreur useEmployeeLeaves:', error)
  }

  return {
    leaves: [...(data?.leaves || [])].reverse(),
    loading,
    error: error?.message || error,
    refetch,
  }
  
}

export const useInsertLeave = () => {
  const [mutate, { loading, error }] = useMutation(INSERT_LEAVE_MUTATION)

  const insertLeave = useCallback(async (variables: {
    employee_id: string
    leave_type: string
    start_date: string
    end_date: string
    comment: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Demande de permission soumise avec succès')
      return result.data?.insert_leaves_one
    } catch (error) {
      toast.error('Erreur lors de la soumission de la demande')
      throw error
    }
  }, [mutate])

  return { insertLeave, loading, error }
}

export const useUpdateLeave = () => {
  const [mutate, { loading, error }] = useMutation(UPDATE_LEAVE_MUTATION)

  const updateLeave = useCallback(async (id: string, updates: any) => {
    try {
      const result = await mutate({ variables: { id, updates } })
      toast.success('Permission mise à jour avec succès')
      return result.data?.update_leaves_by_pk
    } catch (error) {
      toast.error('Erreur lors de la mise à jour de la permission')
      throw error
    }
  }, [mutate])

  return { updateLeave, loading, error }
}

export const useDeleteLeave = () => {
  const [mutate, { loading, error }] = useMutation(DELETE_LEAVE_MUTATION)

  const deleteLeave = useCallback(async (id: string) => {
    try {
      const result = await mutate({ variables: { id } })
      toast.success('Permission supprimée avec succès')
      return result.data?.delete_leaves_by_pk
    } catch (error) {
      toast.error('Erreur lors de la suppression de la permission')
      throw error
    }
  }, [mutate])

  return { deleteLeave, loading, error }
}

// ============================================================================
// CHAT HOOKS
// ============================================================================

export const useAllContactsList = (company_id?: string) => {
  const { data, loading, error } = useQuery(GET_ALL_CONTACTS_LIST, {
    variables: { company_id },
    skip: !company_id,
  })

  return {
    contacts: data?.employees || [],
    loading,
    error: error?.message
  }
}

export const useCreateConversation = () => {
  const [mutate, { loading, error }] = useMutation(CREATE_CONVERSATION)

  const createConversation = useCallback(async (variables: {
    firstParticipant: string
    secondParticipants: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Conversation créée avec succès')
      return result.data?.createConversation?.id
    } catch (error) {
      toast.error('Erreur lors de la création de la conversation')
      throw error
    }
  }, [mutate])

  return { createConversation, loading, error }
}

export const useInsertMessageWithAttachment = () => {
  const [mutate, { loading, error }] = useMutation(INSERT_MESSAGE_WITH_ATTACHMENT)

  const insertMessage = useCallback(async (variables: {
    sender_id: string
    conversation_id: string
    content?: string
    file_path?: string
    file_type?: string
    mime_type?: string
    file_size?: string
    extension?: string
    width?: string
    length?: string
    height?: string
    filename?: string
    message_mobile_id: string
    samples?: string
  }) => {
    try {
      const result = await mutate({ variables })
      return result.data?.insert_messages_one?.id
    } catch (error) {
      toast.error('Erreur lors de l\'envoi du message')
      throw error
    }
  }, [mutate])

  return { insertMessage, loading, error }
}

export const useInsertMessageWithoutAttachment = () => {
  const [mutate, { loading, error }] = useMutation(INSERT_MESSAGE_WITHOUT_ATTACHMENT)

  const insertMessage = useCallback(async (variables: {
    conversation_id: string
    content?: string
    sender_id: string
    message_mobile_id: string
  }) => {
    try {
      const result = await mutate({ variables })
      return result.data?.insert_messages_one?.id
    } catch (error) {
      toast.error('Erreur lors de l\'envoi du message')
      throw error
    }
  }, [mutate])

  return { insertMessage, loading, error }
}

export const useConversationStream = (employee_id: string) => {
  const { data, loading, error } = useSubscription(GET_CONVERSATION_STREAM_WITH_MESSAGE, {
    variables: { employee_id },
    skip: !employee_id,
  })

  return {
    conversations: data?.conversations || [],
    loading,
    error: error?.message
  }
}

export const useUpdateMessageStatus = () => {
  const [mutate, { loading, error }] = useMutation(UPDATE_MESSAGE_STATUS)

  const updateMessageStatus = useCallback(async (variables: {
    id: string[]
    status: string
  }) => {
    try {
      const result = await mutate({ variables })
      return result.data?.updateMessageStatus?.state
    } catch (error) {
      toast.error('Erreur lors de la mise à jour du statut')
      throw error
    }
  }, [mutate])

  return { updateMessageStatus, loading, error }
}

export const useCreateGroup = () => {
  const [mutate, { loading, error }] = useMutation(CREATE_GROUP)

  const createGroup = useCallback(async (variables: {
    name: string
    members: { employee_id: string }[]
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Groupe créé avec succès')
      return result.data?.insert_conversations_one?.id
    } catch (error) {
      toast.error('Erreur lors de la création du groupe')
      throw error
    }
  }, [mutate])

  return { createGroup, loading, error }
}

export const useAllEmployees = () => {
  const { data, loading, error } = useQuery(GET_ALL_EMPLOYEES)

  return {
    departments: data?.departments || [],
    loading,
    error: error?.message
  }
}

// ============================================================================
// PROFILE HOOKS
// ============================================================================

export const useEmployeeProfile = (id: string) => {
  const { data, loading, error } = useQuery(GET_EMPLOYEE_PROFILE, {
    variables: { id },
    skip: !id,
  })

  return {
    profile: data?.employees_by_pk || null,
    loading,
    error: error?.message
  }
}

export const useUpdateEmployeeProfile = () => {
  const [mutate, { loading, error }] = useMutation(UPDATE_EMPLOYEE_PROFILE)

  const updateProfile = useCallback(async (variables: {
    id: string
    firstname?: string
    lastname?: string
    email?: string
    phone_number?: string
    address?: string
    region?: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Profil mis à jour avec succès')
      return result.data?.update_employees_by_pk
    } catch (error) {
      toast.error('Erreur lors de la mise à jour du profil')
      throw error
    }
  }, [mutate])

  return { updateProfile, loading, error }
}

export const useChangePassword = () => {
  const [mutate, { loading, error }] = useMutation(CHANGE_PASSWORD)

  const changePassword = useCallback(async (variables: {
    id: string
    old_password: string
    new_password: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Mot de passe modifié avec succès')
      return result.data?.changePassword
    } catch (error) {
      toast.error('Erreur lors du changement de mot de passe')
      throw error
    }
  }, [mutate])

  return { changePassword, loading, error }
}

// ============================================================================
// NOTIFICATION HOOKS
// ============================================================================

export const useNotifications = (user_id: string) => {
  const { data, loading, error, refetch } = useQuery(GET_NOTIFICATIONS_QUERY, {
    variables: { user_id },
    skip: !user_id,
  })

  return {
    notifications: data?.notifications || [],
    loading,
    error,
    refetch,
  }
}

export const useMarkNotificationRead = () => {
  const [mutate, { loading, error }] = useMutation(MARK_NOTIFICATION_READ_MUTATION)

  const markNotificationRead = useCallback(async (id: string) => {
    try {
      const result = await mutate({ variables: { id } })
      return result.data?.update_notifications_by_pk
    } catch (error) {
      toast.error('Erreur lors du marquage de la notification')
      throw error
    }
  }, [mutate])

  return { markNotificationRead, loading, error }
}

// ============================================================================
// APPOINTMENT HOOKS
// ============================================================================

export const useAppointments = (employee_id: string) => {
  const { data, loading, error, refetch } = useQuery(GET_APPOINTMENTS_QUERY, {
    variables: { employee_id },
    skip: !employee_id,
  })

  return {
    appointments: data?.appointments || [],
    loading,
    error,
    refetch,
  }
}

export const useCreateAppointment = () => {
  const [mutate, { loading, error }] = useMutation(CREATE_APPOINTMENT_MUTATION)

  const createAppointment = useCallback(async (variables: {
    title: string
    description: string
    start_time: string
    end_time: string
    employee_id: string
  }) => {
    try {
      const result = await mutate({ variables })
      toast.success('Rendez-vous créé avec succès')
      return result.data?.insert_appointments_one
    } catch (error) {
      toast.error('Erreur lors de la création du rendez-vous')
      throw error
    }
  }, [mutate])

  return { createAppointment, loading, error }
} 

 