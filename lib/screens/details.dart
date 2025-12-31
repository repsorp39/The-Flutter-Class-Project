import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_class_project/models/feed.dart';
import 'package:flutter_class_project/screens/modal.dart';

class DetailsPage extends StatefulWidget {
  final Feed feed;
  const DetailsPage({super.key, required this.feed});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details", style: TextStyle(fontFamily: 'Regular'),)),
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
              padding: EdgeInsetsGeometry.all(8),
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
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    minHeight: 8,
                    value:
                        widget.feed.raised /
                        widget.feed.target, // Ratio de progression
                    backgroundColor: Colors.grey[200],
                    color: const Color.fromARGB(255, 57, 162, 60),
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
                  SizedBox(height: 9),
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
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.feed.description,
                        maxLines: isExpanded ? null : 3,
                        overflow: isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            isExpanded ? "Voir moins" : "Voir plus",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Donors",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("See all"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 23, 124, 26),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () { showPaymentModal(context); },
            child: Text(
              "Faire un don ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  void showPaymentModal(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: PaymentModal(),
        );
      },
    );
  }