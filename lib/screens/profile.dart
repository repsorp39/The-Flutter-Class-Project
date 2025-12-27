import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/profile.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My profile page")),
      body: Container(child: Text(profile.email)),
    );
  }
}
