import 'package:flutter/material.dart';
import 'package:flutter_class_project/main.dart';
import 'package:flutter_class_project/models/feed.dart';
import 'package:flutter_class_project/screens/search_results.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, required this.feeds});
  final List<Feed> feeds;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  String inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.03),
                borderRadius: BorderRadius.all(Radius.circular(70)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //expanded c'est comme width 100%
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => inputValue = value,
                      decoration: const InputDecoration(
                        border: InputBorder
                            .none, // Supprime toutes les bordures par défaut
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: "Search here ...",
                        icon: Icon(Icons.search, size: 24, weight: 15),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25, left: 10),
          child: IconButton(
            onPressed: () {
              if (inputValue.isNotEmpty) {
                goTo(
                  context,
                  SearchResults(
                    searchQuery: inputValue.toLowerCase(),
                    feeds: widget.feeds,
                  ),
                );
              }
            },
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(15),
              backgroundColor: const Color.fromARGB(255, 57, 107, 58),
            ),
            icon: Icon(Icons.flag_outlined, color: Colors.white, weight: 1),
          ),
        ),
      ],
    );
  }
}
