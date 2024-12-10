import 'package:flutter/material.dart';

class detailAlatPenyewa extends StatefulWidget {
  @override
  _detailAlatPenyewaState createState() => _detailAlatPenyewaState();
}

class _detailAlatPenyewaState extends State<detailAlatPenyewa> {
  bool _isClicked = false; // Status tombol Registrasi
  late double _harga; // Harga total

  @override
  void initState() {
    super.initState();
    _harga = 150000.0; // Harga dummy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan gambar Alat
                  Image.network(
                    'https://via.placeholder.com/400x250', // Gambar dummy
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                  SizedBox(height: 10),
                  // Menampilkan Nama Alat
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 36.0, right: 36.0, top: 20.0, bottom: 150.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tenda Eiger', // Nama alat dummy
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        // Menampilkan Alamat Alat
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.blue.withOpacity(0.7), size: 25),
                            Text(
                              'Magelang, Jawa Tengah', // Alamat dummy
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 25.0, bottom: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Warna bayangan
                                  blurRadius: 10, // Ukuran blur bayangan
                                  offset:
                                      Offset(4, 4), // Posisi bayangan (x, y)
                                  spreadRadius: 1, // Lebar penyebaran bayangan
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue, // Warna border
                                    width: 1, // Ketebalan border
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50.0,
                                      right: 50.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Rating',
                                            style: TextStyle(
                                              color:
                                                  Colors.blue.withOpacity(0.7),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.yellow,
                                                  size: 18),
                                              SizedBox(width: 4),
                                              Text(
                                                '4.5', // Rating dummy
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue
                                                        .withOpacity(0.7)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sisa Alat',
                                            style: TextStyle(
                                              color:
                                                  Colors.blue.withOpacity(0.7),
                                            ),
                                          ),
                                          Text(
                                            '5', // Sisa alat dummy
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Deskripsi',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Text(
                            'Tenda Eiger adalah tenda berkapasitas 4 orang yang ideal untuk kegiatan camping dan hiking. Tenda ini memiliki bahan tahan air dan dilengkapi dengan ventilasi untuk kenyamanan lebih saat beraktivitas di alam terbuka.',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Slight transparency
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () {
                  Navigator.pop(
                      context); // Navigates back to the previous screen
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Always at the bottom
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300), // Animation duration
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rp',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                            Text(
                              '${_harga}', // Menghitung harga berdasarkan jumlah orang
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '/hari',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: ElevatedButton(
                            key: ValueKey<bool>(
                                _isClicked), // Use key to trigger animation
                            onPressed: () {
                              setState(() {
                                _isClicked = !_isClicked; // Toggle button state
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 138, 202, 255),
                            ),
                            child: Text(
                              _isClicked ? 'Batal' : 'Detail',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Show the Batal button only if the user clicked
                    if (_isClicked)
                      Padding(
                        padding: EdgeInsets.only(left: 18, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jumlah penyewa',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '20',
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
