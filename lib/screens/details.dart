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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "${((feed.raised / feed.target) * 100).toInt()} % target reached",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("${feed.timeElapsed} left"),
                    ],
                  ),
                  SizedBox(height: 9),
                  SizedBox(
                    height: 35,
                    child: Stack(
                      children: [
                        for (int i = 0; i < feed.listDonate.length; i++)
                          Positioned(
                            left: i * 20,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ), // bordure blanche
                              ),
                              child: CircleAvatar(
                                radius: 40.0 / 2,
                                backgroundImage: NetworkImage(
                                  feed.listDonate[i],
                                ),
                              ),
                            ),
                          ),
                        //  Afficher le nombre restant si plus de 5 donateurs
                        if (feed.listDonate.length > 5)
                          Positioned(
                            left: 5 * 25,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[300],
                              child: Text(
                                "+${feed.globalCount - 5}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
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
