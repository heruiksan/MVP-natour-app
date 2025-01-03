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
    double screenWidth = MediaQuery.of(context).size.width;

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
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Row(
              children: [
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
                          topLeft: Radius.circular(screenWidth * 0.03),
                          bottomLeft: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.03),
                          bottomLeft: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 242, 255),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.03,
                        horizontal: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
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
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(screenWidth * 0.03),
                          bottomRight: Radius.circular(screenWidth * 0.03),
                        ),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 242, 255),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.03,
                        horizontal: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: screenWidth * 0.035,
                ),
              ),
              Text(
                'Malam : ${widget.days}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collectionGroup('Detail alat')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Tidak ada data alat tersedia.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: screenWidth * 0.04,
                      ),
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
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenWidth * 0.02,
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
                              width: screenWidth * 0.4,
                              height: screenWidth * 0.292,
                              child: Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: screenWidth * 0.02),
                              child: Text(
                                alat['namaProduk'],
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
                              child: Text(
                                alat['lokasi'],
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.blue.withOpacity(0.6),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.blue,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp $hargaTotalHari',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
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
