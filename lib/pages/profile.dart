import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toko_rumah/pages/auth/auth_gate.dart';
import 'package:toko_rumah/pages/editprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nama = '';
  String email = '';
  String phone = '';
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
        (DocumentSnapshot doc) {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            setState(() {
              nama = data['nama'] ?? ''; // Tambahkan pengecekan null disini
              email = data['email'] ?? '';
              phone = data['phone'] ?? '';
              image = data['profile_image'] ?? '';
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
        title: Text("Profil"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image and Name Start
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(image),
                    ),
                    SizedBox(height: 20),
                    Text(
                      nama,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Profile Image and Name End

              // User Info Start
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    ListTile(
                      title: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        email,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        "Telepon",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        phone,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              // User Info End

              // Tambahkan SizedBox untuk memberi ruang antara info telepon dan tombol Edit Profil
              SizedBox(height: 20),

              // Tombol Edit Profil Start
              ElevatedButton(
                onPressed: () {
                  // Navigate to the edit profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.greenAccent, // Ganti warna latar belakang
                  onPrimary: Colors.white, // Ganti warna teks
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Edit Profil",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              // Tombol Edit Profil End

               // Tombol Edit Profil End

              // Tambahkan SizedBox untuk memberi ruang antara tombol Edit Profil dan tombol Logout/Delete
              SizedBox(height: 20),

              // Tombol Logout Start
              ElevatedButton(
                onPressed: () {
                  // Handle fungsi logout
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AuthGate()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Ganti warna latar belakang
                  onPrimary: Colors.white, // Ganti warna teks
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              // Tombol Logout End

              // Tambahkan SizedBox untuk memberi ruang antara tombol Logout dan tombol Delete
              SizedBox(height: 20),

              // Tombol Hapus Akun Start
              ElevatedButton(
                onPressed: () {
                  // Handle fungsi hapus akun
                  // Tambahkan logika Anda untuk menghapus akun
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Ganti warna latar belakang
                  onPrimary: Colors.white, // Ganti warna teks
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Hapus Akun",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              // Tombol Hapus Akun End
            ],
          ),
        ),
      ),
    );
  }
}