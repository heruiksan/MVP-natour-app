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
                            Icons.wallet, // Ikon keuntungan
                            size: 80, // Ukuran ikon
                            color: Colors.blue, // Warna ikon
                          ),
                          SizedBox(width: 8), // Jarak antara ikon dan teks
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deposit", // Teks menggantikan tanggal
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.blue, // Warna teks
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "RP", // Tulisan keuntungan
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green, // Warna teks 15%
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          4), // Jarak antara ikon "UP" dan teks 15%
                                  Text(
                                    "50.000.00", // Tulisan keuntungan
                                    style: TextStyle(
                                      fontSize: 20,
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
                ],
              ),
              SizedBox(height: 70),
            ],
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
                    initialDate: selectedDate ?? DateTime.now(),
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
                      builder: (context) => PilihanBerkemah(
                        selectedDate: selectedDate,
                        days: nights,
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
                    initialDate: selectedDate ?? DateTime.now(),
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
                      builder: (context) => PilihanAlat(
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
