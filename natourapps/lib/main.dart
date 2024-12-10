import 'package:flutter/material.dart';
import 'package:natourapps/view/adminWisata/addWisata.dart';
import 'package:natourapps/view/adminWisata/listTiket.dart'; //nyoba aja
import 'package:natourapps/view/pengguna/dashboardPengguna.dart';
import 'package:natourapps/view/pengguna/detailAlat.dart';
import 'package:natourapps/view/penyewa/dashboardPenyewa.dart'; // nyoba aja
import 'package:natourapps/view/penyewa/addAlat.dart'; // nyoba aja
import 'package:natourapps/view/penyewa/listAlatSewa.dart'; // nyoba aja
import 'package:natourapps/view/penyewa/detailAlatPenyewa.dart'; // nyoba aja
import 'package:natourapps/view/adminWisata/dashboardAdmin.dart'; // nyoba aja
import 'view/loginUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:natourapps/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Pastikan widget binding terpasang
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
      home: addWisata(), // Halaman pertama adalah LoginPage
    );
  }
}
