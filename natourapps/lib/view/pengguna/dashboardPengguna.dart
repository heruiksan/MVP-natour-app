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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.04,
                    horizontal: 0.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.2),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.06,
                              backgroundImage: AssetImage('assets/profile.png'),
                              backgroundColor: Colors.blue,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenWidth * 0.04,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Selamat Datang,",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                  Text(
                                    "Heru",
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
                        size: screenWidth * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Kunjungi Tempat Indah Sekitarmu!",
                style: TextStyle(
                  fontSize: screenWidth * 0.075,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
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
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 205, 232, 255),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.03,
                    horizontal: screenWidth * 0.04,
                  ),
                ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jadwal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text("Rabu, 23 November 2022"),
                          Text("Situ datar, 2 hari"),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud,
                            size: screenWidth * 0.1,
                            color: Colors.blue,
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            "23°, Hujan Lebat",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
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
              SizedBox(height: screenWidth * 0.025),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.wallet, // Ikon keuntungan
                            size: screenWidth * 0.175, // Ukuran ikon
                            color: Colors.blue, // Warna ikon
                          ),
                          SizedBox(width: screenWidth * 0.025), // Jarak antara ikon dan teks
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deposit", // Teks menggantikan tanggal
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.055,
                                  color: Colors.blue, // Warna teks
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.01),
                              Row(
                                children: [
                                  Text(
                                    "Rp", // Tulisan keuntungan
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green, // Warna teks 15%
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          screenWidth * 0.025), // Jarak antara ikon "UP" dan teks 15%
                                  Text(
                                    "50.000.00", // Tulisan keuntungan
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
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
                  GestureDetector(
                    onTap: () {
                      _showDateAndNightModal(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        border: Border.all(
                          color: Colors.blue,
                          width: screenWidth * 0.005,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.landscape,
                            size: screenWidth * 0.1,
                            color: Colors.blue,
                          ),
                          SizedBox(height: screenWidth * 0.02),
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
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        border: Border.all(
                          color: Colors.blue,
                          width: screenWidth * 0.005,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: screenWidth * 0.1,
                            color: Colors.blue,
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text("Sewa Alat"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.18),
            ],
          ),
        ],
      ),
    );
  }

  void _showDateAndNightModal(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    int nights = 1;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            bottom: MediaQuery.of(context).viewInsets.bottom + screenWidth * 0.05,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenWidth * 0.05),
              Text(
                "Pilih Tanggal dan Jumlah Malam",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenWidth * 0.05),
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
              SizedBox(height: screenWidth * 0.05),
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
              SizedBox(height: screenWidth * 0.05),
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
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            bottom: MediaQuery.of(context).viewInsets.bottom + screenWidth * 0.05,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenWidth * 0.05),
              Text(
                "Pilih Tanggal dan Jumlah Hari",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenWidth * 0.05),
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
              SizedBox(height: screenWidth * 0.05),
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
              SizedBox(height: screenWidth * 0.05),
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
