import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/detailAlat.dart';

class PilihanAlat extends StatefulWidget {
  final DateTime selectedDate;
  final int days;

  PilihanAlat({required this.selectedDate, required this.days});

  @override
  _PilihanAlatState createState() => _PilihanAlatState();
}

class _PilihanAlatState extends State<PilihanAlat> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sewa Alat",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                // TextField untuk pencarian alat
                Expanded(
                  child: TextField(
                    controller: _searchController,
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
                // Dropdown untuk lokasi
                Expanded(
                  child: TextField(
                    controller: _locationController,
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
                    setState(() {}); // Memicu pembaruan tampilan
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Tanggal : ${widget.selectedDate}', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),),
                Text('Malam : ${widget.days}', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),),
              ],
            ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collectionGroup(
                      'Detail alat') // Menggunakan Collection Group Query
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Tidak ada data alat tersedia.',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  );
                }

                final alatList = snapshot.data!.docs.where((doc) {
                  final namaAlat = doc['namaProduk']?.toString() ?? '';
                  final alamatAlat = doc['lokasi']?.toString() ?? '';
                  return namaAlat
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()) &&
                      alamatAlat
                          .toLowerCase()
                          .contains(_locationController.text.toLowerCase());
                }).toList();

                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom
                    crossAxisSpacing: 10, // Spasi antar kolom
                    mainAxisSpacing: 10, // Spasi antar baris
                  ),
                  itemCount: alatList.length,
                  itemBuilder: (context, index) {
                    final alat = alatList[index].data() as Map<String, dynamic>;
                    final double hargaTotalHari = alat['harga'] * widget.days;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailAlat(
                              namaAlat: alat['namaProduk'],
                              alamatAlat: alat['lokasi'],
                              deskripsiAlat: alat['deskripsiProduk'],
                              sisaAlat: alat['jumlahStok'],
                              hargaAlat: hargaTotalHari,
                              selectedDate: widget.selectedDate,
                              days: widget.days,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 130,
                              child: Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    alat['namaProduk'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '5.0',
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                alat['lokasi'],
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
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rp $hargaTotalHari',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '>',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
