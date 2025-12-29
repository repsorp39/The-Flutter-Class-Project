import 'package:flutter/material.dart';
import 'package:flutter_class_project/app_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State <MyApp> createState() => MyAppState();
}

void goTo(BuildContext context, Widget composant) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => composant));
}