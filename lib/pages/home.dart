import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toko_rumah/components/my_detail_hotel.dart';
import 'package:toko_rumah/components/my_menu_btn.dart';
import 'package:toko_rumah/components/my_recomen_property.dart';
import 'package:toko_rumah/components/my_top_location.dart';
// import 'package:toko_rumah/components/my_detail_facilities.dart';
// import 'package:toko_rumah/pages/auth/auth_gate.dart';
// import 'package:toko_rumah/pages/auth/login.dart';
import 'package:toko_rumah/pages/detail.dart';  
import 'package:toko_rumah/pages/detaildua.dart';
// import 'package:toko_rumah/components/my_account.dart';
import 'package:toko_rumah/pages/profile.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String image = '';

  Future<void> getUserInfo() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      final uid = user.uid;

      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

      await docRef.get().then(
        (DocumentSnapshot doc) {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            setState(() {
              image = data['profile_image'] ?? '';
            });
          } else {
            // Handle the case when the document does not exist, if needed
          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }
  }

  Future<void> _refresh() async {
  // Implement your refresh logic here
  await Future.delayed(Duration(seconds: 2)); // Simulating a delay

  // Check if the widget is still mounted before calling setState
  if (mounted) {
    setState(() {
      // Update the data or perform any necessary operations
    });
  }
}

  @override
  void initState() {
    super.initState();
    // Call the method to get user information when the page is initialized
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, right: 20),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Container(
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search Property ...",
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          suffixIcon: Icon(Icons.filter_list),
                          suffixIconColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyMenuBtn(
                            icon: Icons.house,
                            iconColor: Colors.green,
                            title: "House",
                            detail: MyDetailPage(),
                          ),
                          MyMenuBtn(
                            icon: Icons.apartment,
                            iconColor: Colors.orange,
                            title: "Apartment",
                            detail: MyDetailPage(),
                          ),
                          MyMenuBtn(
                            icon: Icons.other_houses,
                            iconColor: Colors.blue,
                            title: "Townhouse",
                            detail: MyDetailPage(),
                          ),
                          MyMenuBtn(
                            icon: Icons.home_filled,
                            iconColor: Colors.red,
                            title: "Warehouse",
                            detail: MyDetailPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Property",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MyRecommendedProperty(target: MyDetailPage(),),
                        MyDetailHotel(detail: MyDetailPagedua(),)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Location",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MyTopLocation(
                          image: AssetImage("assets/img/jakarta.jpeg"),
                          title: "Jakarta",
                          colorBegin: Colors.blue,
                          colorEnd: Color.fromARGB(118, 0, 140, 255),
                        ),
                        MyTopLocation(
                          image: AssetImage("assets/img/bali.jpg"),
                          title: "Bali",
                          colorBegin: Colors.blue,
                          colorEnd: Color.fromARGB(118, 0, 140, 255),
                        ),
                        MyTopLocation(
                          image: AssetImage("assets/img/bandung.jpg"),
                          title: "Bandung",
                          colorBegin: Colors.orange,
                          colorEnd: Color.fromARGB(118, 255, 153, 0),
                        ),
                        MyTopLocation(
                          image: AssetImage("assets/img/jogja.jpg"),
                          title: "Jogja",
                          colorBegin: Colors.orange,
                          colorEnd: Color.fromARGB(118, 255, 153, 0),
                        ),
                        MyTopLocation(
                          image: AssetImage("assets/img/malang.jpg"),
                          title: "Malang",
                          colorBegin: Colors.purple,
                          colorEnd: Color.fromARGB(118, 155, 39, 176),
                        ),
                        MyTopLocation(
                          image: AssetImage("assets/img/sby.jpg"),
                          title: "Surabaya",
                          colorBegin: Colors.blue,
                          colorEnd: Color.fromARGB(118, 0, 140, 255),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
