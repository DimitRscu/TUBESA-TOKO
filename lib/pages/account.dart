import 'package:flutter/material.dart';
import 'package:toko_rumah/components/my_account.dart';
import 'package:toko_rumah/components/my_payment.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timestamp Start
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 5,
          ),
          child: Text(
            "Last Login at 19:20 (GMT+7) Wednesday, 20 October 2023",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        // Timestamp End

        // Profile Card Start
        Card(
          color: Colors.white,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(width: 0.5, color: Colors.grey),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 33,
              backgroundImage: AssetImage("assets/img/goji.png"),
            ),
            title: const Text(
              "Budi Hilman",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            subtitle: const Text(
              "100 Point",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ),
        ),
        // Profile Card End

        // Payment Text Start
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
          child: Text(
            "Payments",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // Payment Text End

        // Payment Start
        const MyPayment(
          title: "BANK BRI",
          date: "20-10-23",
          nomor: "515-1256-2423-353",
          image: AssetImage("assets/img/bri.jpg"),
          balance: "Available Balance",
          money: "Rp. 50.000.000",
          color: Colors.greenAccent,
        ),
        const SizedBox(height: 10),
        const MyPayment(
          title: "GoPay",
          date: "15-8-23",
          nomor: "081332234567",
          image: AssetImage("assets/img/gopay.png"),
          balance: "Available Balance",
          money: "Rp. 500.000",
          color: Colors.grey,
        ),
        // Payment End

        // Account Text Start
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
          child: Text(
            "Account",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // Account Text End

        // Account Start
        const MyAccountList(
          icon: Icons.logout,
          title: "Logout",
        ),
        const MyAccountList(
          icon: Icons.delete,
          title: "Delete Account",
        ),
        // Account End

        // Others Text Start
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
          child: Text(
            "Other",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // Others End Start

        // Others Start
        const MyAccountList(
          icon: Icons.help,
          title: "Customer Service",
        ),
        // Others End

        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 20),
          child: Center(
            child: Text(
              "Version 0.0.1",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
