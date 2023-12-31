import 'package:flutter/material.dart';
import 'package:toko_rumah/pages/auth/auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 8.0,
            color: Colors.green, // Ganti warna Card menjadi hijau
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Daftar dulu ya',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Ganti warna teks menjadi putih
                      fontFamily: 'Raleway', // Gunakan font kustom
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.green.shade700),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.green.shade700),
                      prefixIcon: Icon(Icons.email, color: Colors.green.shade700),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: Colors.green.shade700),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.green.shade700),
                      prefixIcon: Icon(Icons.lock, color: Colors.green.shade700),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final message = await AuthService().register(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        if (message == 'Registration Success') {
                          Navigator.of(context).pop(); // Kembali ke layar login setelah registrasi berhasil
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message ?? 'Terjadi kesalahan'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        shadowColor: Colors.grey, // Tambahkan bayangan yang halus
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 56, 142, 60),
                        ),
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
