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

  void _showPaymentModal(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("le bouton de donation "),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _showPaymentModal(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 57, 107, 58),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Donation Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
