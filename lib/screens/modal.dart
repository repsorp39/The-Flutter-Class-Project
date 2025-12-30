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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête fixe
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close, size: 20),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ),
              // Contenu scrollable
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0),
                // Sélection de la carte de débit
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 242, 242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: Colors.grey, size: 18),
                          SizedBox(width: 8),
                          Text(
                            selectedCard,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // Montant de donation
                Text(
                  "Donation Amount",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 244, 242, 242),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "USD",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$${donationAmount}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  "Min. donation is \$$minDonation",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: 8),

               