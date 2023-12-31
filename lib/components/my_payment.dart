import 'package:flutter/material.dart';

class MyPayment extends StatelessWidget {
  const MyPayment({
    super.key,
    required this.title,
    required this.date,
    required this.nomor,
    required this.image,
    required this.balance,
    required this.money,
    required this.color,
  });

  final String title, date, nomor, balance, money;
  final ImageProvider image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: color, width: 5),
              top: const BorderSide(color: Colors.grey, width: 0.5),
              right: const BorderSide(color: Colors.grey, width: 0.5),
              bottom: const BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            nomor,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 33,
                    backgroundImage: image,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    balance,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    money,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
