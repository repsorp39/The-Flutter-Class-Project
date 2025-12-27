import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/notification.dart';

class NotificationPage extends StatelessWidget {
  final List<NotificationModel> notif;
  const NotificationPage({super.key,required this.notif });
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Notifications page")));
  }
}
