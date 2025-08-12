export interface Leave {
  id: string
  status: string
  start_date: string
  end_date: string
  leave_type: string
  comment?: string
  other_description?: string
  employee: Employee
}

export interface Employee {
  id: string
  license?: string
  lastname: string
  firstname: string
  function: string
  file?: File
  department?: Department
  service?: Service
}

export interface File {
  id: string
  file_url: string
}

export interface Department {
  text_content: {
    content: string
  }
}

export interface Service {
  text_content: {
    content: string
  }
}

export interface LeaveType {
  type: string
}

export interface CreateLeaveData {
  start_date?: string
  start_time?: string
  end_date?: string
  end_time?: string
  leave_type: string
  comment?: string
  other_description?: string
  employee_id: string
}

export interface UpdateLeaveData {
  id: string
  leave_type?: string
  start_date?: string
  end_date?: string
  other_description?: string
  comment?: string
  file?: string
} 