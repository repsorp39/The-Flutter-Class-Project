import 'package:flutter/material.dart';
import 'package:flutter_class_project/composants/donation_cart.dart';
import 'package:flutter_class_project/models/banner.dart';
import 'package:flutter_class_project/models/feed.dart';
import 'package:flutter_class_project/models/notification.dart';
import 'package:flutter_class_project/models/profile.dart';
import 'package:flutter_class_project/screens/notifications.dart';
import 'package:flutter_class_project/screens/profile.dart';
import 'package:flutter_class_project/screens/recommandations.dart';

class HomePage extends StatelessWidget {
  final Profile profile;
  final List<NotificationModel> notifications;
  final List<String> categories;
  final HomeBanner currentBanner;
  final Function nextBannerItem;
  final Function prevBannerItem;
  final Function onCategorySelect;
  final List<Feed> feeds;
  final String selectedCategory;

  const HomePage({
    super.key,
    required this.profile,
    required this.notifications,
    required this.currentBanner,
    required this.nextBannerItem,
    required this.prevBannerItem,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelect,
    required this.feeds,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //safe area c'est pour ne pas prendre en compte dans le calcul de la hauteur de l'ecran la paritie notif sur l'ecran des phones
        child: SingleChildScrollView(
          //un peu comme un overflow-auto pour permettre le scroll vertical par défaut sinon c pas possible normalement
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        goTo(context, ProfilePage(profile: profile));
                      },
                      style: TextButton.styleFrom(
                        // un peu comme un all:unset en css
                        //notre but c'est de pouvoir cliquer sur le profile or il n'a pas le onPress, donc
                        //on utilise elevate Button auquel on retire le style par défaut
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          profile.profileImageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 30),
                            Text(
                              "Feeding America",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Regular",
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.all(2),
                          child: IconButton(
                            onPressed: () {
                              goTo(
                                context,
                                NotificationPage(notif: notifications),
                              );
                            },
                            icon: Icon(Icons.notifications_active_outlined),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withValues(
                                alpha: 0.03,
                              ),
                              padding: EdgeInsets.all(17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
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
                                  decoration: const InputDecoration(
                                    border: InputBorder
                                        .none, // Supprime toutes les bordures par défaut
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: "Search here ...",
                                    icon: Icon(
                                      Icons.search,
                                      size: 24,
                                      weight: 15,
                                    ),
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
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          backgroundColor: const Color.fromARGB(
                            255,
                            57,
                            107,
                            58,
                          ),
                        ),
                        icon: Icon(Icons.flag, color: Colors.white, weight: 1),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 35),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          child: Opacity(
                            opacity: 0.55,
                            child: Image.network(
                              alignment: AlignmentGeometry.center,
                              currentBanner.imageUrl,
                              fit: BoxFit.cover,
                              height: 230,
                              width: MediaQuery.of(
                                context,
                              ).size.width, //on recupere la taille de l'ecran
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 35,
                        child: Text(
                          currentBanner.subtitle,
                          style: TextStyle(
                            fontFamily: "Regular",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 35,
                        child: Text.rich(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          TextSpan(
                            text: currentBanner.title.substring(
                              0,
                              currentBanner.title.indexOf(
                                currentBanner.title
                                    .split(",")[0]
                                    .split(" ")
                                    .last,
                              ), //recuperer le dernier mot à mettre en couleur et la premiere portion à juste afficher
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "${currentBanner.title.split(",")[0].split(" ").last},",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 3, 76, 201),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 95,
                        left: 29,
                        child: Text(
                          currentBanner.title.split(",").last,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 35,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              57,
                              107,
                              58,
                            ),
                            padding: EdgeInsetsGeometry.all(20),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Donation now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200 / 2,
                        left: -10,
                        child: OutlinedButton(
                          onPressed: () {
                            prevBannerItem();
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              245,
                              242,
                              242,
                            ),
                            minimumSize: Size(40, 40),
                            shape: CircleBorder(),
                          ),
                          child: Icon(Icons.arrow_back, size: 10),
                        ),
                      ),
                      Positioned(
                        top: 200 / 2,
                        right: -10,
                        child: OutlinedButton(
                          onPressed: () {
                            nextBannerItem();
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              245,
                              242,
                              242,
                            ),
                            minimumSize: Size(40, 40),
                            shape: CircleBorder(),
                          ),
                          child: Icon(Icons.arrow_forward, size: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: categories.map((category) {
                        return InkWell(
                          splashColor: const Color.fromARGB(255, 236, 238, 237),
                          //inkwell permet de reperer le clique sur les elements qui  ne sont mm pas des boutons ou autres
                          onTap: () {
                            onCategorySelect(category);
                          },
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Ink(
                            //ink permet de voir l'effet anim du splash des couleurs
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(
                                color: const Color.fromARGB(255, 217, 215, 215),
                                width: 1,
                              ),
                              color: selectedCategory == category
                                  ? Colors.black.withValues(alpha: 0.03)
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Regular",
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Recommendation",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          goTo(
                            context,
                            RecommandationsAll(allFeedRecommandations: feeds),
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 173, 171, 171),
                          ),
                        ),
                        child: Text("See all"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 25,
                      children: feeds
                          .where((f) => f.category == selectedCategory)
                          .map((Feed feed) {
                            return DonationCard(feed: feed);
                          })
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void goTo(BuildContext context, Widget composant) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => composant));
}
