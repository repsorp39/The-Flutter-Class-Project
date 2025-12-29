class Feed {
  final int id;
  final String imageUrl;
  final String category;
  final String location;
  final String title;
  final String description;
  final List<String> listDonate;
  final List<String> eventImages;
  final int globalCount;
  final int myOwnCount;
  final int totalPeopleDonated;
  final String timeElapsed;
  final int raised;
  final int target;

  Feed({
    required this.id,
    required this.imageUrl,
    required this.category,
    required this.location,
    required this.title,
    required this.description,
    required this.eventImages,
    required this.globalCount,
    required this.myOwnCount,
    required this.totalPeopleDonated,
    required this.timeElapsed,
    required this.raised,
    required this.target,
    required this.listDonate
  });
}
