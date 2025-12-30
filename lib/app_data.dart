import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_class_project/models/banner.dart';
import 'package:flutter_class_project/models/feed.dart';
import 'package:flutter_class_project/models/notification.dart';
import 'package:flutter_class_project/models/profile.dart';
import 'package:flutter_class_project/main.dart';
import 'package:flutter_class_project/screens/home.dart';

class MyAppState extends State<MyApp> {
  //les items du carousels de la page d'accueil
  final List<HomeBanner> homeBanner = [
    HomeBanner(
      id: 1,
      title: "A Small Donation, A Big Smile",
      subtitle: "Help Fight Hunger",
      imageUrl:
          "https://www.actionagainsthunger.org/app/uploads/2022/10/IIImages_AP_ACF_Senegal_D3_10082017-169-scaled-aspect-ratio-584-489-1.jpg",
    ),
    HomeBanner(
      id: 3,
      title: "Share Your Meal, Help your world",
      subtitle: "Provide a food kit to a family.",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuPKUZhN_EwDBZGbm6QKP-NvOcjJ-Xk6uCgw&s",
    ),
    HomeBanner(
      id: 4,
      title: "Emergency Nutrition, Emergency Life",
      subtitle: "Support our urgent child worldwide.",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdoLfoDtnukud6PKDZzrA-mLEkUvLhbPXxWQ&s",
    ),
    HomeBanner(
      id: 5,
      title: "Be a Local Hero, Be Superman",
      subtitle: "Volunteer or donation.",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXJXyq-r-m_HvKC2QxUuXEvsLLxJsD-YlKuw&s",
    ),
  ];
  int currentHomeBannerIndex = 0;

  void nextBannerItem() {
    //de sorte que mm lorqu'il clique sur la dernière image il revient au tout premier
    currentHomeBannerIndex = (currentHomeBannerIndex + 1) % homeBanner.length;
  }

  void prevBannerItem() {
    currentHomeBannerIndex = max(currentHomeBannerIndex - 1, 0);
  }

  final List<String> categories = [
    "Fresh",
    "Canned",
    "Meals",
    "Bakery",
    "Bread",
    "Hope",
  ];
  String selectedCategory = "Meals";

  void onCategorySelect(String category) {
    selectedCategory = category;
  }

