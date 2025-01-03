import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:natourapps/Model/sewaModel.dart';
import 'package:natourapps/Model/wisataMode.dart';
import 'package:natourapps/view/adminWisata/addWisata.dart';
import 'package:natourapps/view/adminWisata/detailWisata.dart';
import 'package:natourapps/view/adminWisata/editWisata.dart';
import 'package:natourapps/view/penyewa/addAlat.dart';
import 'package:natourapps/view/penyewa/editAlat.dart';

class listTiket extends StatefulWidget {
  @override
  _listTiketState createState() => _listTiketState();
}

class _listTiketState extends State<listTiket> {
  late Future<String> userIdFuture;

  @override
  void initState() {
    super.initState();
    userIdFuture = _getUserId();
  }

  Future<String> _getUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw 'User not logged in';
    }
  }

  Stream<QuerySnapshot> _getItemsStream(String userId) {
    return FirebaseFirestore.instance
        .collection('tempat wisata')
        .doc(userId)
        .collection('detailWisata')
        .snapshots();
  }

  void _editItem(String id, WisataModel model, String userId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => editWisata(
          documentId: id, // ID dokumen Firestore
          model: model, // Model yang akan diedit
          userId: userId, // Pastikan userId dikirimkan
        ),
      ),
    );
  }

  void _deleteItem(String id, String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('tempat wisata')
          .doc(userId)
          .collection('detailWisata')
          .doc(id)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item berhasil dihapus: $id')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus item: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate screen width and scaling factor
    double screenWidth = MediaQuery.of(context).size.width;
    double scalingFactor = screenWidth / 375; // Assuming 375 is the baseline width

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Set to false to avoid default back button
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.filter_hdr_rounded,
                color: Colors.blue,
              ),
              onPressed: () {
                null;
              },
            ),
            SizedBox(width: 8 * scalingFactor), // Scale the space
            Text(
              "Lahan",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16 * scalingFactor, // Scale font size
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<String>(
        future: userIdFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData) {
            return Center(child: Text("No user data found"));
          }

          final userId = snapshot.data!;

          return StreamBuilder<QuerySnapshot>(
            stream: _getItemsStream(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text("No data available"));
              }

              final items = snapshot.data!.docs.map((doc) {
                final model = WisataModel.fromFirestore(doc);
                final id = doc.id;
                return {'model': model, 'id': id};
              }).toList();

              return Column(
                children: [
                  // Tombol Posting Baru
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16 * scalingFactor, vertical: 8 * scalingFactor),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addWisata()),
                        );
                      },
                      child: Container(
                        height: 50 * scalingFactor, // Scale the height
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5 * scalingFactor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4 * scalingFactor,
                              offset: Offset(0, 2 * scalingFactor),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.grey),
                            SizedBox(width: 8 * scalingFactor),
                            Text(
                              "Posting baru",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14 * scalingFactor, // Scale the font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Expanded untuk ListView agar diskroll
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index]['model'] as WisataModel;
                        final id = items[index]['id'] as String;

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16 * scalingFactor,
                              vertical: 8 * scalingFactor),
                          child: InkWell(
                            onTap: () {
                              // Navigasi ke halaman DetailWisata dengan documentId dan userId
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailwisata(
                                    namaLahan: item.namaLahan,
                                    deskripsi: item.deskripsi,
                                    jenisLahan: item.jenisLahan,
                                    kapasitas: item.kapasitas,
                                    fasilitas: item.fasilitas,
                                    harga: item.harga,
                                    lokasi: item.lokasi,
                                  ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(8 * scalingFactor),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8 * scalingFactor),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4 * scalingFactor,
                                    offset: Offset(0, 2 * scalingFactor),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8 * scalingFactor),
                                      bottomLeft: Radius.circular(8 * scalingFactor),
                                    ),
                                    child: (item.imageUrl != null &&
                                            item.imageUrl!.isNotEmpty)
                                        ? Image.network(
                                            item.imageUrl!,
                                            width: 150 * scalingFactor,
                                            height: 130 * scalingFactor,
                                            fit: BoxFit.cover,
                                          )
                                        : SizedBox(
                                            width: 150 * scalingFactor,
                                            height: 130 * scalingFactor,
                                            child: Center(
                                              child: Text(
                                                'No Image',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12 * scalingFactor),
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(width: 8 * scalingFactor),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8 * scalingFactor),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.namaLahan,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16 * scalingFactor),
                                              ),
                                              PopupMenuButton<String>(
                                                onSelected: (value) {
                                                  if (value == 'Edit') {
                                                    _editItem(id, item, userId);
                                                  } else if (value == 'Delete') {
                                                    _deleteItem(id, userId);
                                                  }
                                                },
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                      value: 'Edit',
                                                      child: Text('Edit')),
                                                  PopupMenuItem(
                                                      value: 'Delete',
                                                      child: Text('Delete')),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4 * scalingFactor),
                                          Text(item.kapasitas,
                                              style: TextStyle(
                                                  fontSize: 12 * scalingFactor)),
                                          Text(
                                            "Rp${item.harga}/day",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14 * scalingFactor),
                                          ),
                                          Text(item.lokasi,
                                              style: TextStyle(
                                                  fontSize: 12 * scalingFactor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
