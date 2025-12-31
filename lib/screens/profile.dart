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

   return Scaffold(
      appBar: AppBar(title: const Text("My profile page")),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with gradient and avatar overlap
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [gradientStart, gradientEnd],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          profile.fullname,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 136,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundColor: Colors.grey[200],
                        child: avatarInner,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ],
              ),
              /*const SizedBox(height: 80),

             // White card with rows and thin dividers
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    infoRow(Icons.person_outline, 'Nom', profile.fullname),
                    thinDivider(),
                    infoRow(Icons.location_on_outlined, 'Localisation', profile.location.isNotEmpty ? profile.location : '—'),
                    thinDivider(),
                    infoRow(Icons.favorite_border, 'Total des dons', '${profile.totalDonations}'),
                    thinDivider(),
                    infoRow(Icons.email_outlined, 'Email', profile.email),
                    if (profile.bio.isNotEmpty) ...[
                      thinDivider(),
                      infoRow(Icons.info_outline, 'À propos', profile.bio),
                    ],
                    thinDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(
                        children: [
                          SizedBox(width: 36, child: Icon(Icons.remove_red_eye_outlined, color: gradientStart)),
                          const SizedBox(width: 12),
                          const Expanded(child: Text('Password', style: TextStyle(fontSize: 12, color: Colors.grey))),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh, color: Colors.grey)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Edit button centered with gradient
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [gradientStart, gradientEnd]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(minHeight: 48),
                      child: const Text('Edit profile', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 26),
            ],
          ),
        ),
      ),*/
    );
  }
}

