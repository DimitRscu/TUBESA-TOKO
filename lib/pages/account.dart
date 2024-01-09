import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toko_rumah/components/my_account.dart';
import 'package:toko_rumah/components/my_payment.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  String nama = '';
  // String email = '';
  // String phone = '';
  String aidi = '';
  String image = '';

  @override
  void initState() {
    super.initState();
    getUserUID();
  }

  Future<void> getUserUID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      final uid = user.uid;
      setState(() {
        aidi = uid;
      });
      await getUserInfo();
      print(aidi);
    } else {
      // Handle the case when user is null, if needed
    }
  }

  Future<void> getUserInfo() async {
    if (aidi.isNotEmpty) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(aidi);

      await docRef.get().then(
        (DocumentSnapshot doc) async {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            setState(() {
              image = data['profile_image'];
              nama = data['nama'];
            });
          } else {
            // Handle the case when the document doesn't exist, if needed
          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: ListView(
        children: [
          // Timestamp Start
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "",
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
              leading: CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(image),
              ),
              title: Text(
                nama,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              subtitle: const Text(
                "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              // trailing: IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.edit,
              //   ),
              // ),
            ),
          ),
          // Profile Card End

          // Payment Text Start
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Text(
              "Payments",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          // Payment Text End

          // Payment Start
          MyPayment(
            title: "BANK BRI",
            date: "20-10-23",
            nomor: "515-1256-2423-353",
            image: AssetImage("assets/img/bri.jpg"),
            balance: "Available Balance",
            money: "Rp. 300.500.000",
            color: Colors.greenAccent,
          ),
          const SizedBox(height: 10),
          MyPayment(
            title: "Cash", // Updated from "GoPay"
            date: "15-8-23",
            nomor: "081332234567",
            image: AssetImage("assets/img/gopay.png"), // Placeholder image
            balance: "Available Balance",
            money: "Rp. 300.500.000",
            color: Colors.grey,
          ),
          // Payment End

          // Account Text Start
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Text(
              "Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Account Text End

          // // Account Start
          // MyAccountList(
          //   icon: Icons.logout,
          //   title: "Logout",
          // ),
          // MyAccountList(
          //   icon: Icons.delete,
          //   title: "Delete Account",
          // ),
          // // Account End

          // Others Text Start
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
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
          MyAccountList(
            icon: Icons.help,
            title: "Customer Service",
          ),
          // Others End

          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: Center(
              child: Text(
                "Version 0.0.1",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
