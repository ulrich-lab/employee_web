// Interface de notification multiplateforme
abstract class INotificationAdapter {
  Future<void> initialize();
  Future<void> showNotification(String title, String body);
}

// Sélection dynamique (à initialiser dans main ou au démarrage)
late final INotificationAdapter notificationAdapter; 