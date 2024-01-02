import 'package:flutter/material.dart';

class MyMenuBtn extends StatelessWidget {
  const MyMenuBtn({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 15,
              ),
              child: Icon(
                icon,
                size: 28,
                color: iconColor,
              )),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) =>detail));
          },
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
