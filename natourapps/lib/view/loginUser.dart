import 'package:flutter/material.dart';
import 'package:natourapps/view/adminWisata/bottomNavAdmin.dart';
import 'package:natourapps/view/pengguna/bottomNavbarPengguna.dart';
import 'package:natourapps/view/pengguna/dashboardPengguna.dart';
import 'package:natourapps/view/adminWisata/dashboardAdmin.dart';
import 'package:natourapps/view/penyewa/bottomNavPenyewa.dart';
import 'package:natourapps/view/penyewa/dashboardPenyewa.dart';
import 'package:natourapps/Controller/LoginController.dart';
import 'package:natourapps/view/registerUser.dart';

class loginUser extends StatefulWidget {
  @override
  _loginUserState createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 108, 196),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: '@ Email/Nama',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Kata Sandi',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  suffixIcon:
                      Icon(Icons.visibility_off, color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    setState(() {
                      errorMessage = 'Harap isi semua kolom.';
                    });
                    return;
                  }

                  final controller = LoginController();
                  Map<String, dynamic> result = (await controller.loginUser(
                      email, password)) as Map<String, dynamic>;

                  if (result['status'] == 'success') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login Berhasil')),
                    );

                    // Arahkan ke halaman berdasarkan role
                    String role = result['role'];
                    if (role == 'Pengguna') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => NavBar()),
                      );
                    } else if (role == 'Admin Wisata') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => navbarAdmin()),
                      );
                    } else if (role == 'Penyewa Alat') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => navbarPenyewa()),
                      );
                    } else {
                      setState(() {
                        errorMessage = 'Role tidak dikenali.';
                      });
                    }
                  } else {
                    setState(() {
                      errorMessage = result['message'];
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 55, 192, 255),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
              const SizedBox(height: 200.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => registerUser()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'User baru?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
