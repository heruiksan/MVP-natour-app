import 'package:flutter/material.dart';
import 'package:natourapps/view/penyewa/addAlat.dart';
import 'package:natourapps/view/penyewa/listAlatSewa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class dashboardPenyewa extends StatefulWidget {
  @override
  _dashboardPenyewaState createState() => _dashboardPenyewaState();
}

class _dashboardPenyewaState extends State<dashboardPenyewa> {
  String? currentUserName;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser; // Get current user
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users') // Replace with your Firestore collection name
            .doc(user.uid)
            .get();
        setState(() {
          currentUserName =
              userDoc['fullName'] ?? 'Guest'; // Replace 'name' with your field
        });
      }
    } catch (e) {
      print("Error fetching user name: $e");
      setState(() {
        currentUserName = 'Guest';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20 * screenWidth / 375), // Padding responsif
            children: [
              SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16 * screenWidth / 375, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.1 * screenWidth / 375), // Padding di dalam kotak
                        decoration: BoxDecoration(
                          color: Colors.blue[50], // Warna latar kotak
                          borderRadius: BorderRadius.circular(500 * screenWidth / 375), // Sudut kotak melengkung
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24 * screenWidth / 375, // Ukuran lingkaran
                              backgroundImage: AssetImage('assets/profile.png'), // Gambar profil
                              backgroundColor: Colors.blue, // Warna latar belakang jika gambar kosong
                            ),
                            SizedBox(width: 5 * screenWidth / 375), // Jarak antara gambar dan teks
                            // Teks di samping gambar
                            Padding(
                              padding: EdgeInsets.only(right: 16 * screenWidth / 375), // Padding kanan untuk teks
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Selamat Datang,",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14 * screenWidth / 375),
                                  ),
                                  Text(
                                    currentUserName ?? "Pengguna", // Nama dinamis
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16 * screenWidth / 375,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.blue,
                        size: 40 * screenWidth / 375, // Ukuran ikon
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Kunjungi Tempat Indah Sekitarmu!",
                style: TextStyle(
                    fontSize: 30 * screenWidth / 375, // Ukuran font responsif
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 16 * screenWidth / 375),
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari tempat wisata",
                  hintStyle: TextStyle(
                    color: Colors.blue.withOpacity(0.6),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12 * screenWidth / 375), // Radius border
                    borderSide: BorderSide(color: Colors.blue, width: 2 * screenWidth / 375), // Border width
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                    borderSide: BorderSide(color: Colors.blue, width: 2 * screenWidth / 375),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 205, 232, 255), // Background color
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12 * screenWidth / 375,
                      horizontal: 16 * screenWidth / 375), // Padding inside the text field
                ),
              ),
              SizedBox(height: 16 * screenWidth / 375),
              Row(
                children: [
                  // Kotak Tanggal
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16 * screenWidth / 375),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jadwal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12 * screenWidth / 375),
                          ),
                          SizedBox(height: 8 * screenWidth / 375),
                          Text("Rabu, 23 November 2022"),
                          Text("Faris, 2 tenda eiger"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * screenWidth / 375),
                  // Kotak Cuaca
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16 * screenWidth / 375),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.gif_box_outlined,
                                size: 15 * screenWidth / 375,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 4 * screenWidth / 375),
                              Text(
                                "sisa Barang",
                                style: TextStyle(
                                  fontSize: 15 * screenWidth / 375,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5 * screenWidth / 375),
                          Text(
                            "19",
                            style: TextStyle(
                                fontSize: 40 * screenWidth / 375,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16 * screenWidth / 375),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16 * screenWidth / 375),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            size: 80 * screenWidth / 375,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8 * screenWidth / 375),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keuntungan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25 * screenWidth / 375,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 4 * screenWidth / 375),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    size: 25 * screenWidth / 375,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 4 * screenWidth / 375),
                                  Text(
                                    "15%",
                                    style: TextStyle(
                                      fontSize: 25 * screenWidth / 375,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16 * screenWidth / 375),
              Text(
                "Layanan Kami",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20 * screenWidth / 375,
                    color: Colors.blue),
              ),
              SizedBox(height: 16 * screenWidth / 375),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 8 * screenWidth / 375),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addAlat()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16 * screenWidth / 375),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                          border: Border.all(color: Colors.blue, width: 2 * screenWidth / 375),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.add_box, size: 40 * screenWidth / 375, color: Colors.blue),
                            SizedBox(height: 8 * screenWidth / 375),
                            Text(
                              "Tambah Alat",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16 * screenWidth / 375,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * screenWidth / 375),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => listAlatSewa()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16 * screenWidth / 375),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                          border: Border.all(color: Colors.blue, width: 2 * screenWidth / 375),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.list, size: 40 * screenWidth / 375, color: Colors.blue),
                            SizedBox(height: 8 * screenWidth / 375),
                            Text(
                              "List Alat Sewa",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16 * screenWidth / 375,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
