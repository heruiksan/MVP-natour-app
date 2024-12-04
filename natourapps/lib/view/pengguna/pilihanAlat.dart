import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/detailAlat.dart';

class pilihanAlat extends StatefulWidget {
  @override
  _pilihanAlatState createState() => _pilihanAlatState();
}

class _pilihanAlatState extends State<pilihanAlat> {
  final List<Map<String, dynamic>> alatList = [
    {
      'gambarAlat': 'https://antarestar.com/wp-content/uploads/2021/01/Tenda-Camping-200-x-200-1.png',
      'namaAlat': 'Tenda',
      'ratingAlat': 4.5,
      'alamatAlat': 'Jl. Pantai No. 123',
      'hargaAlat': 150000,
      'deskripsiAlat':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sisaAlat':10
    },
    {
      'gambarAlat': 'https://antarestar.com/wp-content/uploads/2021/01/Tenda-Camping-200-x-200-1.png',
      'namaAlat': 'Kompor',
      'ratingAlat': 4.8,
      'alamatAlat': 'Jl. Gunung Agung No. 45',
      'hargaAlat': 200000,
      'deskripsiAlat':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sisaAlat':10
    },
    {
      'gambarAlat': 'https://antarestar.com/wp-content/uploads/2021/01/Tenda-Camping-200-x-200-1.png',
      'namaAlat': 'SB',
      'ratingAlat': 4.2,
      'alamatAlat': 'Jl. Taman No. 22',
      'hargaAlat': 100000,
      'deskripsiAlat':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sisaAlat':10
    },
    // Tambahkan lebih banyak data alat jika perlu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sewa Alat",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  // TextField untuk pencarian alat
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari Alat",
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 242, 255),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                  ),
                  // Dropdown untuk alat
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Lokasi",
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 242, 255),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Tombol Cari
                  ElevatedButton(
                    onPressed: () {
                      // Aksi tombol cari
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Cari",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true, // Menghindari overflow
                physics: NeverScrollableScrollPhysics(), // Disable scroll
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom
                  crossAxisSpacing: 10, // Spasi antar kolom
                  mainAxisSpacing: 10, // Spasi antar baris
                ),
                itemCount: alatList.length,
                itemBuilder: (context, index) {
                  final alat = alatList[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman DetailLokasi dengan data lokasi
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailAlat(
                            gambarAlat: alat['gambarAlat'],
                            namaAlat: alat['namaAlat'],
                            ratingAlat: alat['ratingAlat'],
                            alamatAlat: alat['alamatAlat'],
                            deskripsiAlat: alat['deskripsiAlat'],
                            sisaAlat: alat['sisaAlat'],
                            hargaAlat: alat['hargaAlat']
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            alat['gambarAlat'],
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  alat['namaAlat'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      alat['ratingAlat'].toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue.withOpacity(0.6),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              alat['alamatAlat'],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.withOpacity(0.6),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            color: Colors.blue,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp ${alat['hargaAlat']}',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
