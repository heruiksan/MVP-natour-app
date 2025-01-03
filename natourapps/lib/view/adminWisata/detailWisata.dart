import 'package:flutter/material.dart';

class Detailwisata extends StatefulWidget {
  String namaLahan;
  String deskripsi;
  String jenisLahan;
  String kapasitas;
  String fasilitas;
  double harga;
  String lokasi;

  // Constructor untuk menerima data dari halaman sebelumnya
  Detailwisata({
    required this.namaLahan,
    required this.deskripsi,
    required this.jenisLahan,
    required this.kapasitas,
    required this.fasilitas,
    required this.harga,
    required this.lokasi,
  });

  @override
  _DetailwisataState createState() => _DetailwisataState();
}

class _DetailwisataState extends State<Detailwisata> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scalingFactor = screenWidth / 375;

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
                      height: 250 * scalingFactor,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          '250x250',
                          style: TextStyle(color: Colors.grey, fontSize: 12 * scalingFactor),
                        ),
                      ),
                    ),
                  ),

                  // Menampilkan Nama Alat
                  Padding(
                    padding: EdgeInsets.only(
                        left: 36.0 * scalingFactor, right: 36.0 * scalingFactor, top: 20.0 * scalingFactor, bottom: 50.0 * scalingFactor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.namaLahan,
                          style: TextStyle(
                              fontSize: 24 * scalingFactor,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        // Menampilkan Alamat Alat
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.blue.withOpacity(0.7), size: 25 * scalingFactor),
                            Text(
                              widget.lokasi,
                              style: TextStyle(
                                  fontSize: 14 * scalingFactor,
                                  color: Colors.blue.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 25.0 * scalingFactor, bottom: 25.0 * scalingFactor),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12 * scalingFactor),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Warna bayangan
                                  blurRadius: 10 * scalingFactor, // Ukuran blur bayangan
                                  offset:
                                      Offset(4 * scalingFactor, 4 * scalingFactor), // Posisi bayangan (x, y)
                                  spreadRadius: 1 * scalingFactor, // Lebar penyebaran bayangan
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0 * scalingFactor, right: 5.0 * scalingFactor, top: 5.0 * scalingFactor, bottom: 5.0 * scalingFactor),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue, // Warna border
                                    width: 1 * scalingFactor, // Ketebalan border
                                  ),
                                  borderRadius: BorderRadius.circular(10 * scalingFactor),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 50.0 * scalingFactor,
                                      right: 50.0 * scalingFactor,
                                      top: 5.0 * scalingFactor,
                                      bottom: 5.0 * scalingFactor),
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
                                                  size: 18 * scalingFactor),
                                              SizedBox(width: 4 * scalingFactor),
                                              Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontSize: 16 * scalingFactor,
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
                                                fontSize: 14 * scalingFactor,
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
                          padding: EdgeInsets.only(bottom: 8.0 * scalingFactor),
                          child: Text(
                            'Deskripsi',
                            style: TextStyle(
                                fontSize: 20 * scalingFactor,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.0 * scalingFactor),
                          child: Text(
                            widget.deskripsi,
                            style:
                                TextStyle(fontSize: 14 * scalingFactor, color: Colors.black87),
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
            top: 40 * scalingFactor,
            left: 16 * scalingFactor,
            child: Container(
              padding: EdgeInsets.all(5 * scalingFactor),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Slight transparency
                borderRadius: BorderRadius.circular(100 * scalingFactor),
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
        ],
      ),
    );
  }
}
