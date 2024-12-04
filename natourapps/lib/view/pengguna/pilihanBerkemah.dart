import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/detailLokasi.dart';

class pilihanBerkemah extends StatefulWidget {
  @override
  _pilihanBerkemahState createState() => _pilihanBerkemahState();
}

class _pilihanBerkemahState extends State<pilihanBerkemah> {
  final List<Map<String, dynamic>> lokasiList = [
    {
      'gambarLokasi': 'https://www.kemenparekraf.go.id/_next/image?url=https%3A%2F%2Fapi2.kemenparekraf.go.id%2Fstorage%2Fapp%2Fuploads%2Fpublic%2F620%2Fb45%2F6e6%2F620b456e67fb4793798859.jpg&w=3840&q=75',
      'namaLokasi': 'Pantai Indah',
      'ratingLokasi': 4.5,
      'alamatLokasi': 'Jl. Pantai No. 123',
      'hargaLokasi': 150000,
      'deskripsiLokasi':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sisaArea':10
    },
    {
      'gambarLokasi': 'https://www.kemenparekraf.go.id/_next/image?url=https%3A%2F%2Fapi2.kemenparekraf.go.id%2Fstorage%2Fapp%2Fuploads%2Fpublic%2F620%2Fb45%2F6e6%2F620b456e67fb4793798859.jpg&w=3840&q=75',
      'namaLokasi': 'Gunung Agung',
      'ratingLokasi': 4.8,
      'alamatLokasi': 'Jl. Gunung Agung No. 45',
      'hargaLokasi': 200000,
      'deskripsiLokasi':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sisaArea':10
    },
    {
      'gambarLokasi': 'https://www.kemenparekraf.go.id/_next/image?url=https%3A%2F%2Fapi2.kemenparekraf.go.id%2Fstorage%2Fapp%2Fuploads%2Fpublic%2F620%2Fb45%2F6e6%2F620b456e67fb4793798859.jpg&w=3840&q=75',
      'namaLokasi': 'Taman',
      'ratingLokasi': 4.2,
      'alamatLokasi': 'Jl. Taman No. 22',
      'hargaLokasi': 100000,
      'deskripsiLokasi':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sisaArea':10
    },
    // Tambahkan lebih banyak data lokasi jika perlu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berkemah",
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
                        hintText: "Cari tempat berkemah",
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
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
                itemCount: lokasiList.length,
                itemBuilder: (context, index) {
                  final lokasi = lokasiList[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman DetailLokasi dengan data lokasi
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailLokasi(
                            gambarLokasi: lokasi['gambarLokasi'],
                            namaLokasi: lokasi['namaLokasi'],
                            ratingLokasi: lokasi['ratingLokasi'],
                            alamatLokasi: lokasi['alamatLokasi'],
                            deskripsiLokasi: lokasi['deskripsiLokasi'],
                            sisaArea: lokasi['sisaArea'],
                            hargaLokasi: lokasi['hargaLokasi']
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
                          lokasi['gambarLokasi'],
                          fit: BoxFit.cover,
                          height: 120,
                          width: double.infinity,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(
                                lokasi['namaLokasi'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              Text(
                                lokasi['ratingLokasi'].toString(),
                                style: TextStyle(fontSize: 14, color: Colors.blue
                        .withOpacity(0.6), fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            lokasi['alamatLokasi'],
                            style: TextStyle(fontSize: 12, color: Colors.blue
                        .withOpacity(0.6), fontWeight: FontWeight.w600),
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
                                  'Rp ${lokasi['hargaLokasi']}',
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
