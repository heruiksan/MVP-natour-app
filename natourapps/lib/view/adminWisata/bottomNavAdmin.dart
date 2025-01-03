import 'package:flutter/material.dart';
import 'package:natourapps/view/adminWisata/dashboardAdmin.dart';
import 'package:natourapps/view/adminWisata/listTiket.dart';
import 'package:natourapps/view/adminWisata/settingAdmin.dart';

class navbarAdmin extends StatefulWidget {
  @override
  _navbarAdminState createState() => _navbarAdminState();
}

class _navbarAdminState extends State<navbarAdmin> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    dashboardAdmin(),
    listTiket(),
    settingAdmin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), // Menggunakan screenWidth
                activeIcon: Icon(Icons.home,), // Menggunakan screenWidth
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on), // Menggunakan screenWidth
                activeIcon: Icon(Icons.location_on,), // Menggunakan screenWidth
                label: 'Lahan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings), // Menggunakan screenWidth
                activeIcon: Icon(Icons.settings,), // Menggunakan screenWidth
                label: 'Pengaturan',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: biruNatour,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,// Menggunakan screenWidth untuk ukuran font
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,// Menggunakan screenWidth untuk ukuran font
            ),
          ),
        ],
      ),
    );
  }
}
