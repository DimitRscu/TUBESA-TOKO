import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      final uid = user.uid;

      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

      docRef.get().then(
        (DocumentSnapshot doc) {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            _nameController.text = data['nama'];
            _emailController.text = data['email'];
            _phoneController.text = data['phone'];
          } else {
            // Handle the case when the document doesn't exist, if needed
          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }
  }

  void saveChanges() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null && _formKey.currentState!.validate()) {
      final uid = user.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'nama': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile updated successfully."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Editable Profile Image and Name Start
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/img/goji.png"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Full Name",
                        ),
                      ),
                    ],
                  ),
                ),
                // Editable Profile Image and Name End

                // Editable User Info Start
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Phone",
                        ),
                      ),
                    ],
                  ),
                ),
                // Editable User Info End

                // Save Changes Button Start
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: saveChanges,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // Save Changes Button End
              ],
            ),
          ),
        ),
      ),
    );
  }
}
