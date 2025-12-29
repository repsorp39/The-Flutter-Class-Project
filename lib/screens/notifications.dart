import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/notification.dart';

class NotificationPage extends StatelessWidget {
  final List<NotificationModel> notif;
  const NotificationPage({super.key, required this.notif});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: notif.isEmpty
          ? const Center(child: Text('Aucune notification'))
          // ListView.builder permet ici de creer une notification a la demande  
          : ListView.builder(
              itemCount: notif.length,
              itemBuilder: (context, index) {
                final n = notif[index];
                //Ici le LIstille est le composant qui represente une ligne des notification
                return ListTile(
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
                  onTap: () {},
                );
              },
            ),
    );
  }
}
