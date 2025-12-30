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

  void _processPayment() {
    final amount = double.tryParse(donationAmount) ?? 0;
    if (amount < minDonation) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Le montant minimum est \$$minDonation"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    // la logique de paiement
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Paiement de \$${donationAmount} effectué avec succès!"),
        backgroundColor: const Color.fromARGB(255, 57, 107, 58),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      alignment: Alignment.center,
        child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.9,
          maxWidth: screenWidth > 600 ? 320 : screenWidth - 100,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
         