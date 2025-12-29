import 'package:flutter/material.dart';
import 'package:flutter_class_project/composants/donation_cart.dart';
import 'package:flutter_class_project/models/feed.dart';

class SearchResults extends StatelessWidget {
  final String searchQuery;
  final List<Feed> feeds;
  const SearchResults({
    super.key,
    required this.searchQuery,
    required this.feeds,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search results for '$searchQuery'",
          style: TextStyle(
            color: Colors.blueGrey,
            fontFamily: "Regular",
            fontWeight: FontWeight.w500,
            fontSize: 18,
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
              children: (() {
                List<Feed> results = feeds.where((f) {
                  return f.category == searchQuery ||
                      f.description.toLowerCase().contains(searchQuery) ||
                      f.title.toLowerCase().contains(searchQuery);
                }).toList();
                
                return results.isNotEmpty
                    ? results.map((element) {
                        return DonationCard(feed: element);
                      }).toList()
                    : [
                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black.withValues(alpha: 0.04),
                          ),
                          child: Text(
                            "No results found for '$searchQuery'",
                            style: TextStyle(
                              fontFamily: "Regular",
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ];
              })(),
            ),
          ),
        ),
      ),
    );
  }
}
