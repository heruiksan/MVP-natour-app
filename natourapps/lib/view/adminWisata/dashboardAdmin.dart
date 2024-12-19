import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:natourapps/view/adminWisata/addWisata.dart';
import 'package:natourapps/view/adminWisata/listTiket.dart';

class dashboardAdmin extends StatefulWidget {
  @override
  _dashboardAdminState createState() => _dashboardAdminState();
}

class _dashboardAdminState extends State<dashboardAdmin> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.1), // Padding di dalam kotak
                        decoration: BoxDecoration(
                          color: Colors.blue[50], // Warna latar kotak
                          borderRadius: BorderRadius.circular(
                              500), // Sudut kotak melengkung
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24, // Ukuran lingkaran
                              backgroundImage: AssetImage(
                                  'assets/profile.png'), // Gambar profil
                              backgroundColor: Colors
                                  .blue, // Warna latar belakang jika gambar kosong
                            ),
                            SizedBox(width: 5), // Jarak antara gambar dan teks
                            // Teks di samping gambar
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 16), // Padding kanan untuk teks
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Selamat Datang,",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Text(
                                    currentUserName ??
                                        "Pengguna", // Nama dinamis
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
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
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Kunjungi Tempat Indah Sekitarmu!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari tempat wisata",
                  hintStyle: TextStyle(
                    color: Colors.blue
                        .withOpacity(0.6), // Slightly lighter hint text color
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue, // Icon color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.blue, width: 2), // Blue border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 2), // Blue border on focus
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(
                      255, 205, 232, 255), // Light blue background
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16), // Padding inside the text field
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  // Kotak Tanggal
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jadwal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(height: 8),
                          Text("Rabu, 23 November 2022"),
                          Row(
                            children: [
                              Icon(
                                Icons.confirmation_number,
                                size: 37,
                                color: Colors.blue,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 30)),
                                  Text(
                                    'Mendatang',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    '12 Pengunjung',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  // Kotak Cuaca
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Vertikal ke tengah
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // Horizontal ke tengah
                          children: [
                            // Row yang berisi ikon dan teks
                            Text(
                              'Keuntungan',
                              style: TextStyle(color: Colors.blue),
                            ),
                            Icon(
                              Icons.bar_chart,
                              size: 55,
                              color: Colors.blue,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "+15%",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            // Anda bisa menambahkan widget lainnya di sini
                            SizedBox(height: 5),
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.group, // Ikon keuntungan
                            size: 80, // Ukuran ikon
                            color: Colors.blue, // Warna ikon
                          ),
                          SizedBox(width: 8), // Jarak antara ikon dan teks
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengunjung saat ini", // Teks menggantikan tanggal
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.blue, // Warna teks
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "19 wisatawan", // Tulisan keuntungan
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Warna teks 15%
                                ),
                              ), // Jarak antara teks keuntungan dan 15%
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Layanan Kami",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.bar_chart, size: 40, color: Colors.blue),
                            SizedBox(height: 8),
                            Text(
                              "Pengunjung",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Jarak antar kotak
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.account_balance,
                              size: 40, color: Colors.blue),
                          SizedBox(height: 8),
                          Text("Keuangan"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
            ],
          ),
        ],
      ),
    );
  }
}
