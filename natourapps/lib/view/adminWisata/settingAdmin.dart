import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/view/loginUser.dart'; // Ganti dengan lokasi file login Anda

class settingAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar perangkat
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16 * screenWidth / 375), // Menyesuaikan dengan lebar layar
        color: Colors.blue[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20 * screenWidth / 375),
            Text(
              "Pengaturan Akun",
              style: TextStyle(
                fontSize: 20 * screenWidth / 375, // Menyesuaikan ukuran font
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20 * screenWidth / 375),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16 * screenWidth / 375),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5 * screenWidth / 375,
                      offset: Offset(0, 3 * screenWidth / 375),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue, size: 30 * screenWidth / 375),
                    SizedBox(width: 16 * screenWidth / 375),
                    Text(
                      "Profil",
                      style: TextStyle(fontSize: 16 * screenWidth / 375, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16 * screenWidth / 375, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20 * screenWidth / 375),
            GestureDetector(
              onTap: () {
                // Show the logout confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Apakah Anda yakin ingin logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Logika logout
                            try {
                              await FirebaseAuth.instance.signOut();
                              // Navigate back to login screen after logout
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => loginUser()), // Ganti dengan nama halaman login Anda
                              );
                            } catch (e) {
                              print("Error during logout: $e");
                            }
                          },
                          child: Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(16 * screenWidth / 375),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5 * screenWidth / 375,
                      offset: Offset(0, 3 * screenWidth / 375),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: 30 * screenWidth / 375),
                    SizedBox(width: 16 * screenWidth / 375),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 16 * screenWidth / 375, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16 * screenWidth / 375, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
