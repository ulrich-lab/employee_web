import { gql } from '@apollo/client'

// ============================================================================
// ATTENDANCE QUERIES & MUTATIONS
// ============================================================================

export const CLOCK_IN_MUTATION = gql`
  mutation ClockIn($employee_id: uuid!, $building_id: uuid, $location: geometry = null) {
    insert_attendance_one(object: {
      employee_id: $employee_id,
      building_id: $building_id,
      location: $location, 
      clock_in_date: now
    }) {
      id
    }
  }
`

export const CLOCK_OUT_MUTATION = gql`
  mutation ClockOut($employee_id: uuid!) {
    update_attendance(
      where: {
        clock_in_date: {_eq: now}, 
        employee_id: {_eq: $employee_id}
      }, 
      _set: {clock_out_time: now}
    ) {
      affected_rows
    }
  }
`

export const ATTENDANCE_STATUS_SUBSCRIPTION = gql`
  subscription AttendanceStatus($employee_id: uuid!) {
    attendance(
      where: {
        employee_id: {_eq: $employee_id}, 
        clock_in_date: {_eq: "now()"}
      }
    ) {
      attendance_state {
        is_late
        id
      }
      clock_in_date
      clock_in_time
      clock_out_time
    }
  }
`

export const ATTENDANCE_LIST_SUBSCRIPTION = gql`
  subscription AttendanceList($employee_id: uuid!) {
    attendance(where: {employee_id: {_eq: $employee_id}}) {
      attendance_state {
        is_late
        id
      }
      clock_in_date
      clock_in_time
      clock_out_time
    }
  }
`

// ============================================================================
// VISITOR QUERIES & MUTATIONS
// ============================================================================

export const GET_VISITORS_QUERY = gql`
  query GetVisitors($limit: Int, $offset: Int) {
    visitors(
      limit: $limit, 
      offset: $offset, 
      order_by: {created_at: desc}
    ) {
      id
      name
      email
      phone
      company
      purpose
      host_name
      arrival_time
      departure_time
      status
      created_at
      updated_at
    }
  }
`

export const GET_VISITOR_DETAILS_QUERY = gql`
  query GetVisitorDetails($id: uuid!) {
    visitors_by_pk(id: $id) {
      id
      name
      email
      phone
      company
      purpose
      host_name
      arrival_time
      departure_time
      status
      created_at
      updated_at
    }
  }
`

export const ACCEPT_VISIT_MUTATION = gql`
  mutation AcceptVisit($id: uuid!) {
    update_visitors_by_pk(
      pk_columns: {id: $id}, 
      _set: {status: "approved"}
    ) {
      id
      status
    }
  }
`

export const REJECT_VISIT_MUTATION = gql`
  mutation RejectVisit($id: uuid!) {
    update_visitors_by_pk(
      pk_columns: {id: $id}, 
      _set: {status: REJECTED}
    ) {
      id
      status
    }
  }
`

export const CREATE_VISITOR_MUTATION = gql`
  mutation CreateVisitor(
    $name: String!
    $email: String!
    $phone: String!
    $company: String!
    $purpose: String!
    $host_name: String!
    $arrival_time: timestamptz!
  ) {
    insert_visitors_one(object: {
      name: $name
      email: $email
      phone: $phone
      company: $company
      purpose: $purpose
      host_name: $host_name
      arrival_time: $arrival_time
      status: PENDING
    }) {
      id
      name
      status
    }
  }
`

// ============================================================================
// PERMISSION QUERIES & MUTATIONS
// ============================================================================

export const GET_EMPLOYEE_LEAVES_QUERY = gql`
  query GetEmployeeLeaves($employee_id: uuid!) {
    leaves(where: {employee_id: {_eq: $employee_id}}) {
      id
      leave_type
      start_date
      end_date
      comment
      other_description
      status
      employee {
        id
        firstname
        lastname
      }
    }
  }
`

export const INSERT_LEAVE_MUTATION = gql`
  mutation InsertLeave(
    $employee_id: uuid!
    $leave_type: leave_type_enum!
    $start_date: date!
    $end_date: date!
    $comment: String!
  ) {
    insert_leaves_one(object: {
      employee_id: $employee_id
      leave_type: $leave_type
      start_date: $start_date
      end_date: $end_date
      comment: $comment
      status: PENDING
    }) {
      id
      status
    }
  }
`

export const UPDATE_LEAVE_MUTATION = gql`
  mutation UpdateLeave($id: uuid!, $updates: leaves_set_input!) {
    update_leaves_by_pk(pk_columns: {id: $id}, _set: $updates) {
      id
      status
    }
  }
`

export const DELETE_LEAVE_MUTATION = gql`
  mutation DeleteLeave($id: uuid!) {
    delete_leaves_by_pk(id: $id) {
      id
    }
  }
`

