import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/pembayaranAlat.dart';

class DetailAlat extends StatefulWidget {
  final String namaAlat;
  final String alamatAlat;
  final String deskripsiAlat;
  final int sisaAlat;
  final double hargaAlat;
  final DateTime selectedDate;
  final int days;

  // Constructor untuk menerima data dari halaman sebelumnya
  DetailAlat({
    required this.namaAlat,
    required this.alamatAlat,
    required this.deskripsiAlat,
    required this.sisaAlat,
    required this.hargaAlat,
    required this.selectedDate,
    required this.days,
  });

  @override
  _DetailAlatState createState() => _DetailAlatState();
}

class _DetailAlatState extends State<DetailAlat> {
  bool _isClicked = false; // Status tombol Registrasi
  int _jumlahOrang = 1; // Jumlah orang yang ingin didaftarkan
  late double _harga; // Harga total
  late double _totalHarga;

  @override
  void initState() {
    super.initState();
    _harga = widget.hargaAlat.toDouble(); // Inisialisasi harga
    _totalHarga = _harga * _jumlahOrang;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan gambar Alat
                  Container(
                    color: Colors
                        .blueGrey, // Set your desired background color here
                    child: SizedBox(
                      height: screenWidth * 0.5,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          '250x250',
                          style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  // Menampilkan Nama Alat
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.namaAlat,
                          style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        // Menampilkan Alamat Alat
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.blue.withOpacity(0.7), size: screenWidth * 0.06),
                            Text(
                              widget.alamatAlat,
                              style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.blue.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.05),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Warna bayangan
                                  blurRadius: screenWidth * 0.03, // Ukuran blur bayangan
                                  offset:
                                      Offset(screenWidth * 0.01, screenWidth * 0.01), // Posisi bayangan (x, y)
                                  spreadRadius: screenWidth * 0.005, // Lebar penyebaran bayangan
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue, // Warna border
                                    width: screenWidth * 0.005, // Ketebalan border
                                  ),
                                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.12,
                                      vertical: screenWidth * 0.02),
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
                                                  size: screenWidth * 0.045),
                                              SizedBox(width: screenWidth * 0.01),
                                              Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontSize: screenWidth * 0.04,
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
                                            'Sisa Area',
                                            style: TextStyle(
                                              color:
                                                  Colors.blue.withOpacity(0.7),
                                            ),
                                          ),
                                          Text(
                                            '${widget.sisaAlat}',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenWidth * 0.02),
                          child: Text(
                            'Deskripsi',
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenWidth * 0.5),
                          child: Text(
                            widget.deskripsiAlat,
                            style:
                                TextStyle(fontSize: screenWidth * 0.035, color: Colors.black87),
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
            top: screenWidth * 0.1,
            left: screenWidth * 0.04,
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.01),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Slight transparency
                borderRadius: BorderRadius.circular(screenWidth * 0.1),
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
            bottom: _isClicked ? 0 : 0, // Animasi posisi
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
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
                            '${_totalHarga}', // Menghitung harga berdasarkan jumlah orang
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '/orang',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_isClicked) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PembayaranAlat(
                                  namaAlat: widget.namaAlat,
                                  alamatAlat: widget.alamatAlat,
                                  deskripsiAlat: widget.deskripsiAlat,
                                  sisaAlat: widget.sisaAlat,
                                  hargaAlat: widget.hargaAlat,
                                  selectedDate: widget.selectedDate,
                                  days: widget.days,
                                  hargaTotal: _totalHarga,
                                  jumlahOrang: _jumlahOrang,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              _isClicked = true; // Mengubah status tombol
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 138, 202, 255),
                        ),
                        child: Text(
                          _isClicked ? 'Bayar' : 'Registrasi',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_isClicked) ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.selectedDate}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${widget.days} Hari',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.remove, color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (_jumlahOrang > 1) {
                                          _jumlahOrang--; // Mengurangi jumlah orang
                                          _totalHarga = _harga * _jumlahOrang;
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    '$_jumlahOrang', // Menampilkan jumlah orang
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add, color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        _jumlahOrang++; // Menambah jumlah orang
                                        _totalHarga = _harga * _jumlahOrang;
                                      });
                                    },
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _isClicked =
                                            !_isClicked; // Toggle tombol
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor:
                                          Colors.red.withOpacity(0),
                                      side: BorderSide(
                                        color: Colors.red, // Warna border
                                        width: 2, // Ketebalan border
                                      ),
                                    ),
                                    child: Text(
                                      'Batal',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
