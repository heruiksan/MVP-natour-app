import 'package:flutter/material.dart';
import 'package:natourapps/view/penyewa/dashboardPenyewa.dart';
import 'package:natourapps/view/penyewa/listAlatSewa.dart';
import 'package:natourapps/view/penyewa/settingPenyewa.dart';

class navbarPenyewa extends StatefulWidget {
  @override
  _navbarPenyewaState createState() => _navbarPenyewaState();
}

class _navbarPenyewaState extends State<navbarPenyewa> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    dashboardPenyewa(),
    listAlatSewa(),
    settingPenyewa()
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home, size: 32),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.house_siding_rounded),
                activeIcon: Icon(Icons.house_siding_rounded, size: 32),
                label: 'alat',
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