// ============================================================================
// CHAT QUERIES & MUTATIONS
// ============================================================================

export const GET_ALL_CONTACTS_LIST = gql`
  query GetAllContactsList($company_id: uuid) {
    employees(where: {company_id: {_eq: $company_id}}) {
      firstname
      lastname
      id
      phone_number
      file {
        file_url
        file_name
      }
    }
  }
`

export const CREATE_CONVERSATION = gql`
  mutation CreateConversation($firstParticipant: UUID!, $secondParticipants: UUID!) {
    createConversation(
      conversation: {isGroup: false, firstParticipant: $firstParticipant, secondParticipants: $secondParticipants}
    ) {
      id
    }
  }
`

export const INSERT_MESSAGE_WITH_ATTACHMENT = gql`
  mutation InsertMessageWithAttachment(
    $sender_id: uuid!, 
    $conversation_id: uuid!, 
    $content: String = null, 
    $file_path: String = null, 
    $file_type: String = null, 
    $mime_type: String = null, 
    $file_size: String = null, 
    $extension: String = null, 
    $width: String, 
    $length: String, 
    $height: String, 
    $filename: String, 
    $message_mobile_id: String, 
    $samples: String
  ) {
    insert_messages_one(object: {
      is_read: false, 
      sender_id: $sender_id, 
      conversation_id: $conversation_id, 
      content: $content, 
      attachments: {
        data: {
          file_path: $file_path, 
          file_type: $file_type, 
          mime_type: $mime_type, 
          file_size: $file_size, 
          extension: $extension, 
          width: $width, 
          length: $length, 
          height: $height, 
          filename: $filename, 
          samples: $samples
        }
      }, 
      message_mobile_id: $message_mobile_id
    }) {
      id
    }
  }
`

export const INSERT_MESSAGE_WITHOUT_ATTACHMENT = gql`
  mutation InsertMessageWithoutAttachment(
    $conversation_id: uuid!, 
    $content: String = null, 
    $sender_id: uuid!, 
    $message_mobile_id: String
  ) {
    insert_messages_one(object: {
      conversation_id: $conversation_id, 
      is_read: false, 
      content: $content, 
      sender_id: $sender_id, 
      message_mobile_id: $message_mobile_id
    }) {
      id
    }
  }
`

export const GET_CONVERSATION_STREAM_WITH_MESSAGE = gql`
  subscription GetConversationStreamWithMessage($employee_id: uuid!) {
    conversations(where: {employee_conversations: {employee_id: {_eq: $employee_id}}}, distinct_on: id) {
      id
      name
      is_group
      messages {
        content
        employee {
          firstname
          id
          lastname
        }
        conversation_id
        id
        is_read
        message_mobile_id
        sender_id
        created_at
        attachments {
          filename
          file_type
          file_size
          file_path
          extension
          id
          height
          length
          message_id
          mime_type
          updated_at
          width
          samples
        }
        message_statuses {
          status
          employee_id
        }
      }
      employee_conversations(where: {employee_id: {_neq: $employee_id}}) {
        employee_id
      }
    }
  }
`

export const UPDATE_MESSAGE_STATUS = gql`
  mutation UpdateMessageStatus($id: [UUID!]!, $status: String!) {
    updateMessageStatus(messageIds: {id: $id, status: $status}) {
      state
    }
  }
`

export const CREATE_GROUP = gql`
  mutation CreateGroup($name: String = "", $members: [employee_conversation_insert_input!]!) {
    insert_conversations_one(object: {
      is_group: true, 
      name: $name, 
      employee_conversations: {data: $members}
    }) {
      id
    }
  }
`

export const GET_ALL_EMPLOYEES = gql`
  query GetAllEmployee {
    departments {
      id
      abrev_code
      text_content {
        content
      }
      services {
        id
        text_content {
          content
        }
        employees {
          id
          firstname
          lastname
        }
      }
    }
  }
`

// ============================================================================
// PROFILE QUERIES & MUTATIONS
// ============================================================================

export const GET_EMPLOYEE_PROFILE_QUERY = gql`
  query GetEmployeeProfile($id: uuid!) {
    employees_by_pk(id: $id) {
      id
      name
      email
      phone
      role
      department
      avatar
      hire_date
      status
    }
  }
`

export const UPDATE_EMPLOYEE_INFO_MUTATION = gql`
  mutation UpdateEmployeeInfo($id: uuid!, $updates: employees_set_input!) {
    update_employees_by_pk(pk_columns: {id: $id}, _set: $updates) {
      id
      name
      email
      phone
    }
  }
`

export const UPDATE_PASSWORD_MUTATION = gql`
  mutation UpdatePassword($id: uuid!, $old_password: String!, $new_password: String!) {
    update_password(
      id: $id
      old_password: $old_password
      new_password: $new_password
    ) {
      success
      message
    }
  }
`

