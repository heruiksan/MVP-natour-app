import 'package:flutter/material.dart';

class TiketPengguna extends StatefulWidget {
  @override
  _TiketPenggunaState createState() => _TiketPenggunaState();
}

class _TiketPenggunaState extends State<TiketPengguna> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tiket',
          style: TextStyle(
            fontSize: screenWidth * 0.06, // Responsif
            fontWeight: FontWeight.w900,
            color: Colors.blue,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.02),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.12,
                          vertical: screenWidth * 0.02),
                      child: Text(
                        'Berkemah',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.12,
                          vertical: screenWidth * 0.02),
                      child: Text(
                        'Sewa Alat',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ],
                  selectedColor: Colors.white,
                  color: Colors.blue,
                  fillColor: Colors.blue,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  borderWidth: screenWidth * 0.005,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            selectedButtonIndex == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenWidth * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: screenWidth * 0.03,
                            offset:
                                Offset(screenWidth * 0.01, screenWidth * 0.01),
                            spreadRadius: screenWidth * 0.005,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenWidth * 0.4,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.esdm.go.id/assets/imagecache/bodyView/arsip-berita-aktivitas-vulkanik-gunung-slamet-meningkat-masyarakat-diminta-tidak-beraktivitas-dalam-radius-2-kilometer-dari-kawah-ariflxk.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/2/2f/Rickrolling_QR_code.png',
                                      fit: BoxFit.cover,
                                      height: screenWidth * 0.25,
                                      width: screenWidth * 0.25),
                                  SizedBox(width: screenWidth * 0.05),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Heru',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.06,
                                        ),
                                      ),
                                      Text(
                                        '[ E-X47 212 ]',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.06,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildRow(
                                  label: 'Nama Lokasi',
                                  value: 'Pantai Indah',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Tanggal',
                                  value: '6/12/2024',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Subtotal',
                                  value: '15000',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Jumlah',
                                  value: '1 Orang',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Malam',
                                  value: '1 Malam',
                                  screenWidth: screenWidth,
                                ),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 110, 190, 255),
                                  thickness: screenWidth * 0.005,
                                ),
                                _buildRow(
                                  label: 'Total',
                                  value: 'Rp15000',
                                  screenWidth: screenWidth,
                                  valueStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.055,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenWidth * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            blurRadius: screenWidth * 0.03,
                            offset: Offset(screenWidth * 0.01, screenWidth * 0.01), // Posisi bayangan (x, y)
                            spreadRadius: screenWidth * 0.005, // Lebar penyebaran bayangan
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenWidth * 0.4,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://asset-2.tstatic.net/travel/foto/bank/images/glamping.jpg'), // Ganti dengan path gambar kamu
                                fit: BoxFit
                                    .cover, // Gambar akan mengisi seluruh Container
                              ),
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/2/2f/Rickrolling_QR_code.png',
                                      fit: BoxFit.cover,
                                      height: screenWidth * 0.25,
                                      width: screenWidth * 0.25),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Heru',
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.06),
                                      ),
                                      Text(
                                        '[ E-X47 255 ]',
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.06),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                _buildRow(
                                  label: 'Nama Barang',
                                  value: 'Tenda',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Tanggal',
                                  value: '6/12/2024',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Subtotal',
                                  value: '50000',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Jumlah',
                                  value: '1 Barang',
                                  screenWidth: screenWidth,
                                ),
                                _buildRow(
                                  label: 'Malam',
                                  value: '1 Malam',
                                  screenWidth: screenWidth,
                                ),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 110, 190, 255),
                                  thickness: screenWidth * 0.005,
                                ),
                                _buildRow(
                                  label: 'Total',
                                  value: 'Rp50000',
                                  screenWidth: screenWidth,
                                  valueStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.055,
                                    color: Colors.blue,
                                  ),
                                ),
      
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String label,
    required String value,
    required double screenWidth,
    TextStyle? valueStyle,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.04,
              color: const Color.fromARGB(255, 110, 190, 255),
            ),
          ),
          Text(
            value,
            style: valueStyle ??
                TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                  color: Colors.blue,
                ),
          ),
        ],
      ),
    );
  }
}
