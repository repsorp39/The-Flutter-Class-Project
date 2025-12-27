import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/profile.dart';

class HomePage extends StatelessWidget {
  final Profile profile;
  const HomePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  profile.profileImageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(),
          Row(),
        ],
      ),
    );
  }
}
