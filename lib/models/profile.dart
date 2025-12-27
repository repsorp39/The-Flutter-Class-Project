class Profile {

    final int id;
    final String fullname;
    final String email;
    final String profileImageUrl;
    final String bio;
    final int totalDonations;
    final String location;

  Profile({
    required this.id,
    required this.fullname,
    required this.email,
    required this.profileImageUrl,
    required this.bio,
    required this.totalDonations,
    required this.location,
  });
}
