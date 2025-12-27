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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  profile.profileImageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 30),
                      Text(
                        "Feeding America",
                        style: TextStyle(fontSize: 16, fontFamily: "Regular"),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ],
              ),

              Column(children: [Icon(Icons.notifications_on_outlined)]),
            ],
          ),
          Row(),
          Row(),
        ],
      ),
    );
  }
}
