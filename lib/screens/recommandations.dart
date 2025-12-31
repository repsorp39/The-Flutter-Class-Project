import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_class_project/composants/donation_cart.dart';
import 'package:flutter_class_project/models/feed.dart';

class RecommandationsAll extends StatelessWidget {
  final List<Feed> allFeedRecommandations;
  const RecommandationsAll({super.key, required this.allFeedRecommandations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Toutes les recommandations",
          style: TextStyle(
            color: Colors.blueGrey,
            fontFamily: "Regular",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: allFeedRecommandations.map((element) {
                return DonationCard(feed: element);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
