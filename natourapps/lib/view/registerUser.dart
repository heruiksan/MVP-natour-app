import 'package:flutter/material.dart';
import 'package:natourapps/view/loginUser.dart';

class registerUser extends StatelessWidget {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      resizeToAvoidBottomInset: true, // Mencegah overlap dengan keyboard
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginUser()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/logo.png', // Ganti dengan path logo Anda
                  height: 100,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'Daftar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: '@ Email/Nama',
                        hintStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.email, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        hintStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nomor Ponsel',
                        hintStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi',
                        hintStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                        suffixIcon:
                            Icon(Icons.visibility_off, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        text: 'Dengan mendaftar, anda setuju dengan ',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' dan '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' kami'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: Colors.blue, // Warna tombol
                        elevation: 8, // Tinggi bayangan
                        shadowColor: Colors.blueAccent, // Warna bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Action for registration
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  // Navigate to the next page when 'Daftar' is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            loginUser()), // Replace with your next page
                  );
                },
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Makes sure the row only takes up the necessary space
                    children: const [
                      Text(
                        'Punya akun?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 5), // Space between texts
                      Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
