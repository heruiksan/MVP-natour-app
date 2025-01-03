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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(screenWidth * 0.05), // 5% of screen width
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.04, // 4% of screen width
                    horizontal: 0.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.002), // Adjust padding based on screen width
                        decoration: BoxDecoration(
                          color: Colors.blue[50], // Background color
                          borderRadius: BorderRadius.circular(screenWidth * 0.1), // Rounded corners
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.06, // 6% of screen width for the circle size
                              backgroundImage: AssetImage('assets/profile.png'), // Profile picture
                              backgroundColor: Colors.blue, // Background color if image is not found
                            ),
                            SizedBox(width: screenWidth * 0.01), // Horizontal space between avatar and text
                            Padding(
                              padding: EdgeInsets.only(right: screenWidth * 0.04), // Right padding for text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Selamat Datang,",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: screenWidth * 0.035),
                                  ),
                                  Text(
                                    currentUserName ?? "Pengguna", // Dynamic name
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.04,
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
                        size: screenWidth * 0.1, // Adjust icon size based on screen width
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Kunjungi Tempat Indah Sekitarmu!",
                style: TextStyle(
                    fontSize: screenWidth * 0.075, // Adjust text size based on screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: screenWidth * 0.04), // Vertical space between widgets
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari tempat wisata",
                  hintStyle: TextStyle(
                    color: Colors.blue.withOpacity(0.6),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue, // Icon color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03), // Adjust border radius
                    borderSide: BorderSide(color: Colors.blue, width: screenWidth * 0.005), // Adjust border width
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                        color: Colors.blue, width: screenWidth * 0.005),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 205, 232, 255),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.03, horizontal: screenWidth * 0.04),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.04), // Adjust padding based on screen width
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(screenWidth * 0.03), // Adjust corner radius
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jadwal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: screenWidth * 0.03),
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text("Rabu, 23 November 2022"),
                          Row(
                            children: [
                              Icon(
                                Icons.confirmation_number,
                                size: screenWidth * 0.09, // Adjust icon size
                                color: Colors.blue,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: screenWidth * 0.08)),
                                  Text(
                                    'Mendatang',
                                    style: TextStyle(fontSize: screenWidth * 0.02),
                                  ),
                                  Text(
                                    '12 Pengunjung',
                                    style: TextStyle(fontSize: screenWidth * 0.025),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Keuntungan',
                              style: TextStyle(color: Colors.blue),
                            ),
                            Icon(
                              Icons.bar_chart,
                              size: screenWidth * 0.13,
                              color: Colors.blue,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  size: screenWidth * 0.06,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  "+15%",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenWidth * 0.02),
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.group,
                            size: screenWidth * 0.2,
                            color: Colors.blue,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengunjung saat ini",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.02),
                              Text(
                                "19 wisatawan",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Text(
                "Layanan Kami",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                    color: Colors.blue),
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          border: Border.all(color: Colors.blue, width: screenWidth * 0.005),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.bar_chart, size: screenWidth * 0.1, color: Colors.blue),
                            SizedBox(height: screenWidth * 0.02),
                            Text(
                              "Pengunjung",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.025, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        border: Border.all(color: Colors.blue, width: screenWidth * 0.005),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.account_balance,
                              size: screenWidth * 0.1, color: Colors.blue),
                          SizedBox(height: screenWidth * 0.02),
                          Text("Keuangan"),
                        ],
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
