import 'package:flutter/material.dart';
import 'package:natourapps/view/dashboardAdmin.dart';
import 'view/loginUser.dart';
import 'view/registerUser.dart'; // Pastikan file login_page.dart berada di folder yang sesuai

void main() {
  runApp(NatourApp());
}

class NatourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Natour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Tambahkan font jika diinginkan
      ),
      home: loginUser(), // Halaman pertama adalah LoginPage
    );
  }
}
