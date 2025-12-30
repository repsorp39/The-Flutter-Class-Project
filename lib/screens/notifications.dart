import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/notification.dart';

class NotificationPage extends StatefulWidget {
  final List<NotificationModel> notif;
  const NotificationPage({super.key, required this.notif});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List<NotificationModel> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = List<NotificationModel>.from(widget.notif);
  }

  // Marque toutes les notifications comme lues
  void _markAllRead() {
    setState(() {
      for (var n in _notifications) {
        n.isRead = true;
      }
    });
  }

  // Supprime toutes les notifications après confirmation
  Future<void> _clearAll() async {
    final yes = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Supprimer toutes les notifications ?'),
        content: const Text('Cette action est irréversible.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c, false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(c, true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
    if (yes == true) {
      setState(() => _notifications.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          // Bouton texte pour marquer toutes les notifications comme lues
          TextButton(
            onPressed: _notifications.isEmpty ? null : _markAllRead,
            child: const Text(
              'Tout marquer lu',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Icône pour supprimer toutes les notifications 
          IconButton(
            onPressed: _notifications.isEmpty ? null : _clearAll,
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Supprimer tout',
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(child: Text('Aucune notification'))
          // ListView.builder permet de créer les éléments à la demande dans ce cas des notifications
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final n = _notifications[index];
                // Dismissible est un widget Flutter qui permet de supprime un élément par balayage.On fournit une cle unique et on gère la suppression dans onDismissed.
                return Dismissible(
                  key: ValueKey(n.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  //Action a la suppresion d'une notification
                  onDismissed: (_) {
                    // On supprime l'element localement et on met à jour l'interface
                    setState(() {
                      _notifications.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Notification supprimée')),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: n.isRead
                          ? Colors.grey.shade300
                          : Colors.green,
                      child: Icon(
                        n.isRead
                            ? Icons.notifications_none
                            : Icons.notification_important,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      n.title,
                      style: TextStyle(
                        fontWeight: n.isRead
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      n.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      n.timestamp,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    onTap: () {
                      // Quand l'utilisateur tape sur la notification on affiche une modale et l'etat de visibilite de la notification passe a true
                      setState(() {
                        n.isRead = true;
                      });

                      showDialog<void>(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: Text(n.title),
                          content: Text('${n.message}\n\n${n.timestamp}'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(c),
                              child: const Text('Fermer'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
