'use client'

import { useState, useEffect } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { MessageSquare, Users, User, Plus, Search, Send, MoreVertical, Phone, Video, Image, Paperclip, Smile, Send as SendIcon, ArrowLeft } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { useAuthStore } from '@/store/auth-store'
import { 
  useAllContactsList, 
  useConversationStream, 
  useCreateConversation, 
  useInsertMessageWithoutAttachment,
  useCreateGroup,
  useAllEmployees
} from '@/lib/graphql/hooks'
import { Conversation, Message, Employee, Contact } from '@/types/chat'

export default function MessagesPage() {
  const { t } = useTranslation()
  const { user } = useAuthStore()
  const [activeConversation, setActiveConversation] = useState<string | null>(null)
  const [showNewChat, setShowNewChat] = useState(false)
  const [showCreateGroup, setShowCreateGroup] = useState(false)
  const [selectedContacts, setSelectedContacts] = useState<string[]>([])
  const [messageText, setMessageText] = useState('')
  const [searchTerm, setSearchTerm] = useState('')
  const [currentMessage, setCurrentMessage] = useState('')
  const [showChat, setShowChat] = useState(false) // For mobile responsive
  const [groupName, setGroupName] = useState('')
  const [contactSearchTerm, setContactSearchTerm] = useState('')

  // GraphQL hooks
  const { contacts: allContacts, loading: contactsLoading } = useAllContactsList(user?.company_id)
  const { conversations, loading: conversationsLoading } = useConversationStream(user?.id || '')
  const { createConversation, loading: createConversationLoading } = useCreateConversation()
  const { insertMessage, loading: sendMessageLoading } = useInsertMessageWithoutAttachment()
  const { createGroup, loading: createGroupLoading } = useCreateGroup()
  const { departments, loading: departmentsLoading } = useAllEmployees()

  // Transform contacts from GraphQL to Contact interface
  const contacts: Contact[] = allContacts.map((contact: any) => ({
    id: contact.id,
    displayName: `${contact.firstname} ${contact.lastname}`,
    avatarUrl: contact.file?.file_url,
    phoneNumber: contact.phone_number,
    isOnline: true // We'll need to implement online status later
  }))

  // Transform conversations from GraphQL to our interface
  const transformedConversations = conversations.map((conv: any) => {
    const lastMessage = conv.messages?.[conv.messages.length - 1]
    const otherParticipants = conv.employee_conversations || []
    
    return {
      id: conv.id,
      type: conv.is_group ? 'group' : 'individual',
      name: conv.name || 'Conversation',
      participants: otherParticipants.map((p: any) => {
        const contact = contacts.find(c => c.id === p.employee_id)
        return contact || {
          id: p.employee_id,
          displayName: 'Utilisateur inconnu',
          phoneNumber: '',
          isOnline: false
        }
      }),
      lastMessage: lastMessage ? {
        id: lastMessage.id,
        senderId: lastMessage.sender_id,
        content: lastMessage.content,
        timestamp: lastMessage.created_at,
        type: lastMessage.attachments?.length > 0 ? 'file' : 'text',
        isRead: lastMessage.is_read
      } : undefined,
      unreadCount: conv.messages?.filter((m: any) => !m.is_read && m.sender_id !== user?.id).length || 0,
      isActive: activeConversation === conv.id,
      messages: conv.messages || [] // Add messages array
    }
  })

  // Get current conversation messages
  const currentConversation = transformedConversations.find((conv: any) => conv.id === activeConversation)
  const currentMessages = currentConversation?.messages || []

  // Transform messages for display
  const transformedMessages = currentMessages.map((msg: any) => ({
    id: msg.id,
    senderId: msg.sender_id,
    content: msg.content,
    timestamp: msg.created_at,
    type: msg.attachments?.length > 0 ? 'file' : 'text',
    isRead: msg.is_read,
    sender: contacts.find(c => c.id === msg.sender_id) || {
      id: msg.sender_id,
      displayName: 'Utilisateur inconnu',
      phoneNumber: '',
      isOnline: false
    }
  }))

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'online':
        return 'bg-green-100 text-green-800 border-green-200'
      case 'away':
        return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'offline':
        return 'bg-gray-100 text-gray-800 border-gray-200'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  const getStatusText = (status: string) => {
    switch (status) {
      case 'online':
        return t('messages.online')
      case 'away':
        return t('messages.away')
      case 'offline':
        return t('messages.offline')
      default:
        return t('messages.unknown')
    }
  }

  const formatTime = (timeString: string) => {
    const date = new Date(timeString)
    const now = new Date()
    const diffInHours = (now.getTime() - date.getTime()) / (1000 * 60 * 60)
    
    if (diffInHours < 24) {
      return date.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' })
    } else {
      return date.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit' })
    }
  }

  const handleSendMessage = async () => {
    if (!currentMessage.trim() || !activeConversation) return

    try {
      await insertMessage({
        conversation_id: activeConversation,
        content: currentMessage,
        sender_id: user?.id || '',
        message_mobile_id: Date.now().toString()
      })
      setCurrentMessage('')
    } catch (error) {
      console.error('Erreur lors de l\'envoi du message:', error)
    }
  }

  const handleCreateGroup = async () => {
    if (selectedContacts.length === 0) return

    try {
      await createGroup({
        name: groupName.trim() || `Groupe ${Date.now()}`,
        members: selectedContacts.map(id => ({ employee_id: id }))
      })
      setShowCreateGroup(false)
      setSelectedContacts([])
    } catch (error) {
      console.error('Erreur lors de la création du groupe:', error)
    }
  }

  const handleContactSelect = (contactId: string) => {
    setSelectedContacts(prev => 
      prev.includes(contactId) 
        ? prev.filter(id => id !== contactId)
        : [...prev, contactId]
    )
  }

  const handleStartConversation = async (contactId: string) => {
    try {
      const conversationId = await createConversation({
        firstParticipant: user?.id || '',
        secondParticipants: contactId
      })
      setActiveConversation(conversationId)
      setShowNewChat(false)
      setShowChat(true) // Show chat on mobile
    } catch (error) {
      console.error('Erreur lors de la création de la conversation:', error)
    }
  }

  const handleConversationSelect = (conversationId: string) => {
    setActiveConversation(conversationId)
    setShowChat(true) // Show chat on mobile
  }

  const handleBackToList = () => {
    setShowChat(false)
    setActiveConversation(null)
  }

  // Filter conversations based on search
  const filteredConversations = transformedConversations.filter((conversation: any) =>
    conversation.name.toLowerCase().includes(searchTerm.toLowerCase())
  )

  // Filter contacts based on search
  const filteredContacts = contacts.filter(contact =>
    contact.displayName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    contact.phoneNumber.includes(searchTerm)
  )

  // Filter contacts for modals
  const modalFilteredContacts = contacts.filter(contact =>
    contact.displayName.toLowerCase().includes(contactSearchTerm.toLowerCase()) ||
    contact.phoneNumber.includes(contactSearchTerm)
  )

  if (conversationsLoading) {
    return (
      <div className="flex items-center justify-center h-full">
        <div className="text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Chargement des conversations...</p>
        </div>
      </div>
    )
  }

  return (
    <div className={`h-full flex flex-col ${showChat ? 'md:relative md:z-auto md:bg-transparent fixed inset-0 z-50 bg-white pb-16' : 'pb-16 md:pb-0'}`}>
      {/* Custom scrollbar styles */}
      <style jsx>{`
        .custom-scrollbar::-webkit-scrollbar {
          width: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
          background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
          background: rgba(156, 163, 175, 0.3);
          border-radius: 2px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
          background: rgba(156, 163, 175, 0.5);
        }
        .custom-scrollbar {
          scrollbar-width: thin;
          scrollbar-color: rgba(156, 163, 175, 0.3) transparent;
        }
      `}</style>

      {/* Header - Hidden on mobile when showing chat */}
      <div className={`p-4 border-b ${showChat ? 'hidden md:flex' : 'flex'} items-center justify-between flex-shrink-0`}>
        <div className="flex items-center gap-3">
          <div className="p-2 bg-blue-100 rounded-lg">
            <MessageSquare className="h-5 w-5 text-blue-600" />
          </div>
          <div className="hidden md:block">
            <h1 className="text-lg font-semibold text-gray-900">
              {t('navigation.messages')}
            </h1>
            <p className="text-sm text-gray-600">
              {t('messages.subtitle')}
            </p>
          </div>
        </div>
        <div className="flex gap-2">
          <Button
            onClick={() => setShowNewChat(true)}
            size="sm"
            className="bg-blue-600 hover:bg-blue-700 text-xs"
          >
            <Plus className="h-3 w-3 mr-1" />
            {t('messages.newConversation')}
          </Button>
          <Button
            onClick={() => setShowCreateGroup(true)}
            size="sm"
            variant="outline"
            className="text-xs"
          >
            <Users className="h-3 w-3 mr-1" />
            {t('messages.createGroup')}
          </Button>
        </div>
      </div>

      {/* Search - Hidden on mobile when showing chat */}
      <div className={`p-3 border-b ${showChat ? 'hidden md:block' : 'block'} flex-shrink-0`}>
        <div className="relative">
          <Search className="absolute left-2 top-1/2 transform -translate-y-1/2 text-gray-400 h-3 w-3" />
          <Input
            placeholder={t('messages.searchContacts')}
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="pl-8 text-sm"
          />
        </div>
      </div>

      {/* Main Content Area - Two independent scrollable areas */}
      <div className="flex-1 flex overflow-hidden min-h-0">
        {/* Left Side - Conversations List (Independent scroll) */}
        <div className={`${showChat ? 'hidden md:block md:w-1/3' : 'w-full md:w-1/3'} border-r flex flex-col`}>
          <div className="flex-1 overflow-y-auto custom-scrollbar">
            {filteredConversations.length === 0 ? (
              <div className="p-3 text-center text-gray-500">
                <MessageSquare className="h-10 w-10 mx-auto mb-2 text-gray-300" />
                <p className="text-sm">{t('messages.noConversations')}</p>
              </div>
            ) : (
              <div className="divide-y">
                {filteredConversations.map((conversation: any) => (
                  <div
                    key={conversation.id}
                    onClick={() => handleConversationSelect(conversation.id)}
                    className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${
                      conversation.isActive ? 'bg-blue-50 border-r-2 border-blue-600' : ''
                    }`}
                  >
                    <div className="flex items-center gap-2">
                      <div className="relative">
                        <div className="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center">
                          {conversation.type === 'group' ? (
                            <Users className="h-4 w-4 text-gray-600" />
                          ) : (
                            <User className="h-4 w-4 text-gray-600" />
                          )}
                        </div>
                        {conversation.unreadCount > 0 && (
                          <Badge className="absolute -top-1 -right-1 h-4 w-4 rounded-full p-0 flex items-center justify-center text-xs">
                            {conversation.unreadCount}
                          </Badge>
                        )}
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center justify-between">
                          <h3 className="font-medium text-gray-900 truncate text-sm">
                            {conversation.name}
                          </h3>
                          {conversation.lastMessage && (
                            <span className="text-xs text-gray-500">
                              {formatTime(conversation.lastMessage.timestamp)}
                            </span>
                          )}
                        </div>
                        {conversation.lastMessage && (
                          <p className="text-xs text-gray-600 truncate">
                            {conversation.lastMessage.content}
                          </p>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>

        {/* Right Side - Chat Area (Independent scroll) */}
        <div className={`${showChat ? 'w-full' : 'hidden md:flex md:flex-1'} flex flex-col h-full`}>
          {activeConversation ? (
            <>
              {/* Chat Header - Fixed */}
              <div className="p-3 border-b flex items-center justify-between bg-white flex-shrink-0">
                <div className="flex items-center gap-2">
                  {/* Back button for mobile */}
                  <Button
                    onClick={handleBackToList}
                    size="sm"
                    variant="ghost"
                    className="md:hidden"
                  >
                    <ArrowLeft className="h-4 w-4" />
                  </Button>
                  <div className="w-6 h-6 bg-gray-200 rounded-full flex items-center justify-center">
                    <User className="h-3 w-3 text-gray-600" />
                  </div>
                  <div>
                    <h3 className="font-medium text-gray-900 text-sm">
                      {transformedConversations.find((c: any) => c.id === activeConversation)?.name}
                    </h3>
                    <p className="text-xs text-gray-500">{t('messages.online')}</p>
                  </div>
                </div>
                <div className="flex gap-1">
                  <Button size="sm" variant="ghost">
                    <Phone className="h-3 w-3" />
                  </Button>
                  <Button size="sm" variant="ghost">
                    <Video className="h-3 w-3" />
                  </Button>
                  <Button size="sm" variant="ghost">
                    <MoreVertical className="h-3 w-3" />
                  </Button>
                </div>
              </div>

              {/* Messages - Scrollable area with fixed height */}
              <div className="flex-1 overflow-y-auto p-3 space-y-3 min-h-0 custom-scrollbar">
                {transformedMessages.map((message: any) => (
                  <div
                    key={message.id}
                    className={`flex ${message.senderId === user?.id ? 'justify-end' : 'justify-start'}`}
                  >
                    <div className={`flex flex-col ${message.senderId === user?.id ? 'items-end' : 'items-start'}`}>
                      <div className="flex items-center gap-1">
                        <Badge className={`text-xs ${getStatusColor(message.sender.isOnline ? 'online' : 'offline')}`}>
                          {getStatusText(message.sender.isOnline ? 'online' : 'offline')}
                        </Badge>
                        <span className="text-xs text-gray-500">{formatTime(message.timestamp)}</span>
                      </div>
                      <div className={`p-2 rounded-lg max-w-[70%] ${message.senderId === user?.id ? 'bg-blue-100 text-blue-800' : 'bg-gray-100 text-gray-800'}`}>
                        {message.type === 'file' ? (
                          <div className="flex items-center gap-1 text-xs text-gray-600">
                            <Paperclip className="h-3 w-3" />
                            {message.content}
                          </div>
                        ) : (
                          <p>{message.content}</p>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>

              {/* Message Input - Fixed at bottom */}
              <div className="p-3 border-t bg-white flex-shrink-0">
                <div className="flex items-center gap-1">
                  <Button size="sm" variant="ghost">
                    <Paperclip className="h-3 w-3" />
                  </Button>
                  <Button size="sm" variant="ghost">
                    <Image className="h-3 w-3" />
                  </Button>
                  <Button size="sm" variant="ghost">
                    <Smile className="h-3 w-3" />
                  </Button>
                  <Input
                    placeholder={t('messages.typeMessage')}
                    value={currentMessage}
                    onChange={(e) => setCurrentMessage(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && handleSendMessage()}
                    className="flex-1 text-sm"
                  />
                  <Button
                    onClick={handleSendMessage}
                    disabled={sendMessageLoading || !currentMessage.trim()}
                    size="sm"
                    className="bg-blue-600 hover:bg-blue-700"
                  >
                    <SendIcon className="h-3 w-3" />
                  </Button>
                </div>
              </div>
            </>
          ) : (
            <div className="flex-1 flex items-center justify-center">
              <div className="text-center text-gray-500">
                <MessageSquare className="h-10 w-10 mx-auto mb-3 text-gray-300" />
                <h3 className="text-base font-medium mb-2">{t('messages.selectConversation')}</h3>
                <p className="text-xs">{t('messages.selectConversationSubtitle')}</p>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* New Chat Modal */}
      {showNewChat && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <Card className="w-96 max-h-[80vh] flex flex-col">
            <CardHeader className="pb-3 border-b">
              <CardTitle className="text-lg">{t('messages.newConversation')}</CardTitle>
              <p className="text-sm text-gray-600">{t('messages.selectContactToStart')}</p>
            </CardHeader>
            <CardContent className="flex-1 overflow-hidden flex flex-col">
              {/* Search */}
              <div className="mb-4">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                  <Input
                    placeholder={t('messages.searchByName')}
                    value={contactSearchTerm}
                    onChange={(e) => setContactSearchTerm(e.target.value)}
                    className="pl-10 text-sm"
                  />
                </div>
              </div>
              
              {/* Contacts List */}
              <div className="flex-1 overflow-y-auto custom-scrollbar">
                {modalFilteredContacts.length === 0 ? (
                  <div className="text-center py-8 text-gray-500">
                    <User className="h-12 w-12 mx-auto mb-3 text-gray-300" />
                    <p className="text-sm">{t('messages.noContactsFound')}</p>
                  </div>
                ) : (
                  <div className="space-y-1">
                    {modalFilteredContacts.map((contact) => (
                      <div
                        key={contact.id}
                        onClick={() => handleStartConversation(contact.id)}
                        className="flex items-center gap-3 p-3 hover:bg-gray-50 rounded-lg cursor-pointer transition-colors"
                      >
                        <div className="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center">
                          <User className="h-5 w-5 text-gray-600" />
                        </div>
                        <div className="flex-1">
                          <p className="font-medium text-sm">{contact.displayName}</p>
                          <p className="text-xs text-gray-500">{contact.phoneNumber}</p>
                        </div>
                        <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
              
              {/* Actions */}
              <div className="mt-4 pt-3 border-t">
                                  <Button
                    onClick={() => {
                      setShowNewChat(false)
                      setContactSearchTerm('')
                    }}
                    variant="outline"
                    className="w-full"
                  >
                    {t('messages.cancel')}
                  </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Create Group Modal */}
      {showCreateGroup && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <Card className="w-96 max-h-[80vh] flex flex-col">
            <CardHeader className="pb-3 border-b">
              <CardTitle className="text-lg">{t('messages.createGroup')}</CardTitle>
              <p className="text-sm text-gray-600">{t('messages.selectMembersAndName')}</p>
            </CardHeader>
            <CardContent className="flex-1 overflow-hidden flex flex-col">
              {/* Group Name Input */}
              <div className="mb-4">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  {t('messages.groupName')}
                </label>
                <Input
                  placeholder={t('messages.enterGroupName')}
                  value={groupName}
                  onChange={(e) => setGroupName(e.target.value)}
                  className="text-sm"
                />
              </div>
              
              {/* Search */}
              <div className="mb-4">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                  <Input
                    placeholder={t('messages.searchMembers')}
                    value={contactSearchTerm}
                    onChange={(e) => setContactSearchTerm(e.target.value)}
                    className="pl-10 text-sm"
                  />
                </div>
              </div>
              
              {/* Selected Contacts Count */}
              {selectedContacts.length > 0 && (
                <div className="mb-3 p-2 bg-blue-50 rounded-lg">
                  <p className="text-sm text-blue-700">
                    {selectedContacts.length} {t('messages.selectedMembers')}
                  </p>
                </div>
              )}
              
              {/* Contacts List */}
              <div className="flex-1 overflow-y-auto custom-scrollbar">
                {modalFilteredContacts.length === 0 ? (
                  <div className="text-center py-8 text-gray-500">
                    <Users className="h-12 w-12 mx-auto mb-3 text-gray-300" />
                    <p className="text-sm">{t('messages.noContactsFound')}</p>
                  </div>
                ) : (
                  <div className="space-y-1">
                    {modalFilteredContacts.map((contact) => (
                      <div
                        key={contact.id}
                        onClick={() => handleContactSelect(contact.id)}
                        className={`flex items-center gap-3 p-3 rounded-lg cursor-pointer transition-colors ${
                          selectedContacts.includes(contact.id) ? 'bg-blue-50 border border-blue-200' : 'hover:bg-gray-50'
                        }`}
                      >
                        <div className="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center">
                          <User className="h-5 w-5 text-gray-600" />
                        </div>
                        <div className="flex-1">
                          <p className="font-medium text-sm">{contact.displayName}</p>
                          <p className="text-xs text-gray-500">{contact.phoneNumber}</p>
                        </div>
                        {selectedContacts.includes(contact.id) && (
                          <div className="w-5 h-5 bg-blue-600 rounded-full flex items-center justify-center">
                            <div className="w-2 h-2 bg-white rounded-full"></div>
                          </div>
                        )}
                      </div>
                    ))}
                  </div>
                )}
              </div>
              
              {/* Actions */}
              <div className="mt-4 pt-3 border-t flex gap-2">
                <Button
                  onClick={() => {
                    setShowCreateGroup(false)
                    setContactSearchTerm('')
                    setGroupName('')
                    setSelectedContacts([])
                  }}
                  variant="outline"
                  className="flex-1"
                >
                  {t('messages.cancel')}
                </Button>
                <Button
                  onClick={handleCreateGroup}
                  disabled={createGroupLoading || selectedContacts.length === 0 || !groupName.trim()}
                  className="flex-1 bg-blue-600 hover:bg-blue-700"
                >
                  {createGroupLoading ? t('messages.creating') : t('messages.createGroup')}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  )
} 