// ============================================================================
// NOTIFICATION QUERIES & MUTATIONS
// ============================================================================

export const GET_NOTIFICATIONS_QUERY = gql`
  query GetNotifications($user_id: uuid!) {
    notifications(
      where: {user_id: {_eq: $user_id}}
      order_by: {created_at: desc}
    ) {
      id
      title
      message
      type
      read
      created_at
    }
  }
`

export const MARK_NOTIFICATION_READ_MUTATION = gql`
  mutation MarkNotificationRead($id: uuid!) {
    update_notifications_by_pk(
      pk_columns: {id: $id}, 
      _set: {read: true}
    ) {
      id
      read
    }
  }
`

// ============================================================================
// APPOINTMENT QUERIES & MUTATIONS
// ============================================================================

export const GET_APPOINTMENTS_QUERY = gql`
  query GetAppointments($employee_id: uuid!) {
    appointments(where: {employee_id: {_eq: $employee_id}}) {
      id
      title
      description
      start_time
      end_time
      date
      status
      created_at
    }
  }
`

export const CREATE_APPOINTMENT_MUTATION = gql`
  mutation CreateAppointment(
    $title: String!
    $description: String!
    $start_time: timestamptz!
    $end_time: timestamptz!
    $employee_id: uuid!
  ) {
    insert_appointments_one(object: {
      title: $title
      description: $description
      start_time: $start_time
      end_time: $end_time
      employee_id: $employee_id
      status: "scheduled"
    }) {
      id
      title
      status
    }
  }
` 

// Visitor Queries
export const VISITOR_LIST_SUBSCRIPTION = gql`
  subscription ListenAllVisitor($host_employee: uuid!) {
    visits(where: {host_employee: {_eq: $host_employee}}) {
      id
      reg_no
      reason
      visitorByVisitor {
        firstname
        lastname
        file {
          file_url
        }
        phone_number
        id_number
      }
      status
      check_in_at
      check_out_at
      date
    }
  }
`

export const GET_VISITOR_DETAILS = gql`
  query GetVisitorDetails($id: uuid!) {
    visits_by_pk(id: $id) {
      department {
        id
        text_content {
          content
        }
      }
      employee {
        id
        lastname
        firstname
        function
      }
      service {
        id
        text_content {
          content
        }
      }
      vehicle
      status
      visitorByVisitor {
        id
        id_number
        lastname
        firstname
        phone_number
        file {
          file_url
          id
        }
      }
      reason
      id
      reg_no
      date
      check_out_at
      check_in_at
    }
  }
`

export const CLOCK_OUT_VISIT = gql`
  mutation ClockOutVisits($id: uuid!) {
    update_visits_by_pk(pk_columns: {id: $id}, _set: {check_out_at: now}) {
      id
    }
  }
`

export const ACCEPT_VISIT = gql`
  mutation AcceptVisit($id: uuid!) {
    update_visits_by_pk(pk_columns: {id: $id}, _set: {status: ACCEPTED, check_in_at: now, date: now}) {
      id
    }
  }
`

export const REJECT_VISIT = gql`
  mutation RejectVisit($id: uuid!) {
    update_visits_by_pk(pk_columns: {id: $id}, _set: {status: REJECTED}) {
      id
    }
  }
` 

// ============================================================================
// PROFILE QUERIES & MUTATIONS
// ============================================================================

export const GET_EMPLOYEE_PROFILE = gql`
  query GetEmployeeProfile($id: uuid!) {
    employees_by_pk(id: $id) {
      id
      firstname
      lastname
      email
      phone_number
      address
      region
      function
      license
      profile_picture
      company_id
      department_id
      service_id
      position_id
      created_at
      updated_at
      position {
        name
        level
      }
      department {
        text_content {
          content
        }
      }
      service {
        text_content {
          content
        }
      }
      company {
        name
      }
    }
  }
`

export const UPDATE_EMPLOYEE_PROFILE = gql`
  mutation UpdateEmployeeProfile(
    $id: uuid!
    $firstname: String
    $lastname: String
    $email: String
    $phone_number: String
    $address: String
    $region: String
  ) {
    update_employees_by_pk(
      pk_columns: { id: $id }
      _set: {
        firstname: $firstname
        lastname: $lastname
        email: $email
        phone_number: $phone_number
        address: $address
        region: $region
      }
    ) {
      id
      firstname
      lastname
      email
      phone_number
      address
      region
    }
  }
`

export const CHANGE_PASSWORD = gql`
  mutation ChangePassword($id: uuid!, $old_password: String!, $new_password: String!) {
    changePassword(
      employeeId: $id
      oldPassword: $old_password
      newPassword: $new_password
    ) {
      success
      message
    }
  }
` 