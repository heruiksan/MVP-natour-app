import 'package:flutter/material.dart';

class Deskripsialat extends StatefulWidget {
  final String namaAlat;
  final String alamatAlat;
  final String deskripsiAlat;
  final int sisaAlat;
  final double hargaAlat;

  // Constructor untuk menerima data dari halaman sebelumnya
  Deskripsialat({
    required this.namaAlat,
    required this.alamatAlat,
    required this.deskripsiAlat,
    required this.sisaAlat,
    required this.hargaAlat,
  });

  @override
  _DetailAlatState createState() => _DetailAlatState();
}

class _DetailAlatState extends State<Deskripsialat> {
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
                      height: 250 * screenWidth / 375,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          '250x250',
                          style: TextStyle(color: Colors.grey, fontSize: 12 * screenWidth / 375),
                        ),
                      ),
                    ),
                  ),

                  // Menampilkan Nama Alat
                  Padding(
                    padding: EdgeInsets.only(
                        left: 36.0 * screenWidth / 375, right: 36.0 * screenWidth / 375, top: 20.0 * screenWidth / 375, bottom: 50.0 * screenWidth / 375),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.namaAlat,
                          style: TextStyle(
                              fontSize: 24 * screenWidth / 375,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        // Menampilkan Alamat Alat
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.blue.withOpacity(0.7), size: 25 * screenWidth / 375),
                            Text(
                              widget.alamatAlat,
                              style: TextStyle(
                                  fontSize: 14 * screenWidth / 375,
                                  color: Colors.blue.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 25.0 * screenWidth / 375, bottom: 25.0 * screenWidth / 375),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12 * screenWidth / 375),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Warna bayangan
                                  blurRadius: 10 * screenWidth / 375, // Ukuran blur bayangan
                                  offset:
                                      Offset(4 * screenWidth / 375, 4 * screenWidth / 375), // Posisi bayangan (x, y)
                                  spreadRadius: 1 * screenWidth / 375, // Lebar penyebaran bayangan
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0 * screenWidth / 375, right: 5.0 * screenWidth / 375, top: 5.0 * screenWidth / 375, bottom: 5.0 * screenWidth / 375),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue, // Warna border
                                    width: 1 * screenWidth / 375, // Ketebalan border
                                  ),
                                  borderRadius: BorderRadius.circular(10 * screenWidth / 375),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 50.0 * screenWidth / 375,
                                      right: 50.0 * screenWidth / 375,
                                      top: 5.0 * screenWidth / 375,
                                      bottom: 5.0 * screenWidth / 375),
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
                                                  size: 18 * screenWidth / 375),
                                              SizedBox(width: 4 * screenWidth / 375),
                                              Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontSize: 16 * screenWidth / 375,
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
                                            '${widget.sisaAlat}',
                                            style: TextStyle(
                                                fontSize: 14 * screenWidth / 375,
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
                          padding: EdgeInsets.only(bottom: 8.0 * screenWidth / 375),
                          child: Text(
                            'Deskripsi',
                            style: TextStyle(
                                fontSize: 20 * screenWidth / 375,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.0 * screenWidth / 375),
                          child: Text(
                            widget.deskripsiAlat,
                            style:
                                TextStyle(fontSize: 14 * screenWidth / 375, color: Colors.black87),
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
            top: 40 * screenWidth / 375,
            left: 16 * screenWidth / 375,
            child: Container(
              padding: EdgeInsets.all(5 * screenWidth / 375),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Slight transparency
                borderRadius: BorderRadius.circular(100 * screenWidth / 375),
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
