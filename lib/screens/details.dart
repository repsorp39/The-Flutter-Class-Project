import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/feed.dart';

class DetailsPage extends StatefulWidget {
  final Feed feed;
  const DetailsPage({super.key, required this.feed});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                widget.feed.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Text(
                widget.feed.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Raised : \$ ${widget.feed.raised}"),
                      Text("Target : \$ ${widget.feed.target}"),
                    ],
                  ),
                  SizedBox(height: 9),
                  LinearProgressIndicator(
                    value: widget.feed.raised / widget.feed.target, // Ratio de progression
                    backgroundColor: Colors.grey[200],
                    color: Colors.green,
                  ),
                  SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${((widget.feed.raised / widget.feed.target) * 100).toInt()} % target reached",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("${widget.feed.timeElapsed} left"),
                    ],
                  ),
                  SizedBox(height: 9),
                  SizedBox(
                    height: 35,
                    child: Stack(
                      children: [
                        for (int i = 0; i < widget.feed.listDonate.length; i++)
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
                                  widget.feed.listDonate[i],
                                ),
                              ),
                            ),
                          ),
                        //  Afficher le nombre restant si plus de 5 donateurs
                        if (widget.feed.listDonate.length > 5)
                          Positioned(
                            left: 5 * 25,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[300],
                              child: Text(
                                "+${widget.feed.globalCount - 5}",
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
                  SizedBox(height: 10),
                  if (widget.feed.eventImages.isNotEmpty) ...[
                    SizedBox(height: 10),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.feed.eventImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                widget.feed.eventImages[index],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  
                  Row(children: [
                      
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
