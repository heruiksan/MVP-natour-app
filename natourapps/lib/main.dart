import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/dashboardPengguna.dart';
import 'view/loginUser.dart';
import 'view/registerUser.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:natourapps/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan widget binding terpasang
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
