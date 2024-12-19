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
                          Text("Faris, 2 tenda eiger"),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.gif_box_outlined,
                                  size: 15,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "sisa Barang",
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
                            Text(
                              "19",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue),
                            ),
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
                            Icons.monetization_on, // Ikon keuntungan
                            size: 80, // Ukuran ikon
                            color: Colors.blue, // Warna ikon
                          ),
                          SizedBox(width: 8), // Jarak antara ikon dan teks
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keuntungan", // Teks menggantikan tanggal
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.blue, // Warna teks
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward, // Ikon "UP"
                                    size: 25, // Ukuran ikon
                                    color: Colors.green, // Warna ikon "UP"
                                  ),
                                  SizedBox(
                                      width:
                                          4), // Jarak antara ikon "UP" dan teks 15%
                                  Text(
                                    "15%", // Tulisan keuntungan
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green, // Warna teks 15%
                                    ),
                                  ),
                                ],
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
                  SizedBox(width: 8), // Jarak antar kotak
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addAlat()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.add_box, size: 40, color: Colors.blue),
                            SizedBox(height: 8),
                            Text("Posting"),
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