  final List<Feed> homeFeeds = [
    Feed(
      id: 1,
      imageUrl:
          "https://www.actionagainsthunger.org/app/uploads/2022/10/IIImages_AP_ACF_Senegal_D3_10082017-169-scaled-aspect-ratio-584-489-1.jpg",
      category: "Meals",
      location: "Kent, Utah",
      title: "Donate Food for a Cause",
      description:
          """Our local community center is launching a massive hunger relief 
drive to support families affected by recent economic challenges in Kent. 
The goal is to provide balanced, nutritious meals to over 500 households. 
We are collecting dry goods, fresh produce, and canned proteins to fill 
our distribution warehouse. Your contribution goes directly to the 
sorting and delivery process handled by our dedicated volunteers. 
Every box of food helps a child go to sleep with a full stomach tonight. 
We believe that no neighbor should ever have to choose between rent 
and food. Join us this weekend at the central plaza for the drop-off event. 
Together, we can build a stronger, healthier, and more resilient Utah. 
Let's turn small acts of kindness into a wave of massive community impact.""",
      eventImages: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjWHsMQaY4bmBzVrr83ZGY2Fv0YcADpx3f2w&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjWHsMQaY4bmBzVrr83ZGY2Fv0YcADpx3f2w&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjWHsMQaY4bmBzVrr83ZGY2Fv0YcADpx3f2w&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjWHsMQaY4bmBzVrr83ZGY2Fv0YcADpx3f2w&s",
      ],
      globalCount: 200,
      myOwnCount: 3,
      totalPeopleDonated: 50,
      timeElapsed: "19h",
      raised: 480,
      target: 1500,
      listDonate: [
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    Feed(
      id: 2,
      imageUrl:
          "https://raisely-images.imgix.net/eaa-2021/uploads/help-charities-fight-hunger-crisis-article-feature-jpeg-349f77.jpeg?fm=jpg&fit=max&w=700&auto=format&q=62",
      category: "Meals",
      location: "Lake, Utah",
      title: "No Student Hungry",
      description:
          """Many students in our district rely on school programs as their 
primary source of daily nutrition and healthy calories. During the 
upcoming winter break, these vital resources become unavailable to 
the children who need them most. We are raising funds and collecting 
non-perishable snacks to create 'Break Bags' for students to take home. 
Each bag contains enough food for two weeks of lunches and healthy snacks. 
The impact of a consistent diet on a student's ability to learn is 
scientifically proven and absolutely essential for their success. 
Our target is to reach 1,200 students across five different elementary schools. 
Your donation of just ten dollars can cover the cost of a full bag. 
Help us ensure that learning remains the only focus for our kids. 
Education is the ladder, but nutrition is the floor they stand on.""",
      eventImages: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMEf5N8QvaOtR6GVuBeihnHRbMZQM9bG-__Q&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMEf5N8QvaOtR6GVuBeihnHRbMZQM9bG-__Q&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMEf5N8QvaOtR6GVuBeihnHRbMZQM9bG-__Q&s",
      ],
      globalCount: 450,
      myOwnCount: 0,
      totalPeopleDonated: 120,
      timeElapsed: "5h",
      raised: 800,
      target: 1800,
      listDonate: [
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    Feed(
      id: 3,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWxdih2b19PZJMQo-VKZaNCtrbSuFB67VCMQ&s",
      category: "Fresh",
      location: "Provo, Utah",
      title: "Hot Meals",
      description:
          """As the temperatures drop significantly across the Utah Valley, 
the homeless population in Provo faces life-threatening conditions. 
Our mobile soup kitchen operates nightly to provide warm, calorie-dense 
meals and hot beverages to those living on the streets or in cars. 
Beyond just food, we provide a moment of human connection and dignity 
to those often ignored by society. We are currently scaling our operations 
from three nights a week to a full seven-day schedule to meet demand. 
Funding is needed for fuel, insulated food containers, and fresh ingredients. 
Our team consists entirely of volunteers who donate their time and vehicles. 
A warm bowl of soup can be the first step toward stability for someone. 
We also provide information on local shelters and medical resources. 
Your generosity tonight ensures that we don't have to turn anyone away.""",
      eventImages: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYj-jBYeYCXtJveblOZBQRH0XTy4SqbrS90w&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnWTfo7f30wcHMrvtRy2_i1vEYGx7lVTbrOg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnWTfo7f30wcHMrvtRy2_i1vEYGx7lVTbrOg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnWTfo7f30wcHMrvtRy2_i1vEYGx7lVTbrOg&s",
      ],
      globalCount: 800,
      myOwnCount: 10,
      totalPeopleDonated: 210,
      timeElapsed: "2d",
      raised: 2000,
      target: 4000,
      listDonate: [
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    Feed(
      id: 4,
      imageUrl:
          "https://i.guim.co.uk/img/media/25b7f31b7eb234e3ff5ee6982b86b7a9e0aa3827/0_360_8368_5021/master/8368.jpg?width=465&dpr=1&s=none&crop=none",
      category: "Meals",
      location: "Ogden, Utah",
      title: "Sustainable",
      description:
          """We are transforming an abandoned lot in downtown Ogden into a 
vibrant community garden that provides free organic produce to residents. 
This project aims to tackle the 'food desert' issue where fresh 
vegetables are hard to find and often too expensive for many families. 
We are looking for donations to purchase high-quality soil, seeds, 
and an efficient drip irrigation system to conserve our local water. 
The garden also serves as an educational hub where kids learn about 
biology, sustainability, and the hard work behind the food they eat. 
By growing our own food, we reduce our carbon footprint and build 
stronger bonds with our neighbors. Every harvest is shared equally 
among those who help and those in the community who are in need. 
This is more than just planting seeds; it is about rooting a community. 
Help us grow a greener future for Ogden, one vegetable at a time.""",
      eventImages: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ8lXUaUoxpRGfB4ZrPVRVYlvo-zKXBIGMag&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ8lXUaUoxpRGfB4ZrPVRVYlvo-zKXBIGMag&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ8lXUaUoxpRGfB4ZrPVRVYlvo-zKXBIGMag&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ8lXUaUoxpRGfB4ZrPVRVYlvo-zKXBIGMag&s",
      ],
      globalCount: 150,
      myOwnCount: 2,
      totalPeopleDonated: 35,
      timeElapsed: "1w",
      raised: 4500,
      target: 5000,
      listDonate: [
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
  ];

  final loginUser = Profile(
    id: 1,
    fullname: "Jean Jacques",
    email: "monemailmachin@gmail.com",
    profileImageUrl:
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    bio: "Passionné des livres, de la tech et autres bof.",
    totalDonations: 15,
    location: "Salt Lake City, Utah",
  );

  final List<NotificationModel> notifications = [
    NotificationModel(
      id: 1,
      title: "Something bla bla",
      message: "Lorem ipsum indolore la la lo lo ra o ri",
      timestamp: "il y 1min",
      isRead: false,
    ),
  ];

  Feed? findFeed(int id) {
    return homeFeeds.firstWhere((Feed f) => f.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        profile: loginUser,
        notifications: notifications,
        currentBanner: homeBanner[currentHomeBannerIndex],
        categories: categories,
        selectedCategory: selectedCategory,
        feeds: homeFeeds,
        nextBannerItem: () {
          setState(() {
            nextBannerItem();
          });
        },
        prevBannerItem: () {
          setState(() {
            prevBannerItem();
          });
        },
        onCategorySelect: (String category) {
          setState(() {
            onCategorySelect(category);
          });
        },
      ),
    );
  }
}
