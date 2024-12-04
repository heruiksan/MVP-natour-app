import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/bottomNavbarPengguna.dart';
import 'package:natourapps/view/registerUser.dart';

class loginUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 0, 108, 196), // Warna latar belakang utama
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/logo.png', // Ganti dengan path logo Anda
                  height: 100,
                ),
              ),
              const SizedBox(height: 24.0),

              // Judul Login
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24.0),

              // TextField Email
              TextField(
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

              // TextField Kata Sandi
              TextField(
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

              // Lupa Kata Sandi
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Aksi Lupa Kata Sandi
                  },
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

              // Tombol Masuk
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                    (route) => false, // Menghapus semua route sebelumnya
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 55, 192, 255), // Warna tombol
                  elevation: 5, // Tinggi shadow
                  shadowColor: Colors.black.withOpacity(0.5), // Warna shadow
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Sudut melengkung
                  ),
                  minimumSize:
                      const Size(double.infinity, 48), // Ukuran tombol penuh
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 200.0),

              // Daftar Baru
              GestureDetector(
                onTap: () {
                  // Navigate to the next page when 'Daftar' is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            registerUser()), // Replace with your next page
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Makes sure the row only takes up the necessary space
                  children: const [
                    Text(
                      'User baru?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 5), // Space between texts
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
