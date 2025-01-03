import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:natourapps/view/adminWisata/detailWisata.dart';
import 'package:natourapps/view/pengguna/detailAlat.dart';
import 'package:natourapps/view/pengguna/detailLokasi.dart';

class PilihanBerkemah extends StatefulWidget {
  final DateTime selectedDate;
  final int days;

  PilihanBerkemah({required this.selectedDate, required this.days});

  @override
  _PilihanBerkemahState createState() => _PilihanBerkemahState();
}

class _PilihanBerkemahState extends State<PilihanBerkemah> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tempat Wisata",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Row(
              children: [
                // TextField untuk pencarian alat
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Cari Wisata",
                      hintStyle: TextStyle(
                        color: Colors.blue.withOpacity(0.6),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.03),
                          bottomLeft: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(
                            color: Colors.blue, width: screenWidth * 0.005),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.03),
                          bottomLeft: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(
                            color: Colors.blue, width: screenWidth * 0.005),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 242, 255),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.03,
                          horizontal: screenWidth * 0.04),
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
                          topRight: Radius.circular(screenWidth * 0.03),
                          bottomRight: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(
                            color: Colors.blue, width: screenWidth * 0.005),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(screenWidth * 0.03),
                          bottomRight: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(
                            color: Colors.blue, width: screenWidth * 0.005),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 242, 255),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.03,
                          horizontal: screenWidth * 0.04),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.025),
                // Tombol Cari
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Memicu pembaruan tampilan
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
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
              Text(
                'Tanggal : ${widget.selectedDate}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'Malam : ${widget.days}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collectionGroup('detailWisata')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Tidak ada data wisata tersedia.',
                      style: TextStyle(
                          color: Colors.blue, fontSize: screenWidth * 0.04),
                    ),
                  );
                }

                final alatList = snapshot.data!.docs.where((doc) {
                  final namaAlat = doc['namaLahan']?.toString() ?? '';
                  final alamatAlat = doc['lokasi']?.toString() ?? '';
                  return namaAlat
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()) &&
                      alamatAlat
                          .toLowerCase()
                          .contains(_locationController.text.toLowerCase());
                }).toList();

                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom
                    crossAxisSpacing: screenWidth * 0.025, // Spasi antar kolom
                    mainAxisSpacing: screenWidth * 0.025, // Spasi antar baris
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
                            builder: (context) => DetailLokasi(
                              namaLokasi: alat['namaLahan'],
                              alamatLokasi: alat['lokasi'],
                              deskripsiLokasi: alat['deskripsi'],
                              kapasitas: alat['kapasitas'],
                              hargaLokasi: hargaTotalHari,
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
                              width: screenWidth * 0.4,
                              height: screenWidth * 0.292,
                              child: Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: screenWidth * 0.03),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.02),
                                  child: Text(
                                    alat['namaLahan'],
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    maxLines: 1, // Maksimal satu baris
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: screenWidth * 0.045,
                                      ),
                                      SizedBox(width: screenWidth * 0.01),
                                      Text(
                                        '5.0',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            color: Colors.blue.withOpacity(0.6),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02),
                              child: Text(
                                alat['lokasi'],
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.blue.withOpacity(0.6),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              color: Colors.blue,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rp $hargaTotalHari',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '>',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.035,
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
