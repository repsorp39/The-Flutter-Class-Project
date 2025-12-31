import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/profile.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final gradientStart = const Color.fromARGB(255, 25, 210, 105);
    final gradientEnd = const Color.fromARGB(255, 10, 202, 116);
    
    // helper to render a labeled row with icon and divider
    Widget infoRow(IconData icon, String label, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              child: Icon(icon, color: gradientStart, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  const SizedBox(height: 6),
                  Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget thinDivider() => Container(height: 1, color: Colors.grey[200]);

    // avatar inner with image fallback
    Widget avatarInner = ClipOval(
      child: Image.network(
        profile.profileImageUrl,
        width: 104,
        height: 104,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 104,
            height: 104,
            color: Colors.grey[200],
            child: Icon(Icons.person, size: 56, color: gradientStart),
          );
        },
      ),
    );

  
  }
}

