import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/pembayaranBerkemah.dart';

class DetailLokasi extends StatefulWidget {
  final String namaLokasi;
  final String alamatLokasi;
  final String deskripsiLokasi;
  final String kapasitas;
  final double hargaLokasi;
  final DateTime selectedDate;
  final int days;

  DetailLokasi({
    required this.namaLokasi,
    required this.alamatLokasi,
    required this.deskripsiLokasi,
    required this.kapasitas,
    required this.hargaLokasi,
    required this.selectedDate,
    required this.days,
  });

  @override
  _DetailLokasiState createState() => _DetailLokasiState();
}

class _DetailLokasiState extends State<DetailLokasi> {
  bool _isClicked = false;
  int _jumlahOrang = 1;
  late double _harga;
  late double _totalHarga;

  @override
  void initState() {
    super.initState();
    _harga = widget.hargaLokasi.toDouble();
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
                  Container(
                    color: Colors.blueGrey,
                    child: SizedBox(
                      height: screenWidth * 0.5,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          '250x250',
                          style: TextStyle(
                              color: Colors.grey, fontSize: screenWidth * 0.03),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.namaLokasi,
                          style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.blue.withOpacity(0.7),
                                size: screenWidth * 0.06),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              widget.alamatLokasi,
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
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: screenWidth * 0.03,
                                  offset: Offset(
                                      screenWidth * 0.01, screenWidth * 0.01),
                                  spreadRadius: screenWidth * 0.005,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: screenWidth * 0.005,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.03),
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
                                              SizedBox(
                                                  width: screenWidth * 0.01),
                                              Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
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
                                            'Kapasitas',
                                            style: TextStyle(
                                              color:
                                                  Colors.blue.withOpacity(0.7),
                                            ),
                                          ),
                                          Text(
                                            '${widget.kapasitas}',
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
                            widget.deskripsiLokasi,
                            style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.black87),
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
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(screenWidth * 0.1),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () {
                  Navigator.pop(context);
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
                                builder: (context) => PembayaranBerkemah(
                                  namaLokasi: widget.namaLokasi,
                                  alamatLokasi: widget.alamatLokasi,
                                  deskripsiLokasi: widget.deskripsiLokasi,
                                  kapasitas: widget.kapasitas,
                                  hargaLokasi: widget.hargaLokasi,
                                  selectedDate: widget.selectedDate,
                                  nights: widget.days,
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
                                    '$_jumlahOrang Orang', // Menampilkan jumlah orang
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
