import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/feed.dart';
import 'package:flutter_class_project/screens/details.dart';
import 'package:flutter_class_project/main.dart';

class DonationCard extends StatelessWidget {
  final Feed feed;

  const DonationCard({super.key, required this.feed});
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 335,
      width:
          MediaQuery.of(context).size.width *
          0.7, //70% de la largeur de l'ecran pour notre carte
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        hoverColor: Colors.black.withValues(alpha: 0.03),
        onTap: () {
          goTo(context, DetailsPage(feed: feed));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.network(
                feed.imageUrl,
                fit: BoxFit.cover,
                height: 175,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feed.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 53, 53, 53),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            Text(
                              "${feed.raised} ${feed.category}",
                              style: TextStyle(fontFamily: "Regular"),
                            ),
                            Padding(padding: EdgeInsets.only(right: 7)),
                            Icon(Icons.circle, size: 10, color: Colors.red),
                            Padding(padding: EdgeInsets.only(left: 7)),
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 60,
                              child: Text(
                                feed.location,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(fontFamily: "Regular"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.check_circle_outline, size: 14),
                ],
              ),
            ),

            Row(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 7,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withValues(alpha: 0.03),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            height: 7,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 74, 139, 75),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width:
                                MediaQuery.of(context).size.width *
                                0.65 *
                                (feed.raised / feed.target),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "${feed.myOwnCount} ${feed.category.toLowerCase()} donated.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
