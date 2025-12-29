import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/feed.dart';

class DetailsPage extends StatelessWidget {
  final Feed feed;
  const DetailsPage({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page details')),
      body: Text("Le composant detail sur cette page"),
    );
  }
}
