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
    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 108, 196),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 0.02),
                child: Image.asset(
                  'assets/logo.png',
                  height: screenWidth * 0.25,
                ),
              ),
              SizedBox(height: screenWidth * 0.06),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenWidth * 0.06),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: '@ Email/Nama',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
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
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: screenWidth * 0.035,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.06),
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
                      const SnackBar(content: Text('Login Berhasil')),
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
                  backgroundColor: const Color.fromARGB(255, 55, 192, 255),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.04,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  minimumSize: Size(double.infinity, screenWidth * 0.12),
                ),
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.04),
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ),
              SizedBox(height: screenWidth * 0.5),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => registerUser()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'User baru?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: screenWidth * 0.045,
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
