import 'package:flutter/material.dart';
import 'package:toko_rumah/pages/payment.dart';

class MyCheckOut extends StatefulWidget {
  const MyCheckOut({Key? key}) : super(key: key);

  @override
  _MyCheckOutState createState() => _MyCheckOutState();
}

class _MyCheckOutState extends State<MyCheckOut> {
  PaymentOption? _selectedPaymentOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkout Text
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "The Lalala Residence",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Property Details
            Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Property Details:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    PropertyDetailItem(icon: Icons.king_bed, text: "4 Bedrooms"),
                    PropertyDetailItem(icon: Icons.bathtub, text: "2 Bathrooms"),
                    PropertyDetailItem(icon: Icons.drive_eta, text: "Car Garage"),
                    PropertyDetailItem(icon: Icons.aspect_ratio, text: "Area: 42 square meters"),
                  ],
                ),
              ),
            ),

            // Payment Options
            Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Options:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    PaymentOptionItem(
                      title: "Virtual Account",
                      icon: Icons.account_balance,
                      isSelected: _selectedPaymentOption == PaymentOption.VirtualAccount,
                      onTap: () {
                        setState(() {
                          _selectedPaymentOption = PaymentOption.VirtualAccount;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Proceed to Payment Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
                onPrimary: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                if (_selectedPaymentOption != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentProcessPage(
                        selectedPaymentMethod: _selectedPaymentOption.toString(),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please select a payment option"),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyDetailItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const PropertyDetailItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.greenAccent),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class PaymentOptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionItem({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
      leading: Icon(icon, color: Colors.greenAccent),
      trailing: Radio(
        value: isSelected,
        groupValue: true,
        onChanged: (bool? value) {
          onTap();
        },
      ),
    );
  }
}

enum PaymentOption {
  VirtualAccount,
}
