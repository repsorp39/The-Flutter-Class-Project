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
                borderRadius: BorderRadius.circular(12.0),
              ),

              margin: EdgeInsets.all(10),
              child: Image.network(
                feed.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Text(
                feed.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Divider(height: 30),
            // 3. Barre de progression (Données de ton modèle)
            // Text("Objectif : ${feed.target}\$"),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    // margin: EdgeInsets.all(9.0),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Raised : \$ ${feed.raised}"),
                      Text("Target : \$ ${feed.target}"),
                    ],
                  ),
                  SizedBox(height: 9),
                  LinearProgressIndicator(
                    value: feed.raised / feed.target, // Ratio de progression
                    backgroundColor: Colors.grey[200],
                    color: Colors.green,
                  ),
                  SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(feed.raised / feed.target) * 100} % target reached",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("${feed.timeElapsed} left"),
                    ],
                  ),
                  Row(
                    children: [
                      
                    ],
                  ),
                ],
              ),
            ),

            Row(
              children: [
                // if (feed.eventImages.isNotEmpty) ...[
                //   Text(
                //     "Galerie photos",
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //   ),
                //   SizedBox(height: 15),
                //   // Un container à hauteur fixe est nécessaire pour un ListView horizontal
                //   SizedBox(
                //     height: 100,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: feed.eventImages.length,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.only(right: 10),
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(15),
                //             child: Image.network(
                //               feed.eventImages[index],
                //               width: 100,
                //               height: 100,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
