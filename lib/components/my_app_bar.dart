import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(
                "Your Location",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              const Text(
                "Surabaya, ID",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 75,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.amber,
                minimumSize: const Size.fromWidth(55.5),
                padding: const EdgeInsets.only(bottom: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                side: const BorderSide(width: 1, color: Colors.grey),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromWidth(60),
              padding: const EdgeInsets.only(bottom: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              side: const BorderSide(width: 1, color: Colors.grey),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leadingWidth: 75,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
