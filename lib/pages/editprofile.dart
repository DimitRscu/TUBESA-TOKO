import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
  File? _image;
  final picker = ImagePicker();
  bool _uploading = false;
  String image = '';

  @override
  void initState() {
    super.initState();
    _checkPermission();
    getUserInfo();
  }

  Future<void> _checkPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
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
            setState(() {
              image = data['profile_image'];
            });
          } else {
            // Tangani kasus ketika dokumen tidak ada, jika diperlukan
          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }
  }

  Future<void> saveChanges() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null && _formKey.currentState!.validate()) {
      final uid = user.uid;

      final userRef = FirebaseFirestore.instance.collection('users').doc(uid);

      await userRef.set({
        'nama': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profil berhasil diperbarui."),
        ),
      );
    }
  }

  Future<void> _uploadImage() async {
    try {
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        if (_image != null) {
          final FirebaseAuth auth = FirebaseAuth.instance;
          final User? user = auth.currentUser;

          if (user != null) {
            setState(() {
              _uploading = true;
            });

            final uid = user.uid;

            final storageRef = FirebaseStorage.instance.ref().child('profile_images').child('$uid.jpg');

            await storageRef.putFile(_image!);

            final downloadURL = await storageRef.getDownloadURL();

            final userRef = FirebaseFirestore.instance.collection('users').doc(uid);

            await userRef.set({
              'profile_image': downloadURL,
            }, SetOptions(merge: true));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Gambar berhasil diunggah."),
              ),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tidak ada gambar yang dipilih.'),
          ),
        );
      }
    } catch (e) {
      print("Error during image upload: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat mengunggah gambar.'),
        ),
      );
    } finally {
      setState(() {
        _uploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profil"),
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(image),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _uploading ? null : _uploadImage,
                        child: Text("Pilih Gambar"),
                      ),
                      _uploading
                          ? CircularProgressIndicator()
                          : SizedBox.shrink(),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Nama Lengkap",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: "Telepon",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: saveChanges,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      "Simpan Perubahan",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
