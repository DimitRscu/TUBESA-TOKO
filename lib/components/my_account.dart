import "package:flutter/material.dart";

class MyAccountList extends StatelessWidget {
  const MyAccountList({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 8),
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
