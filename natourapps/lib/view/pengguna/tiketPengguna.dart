import 'package:flutter/material.dart';

class TiketPengguna extends StatefulWidget {
  @override
  _TiketPenggunaState createState() => _TiketPenggunaState();
}

class _TiketPenggunaState extends State<TiketPengguna> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tiket',
          style: TextStyle(
            fontSize: 24, // Ukuran font
            fontWeight: FontWeight.w900, // Ketebalan font
            color: Colors.blue, // Warna teks
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue, // Warna ikon back
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: ToggleButtons(
                  isSelected: [
                    selectedButtonIndex == 0,
                    selectedButtonIndex == 1,
                  ],
                  onPressed: (index) {
                    setState(() {
                      selectedButtonIndex = index;
                    });
                  },
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                      child: Text(
                        'Berkemah',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                      child: Text(
                        'Sewa Alat',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                  selectedColor: Colors.white,
                  color: Colors.blue,
                  fillColor: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  borderWidth: 2,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            selectedButtonIndex == 0 
            ? Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Warna bayangan
                      blurRadius: 10, // Ukuran blur bayangan
                      offset: Offset(4, 4), // Posisi bayangan (x, y)
                      spreadRadius: 1, // Lebar penyebaran bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://www.esdm.go.id/assets/imagecache/bodyView/arsip-berita-aktivitas-vulkanik-gunung-slamet-meningkat-masyarakat-diminta-tidak-beraktivitas-dalam-radius-2-kilometer-dari-kawah-ariflxk.jpg'), // Ganti dengan path gambar kamu
                                    fit: BoxFit
                                        .cover, // Gambar akan mengisi seluruh Container
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/2/2f/Rickrolling_QR_code.png',
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100),
                                      SizedBox(width: 20,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Heru',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 24
                                            ),
                                          ),
                                          Text(
                                            '[ E-X47 212 ]',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 24
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nama Lokasi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            'Cukul',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tanggal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '22/02/2025',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '15000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Jumlah',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '1 Orang',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Malam',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '1 Malam',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 0.0,
                                          top: 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '------------------------------------------------',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255),
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Rp15000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Warna bayangan
                      blurRadius: 10, // Ukuran blur bayangan
                      offset: Offset(4, 4), // Posisi bayangan (x, y)
                      spreadRadius: 1, // Lebar penyebaran bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://asset-2.tstatic.net/travel/foto/bank/images/glamping.jpg'), // Ganti dengan path gambar kamu
                                    fit: BoxFit
                                        .cover, // Gambar akan mengisi seluruh Container
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/2/2f/Rickrolling_QR_code.png',
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100),
                                      SizedBox(width: 20,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Heru',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 24
                                            ),
                                          ),
                                          Text(
                                            '[ E-X47 255 ]',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 24
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nama Lokasi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            'Tenda Eiger',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tanggal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '22/02/2025',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '50000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Jumlah',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '1 Barang',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Malam',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                          Text(
                                            '1 Malam',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 0.0,
                                          top: 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '------------------------------------------------',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 4.0,
                                          top: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 110, 190, 255),
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Rp50000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
