import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/bottomNavbarPengguna.dart';


class PembayaranBerhasil extends StatefulWidget {
  @override
  _PembayaranBerhasilState createState() => _PembayaranBerhasilState();
}

class _PembayaranBerhasilState extends State<PembayaranBerhasil> {
  @override
  void initState() {
    super.initState();
    // Menambahkan delay 5 detik sebelum pindah halaman
    Future.delayed(Duration(seconds: 3), () {
      // Navigasi ke halaman DashboardPengguna
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 234, 255),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check, color: Colors.blue, size: 100,),
            Text(
              'Pembayaran Berhasil!',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}
