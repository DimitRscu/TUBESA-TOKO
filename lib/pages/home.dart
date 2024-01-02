import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toko_rumah/components/my_detail_hotel.dart';
import 'package:toko_rumah/components/my_menu_btn.dart';
import 'package:toko_rumah/components/my_recomen_property.dart';
import 'package:toko_rumah/components/my_top_location.dart';
import 'package:toko_rumah/components/my_detail_facilities.dart';
import 'package:toko_rumah/pages/auth/auth_gate.dart';
import 'package:toko_rumah/pages/auth/login.dart';
import 'package:toko_rumah/pages/detail.dart';
import 'package:toko_rumah/pages/detaildua.dart';
import 'package:toko_rumah/components/my_account.dart';
import 'package:toko_rumah/pages/profile.dart'; // Import the profile page

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Bubble Logo Profile Start
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/img/goji.png"),
                  ),
                ),
              ),
              // Bubble Logo Profile End

              // Search Input Start
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
              // Search Input End

              // Menu Start
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
              // Menu End

              // Recomended Property Text Start
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
              // Recomended Property Text End

              // Recommended Property List Start
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
              // Recommended Property List End

              // Top Location Text Start
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
              // Top Location Text End

              // Top Location List Start
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
              // Top Location List End

              // Account Start
              // Account Start
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthGate(),));
                },
                child: MyAccountList(
                  icon: Icons.logout,
                  title: "Logout",
                ),
              ),
              MyAccountList(
                icon: Icons.delete,
                title: "Delete Account",
              ),
              // Account End
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
