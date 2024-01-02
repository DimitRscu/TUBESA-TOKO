import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toko_rumah/components/my_app_bar.dart';
import 'package:toko_rumah/pages/account.dart';
import 'package:toko_rumah/pages/auth/auth_gate.dart';
import 'package:toko_rumah/pages/auth/firebase_options.dart';
import 'package:toko_rumah/pages/auth/login.dart';
import 'package:toko_rumah/pages/detail.dart';
import 'package:toko_rumah/pages/home.dart';
import 'package:toko_rumah/components/my_detail_facilities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const AuthGate(),
    );
  }
}

class MyLayout extends StatefulWidget { 
  const MyLayout({super.key});

  @override
  State<MyLayout> createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyDetailPage(),
    MyAccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "House",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: "Apartment",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: "Townhouse",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
