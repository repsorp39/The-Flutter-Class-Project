import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/feed.dart';

class DetailsPage extends StatelessWidget {
  final Feed feed;
  const DetailsPage({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias, 
              shape: RoundedRectangleBorder(
                // side: BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(12.0)
              ),

              margin: EdgeInsets.all(10),
              child: Image.network(feed.imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover,),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Text(
              feed.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ) ,)
            
          ],
        ),
      )
    );
  }
}
