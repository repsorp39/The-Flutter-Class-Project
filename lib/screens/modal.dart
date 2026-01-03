import 'dart:ui';

import 'package:flutter/material.dart';

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
        content: Text("Paid \$${donationAmount} successfully!"),
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
          maxHeight: screenHeight,
          maxWidth: screenWidth,
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

                // Boutons de montants rapides
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: quickAmounts.map((amount) {
                    return InkWell(
                      onTap: () => _selectQuickAmount(amount),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: donationAmount == amount
                              ? Color.fromARGB(255, 57, 107, 58)
                              : Color.fromARGB(255, 244, 242, 242),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "\$$amount",
                          style: TextStyle(
                            color: donationAmount == amount
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),

                // Clavier numérique
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index < 9) {
                      // Boutons 1-9
                      final digit = (index + 1).toString();
                      return _buildNumberButton(digit, () => _addDigit(digit));
                    } else if (index == 9) {
                      // Bouton * à gauche du 0
                      return _buildNumberButton("*", () {
                        // Le * peut être utilisé pour ajouter un point décimal ou autre fonction
                        // Pour l'instant, on ne fait rien
                      });
                    } else if (index == 10) {
                      // Bouton 0 au centre
                      return _buildNumberButton("0", () => _addDigit("0"));
                    } else {
                      // Bouton de suppression (index 11)
                      return _buildNumberButton(
                        "",
                        _deleteDigit,
                        icon: Icons.backspace_outlined,
                      );
                    }
                  },
                ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              // Bouton Pay Now fixe en bas
              Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _processPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 57, 107, 58),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String text, VoidCallback onTap, {IconData? icon}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 242, 242),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, color: Colors.black, size: 18)
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}


  void showPaymentModal(BuildContext context) {
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
