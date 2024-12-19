import 'package:flutter/material.dart';
import 'package:natourapps/Model/wisataMode.dart';
import 'package:natourapps/view/adminWisata/dashboardAdmin.dart';
import 'package:natourapps/view/adminWisata/listTiket.dart';
import 'package:natourapps/view/adminWisata/settingAdmin.dart';

class navbarAdmin extends StatefulWidget {
  @override
  _navbarAdminState createState() => _navbarAdminState();
}

class _navbarAdminState extends State<navbarAdmin> {
  int _selectedIndex = 0;

  // Replace with the actual userId from your app's context (e.g., FirebaseAuth, etc.)
  final String userId = "someUserId"; // Example userId

  static List<Widget> _widgetOptions = <Widget>[
    dashboardAdmin(),
    // listTiket now requires userId, pass it when navigating
    // listTiket(userId: userId),
    // This will be handled inside the onTap method
    settingAdmin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // If the selected index is 1 (i.e., "lahan" tab), pass the userId to listTiket
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => listTiket(userId: userId), // Pass userId here
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Color biruNatour = Colors.blue;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home, size: 32),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                activeIcon: Icon(Icons.location_on, size: 32),
                label: 'Lahan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings, size: 32),
                label: 'Pengaturan',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
