class Feed {

  final int id;
  Feed({
    required this.id,
    required String imageUrl,
    required String category,
    required String location,
    required String title,
    required String description,
    required List<String> eventImages,
    required int globalCount,
    required int myOwnCount,
    required int totalPeopleDonated,
    required String timeElapsed,
    required double raised,
    required double target,
  });
}
