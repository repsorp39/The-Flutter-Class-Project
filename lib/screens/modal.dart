import 'package:flutter/material.dart';
import 'dart:ui';

class PaymentModal extends StatefulWidget {
  const PaymentModal({super.key});

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  String selectedCard = "Select your debit card";
  String donationAmount = "100";
  final List<String> quickAmounts = ["10", "20", "30", "40", "50"];
  final double minDonation = 10.0;

  void _addDigit(String digit) {
    setState(() {
      if (donationAmount == "0") {
        donationAmount = digit;
      } else {
        donationAmount += digit;
      }
    });
  }

  void _deleteDigit() {
    setState(() {
      if (donationAmount.length > 1) {
        donationAmount = donationAmount.substring(0, donationAmount.length - 1);
      } else {
        donationAmount = "0";
      }
    });
  }

  void _selectQuickAmount(String amount) {
    setState(() {
      donationAmount = amount;
    });
  }

 