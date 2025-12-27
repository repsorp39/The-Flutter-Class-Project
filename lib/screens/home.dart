import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/notification.dart';
import 'package:flutter_class_project/models/profile.dart';
import 'package:flutter_class_project/screens/notifications.dart';
import 'package:flutter_class_project/screens/profile.dart';

class HomePage extends StatelessWidget {
  final Profile profile;
  final List<NotificationModel> notifications;

  const HomePage({
    super.key,
    required this.profile,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    goTo(context, ProfilePage(profile: profile));
                  },
                  style: TextButton.styleFrom(
                    // un peu comme un all:unset en css
                    //notre but c'est de pouvoir cliquer sur le profile or il n'a pas le onPress, donc
                    //on utilise elevate Button auquel on retire le style par défaut
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      profile.profileImageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
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
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all(2),
                      child: IconButton(
                        onPressed: () {
                          goTo(context, NotificationPage(notif: notifications));
                        },
                        icon: Icon(Icons.notifications_active_outlined),
                        style: IconButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            248,
                            245,
                            245,
                          ),
                          padding: EdgeInsets.all(17),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Container(
                padding: EdgeInsets.only(right: 2,left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: const Color.fromARGB(255, 182, 179, 179), width: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //expanded c'est comme width 100%
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder
                              .none, // Supprime la bordure par défaut
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: "Search here ...",
                          icon: Icon(Icons.search, size: 26, weight: 15),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.flashlight_on, color: Colors.white),
                    //   style: IconButton.styleFrom(
                    //     backgroundColor: const Color.fromARGB(255, 12, 75, 14),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

            Row(),
          ],
        ),
      ),
    );
  }
}

void goTo(BuildContext context, Widget composant) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => composant));
}
