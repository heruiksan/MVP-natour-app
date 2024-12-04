import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/pilihanBerkemah.dart';
import 'package:natourapps/view/pengguna/pilihanAlat.dart';

class dashboardPengguna extends StatefulWidget {
  @override
  _dashboardPenggunaState createState() => _dashboardPenggunaState();
}

class _dashboardPenggunaState extends State<dashboardPengguna> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                                    "Heru",
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
                          Text("Situ datar, 2 hari"),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud, size: 40, color: Colors.blue),
                          SizedBox(height: 8),
                          Text(
                            "23°, Hujan Lebat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            "Bojongsoang",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [],
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
                  GestureDetector(
                    onTap: () {
                      _showDateAndNightModal(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                          16), // Add padding inside the container
                      decoration: BoxDecoration(
                        color:
                            Colors.blue[50], // Set background color of the box
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                        border: Border.all(
                            color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.landscape, size: 40, color: Colors.blue),
                          SizedBox(height: 8),
                          Text("Berkemah"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDateAndNightModalAlat(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                          16), // Add padding inside the container
                      decoration: BoxDecoration(
                        color:
                            Colors.blue[50], // Set background color of the box
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                        border: Border.all(
                            color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.shopping_cart,
                              size: 40, color: Colors.blue),
                          SizedBox(height: 8),
                          Text("Sewa Alat"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: 10, left: 10, top: 30, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 10), // Add padding between icon and text
                          child: Icon(
                            Icons.wallet, // Use the wallet icon
                            color: Colors.blue, // Set the icon color to blue
                            size: 50.0, // Set the icon size to make it larger
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align the texts to the start
                          children: [
                            Text(
                              "Deposit",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5), // Add a little space between texts
                              child: Text(
                                "Rp50.000,00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, "Beranda", 0),
                  _buildNavItem(Icons.confirmation_num, "Tiket", 1),
                  _buildNavItem(Icons.settings, "Pengaturan", 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _showDateAndNightModal(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    int nights = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Text(
                "Pilih Tanggal dan Jumlah Malam",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Pilihan Tanggal
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Pilih Tanggal",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                  text:
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                ),
              ),
              SizedBox(height: 16),
              // Jumlah Malam
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah Malam",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  nights = int.tryParse(value) ?? 1;
                },
              ),
              SizedBox(height: 16),
              // Tombol Lanjut
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup modal
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pilihanBerkemah(
                        selectedDate: selectedDate,
                        nights: nights,
                      ),
                    ),
                  );
                },
                child: Text("Lanjut"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDateAndNightModalAlat(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    int days = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Text(
                "Pilih Tanggal dan Jumlah Hari",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Pilihan Tanggal
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Pilih Tanggal",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                  text:
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                ),
              ),
              SizedBox(height: 16),
              // Jumlah Malam
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah Hari",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  days = int.tryParse(value) ?? 1;
                },
              ),
              SizedBox(height: 16),
              // Tombol Lanjut
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup modal
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pilihanAlat(
                        selectedDate: selectedDate,
                        days: days,
                      ),
                    ),
                  );
                },
                child: Text("Lanjut"),
              ),
            ],
          ),
        );
      },
    );
  }
}
