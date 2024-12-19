import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:natourapps/Model/wisataMode.dart'; // Pastikan Anda menambahkan model yang telah dibuat

class listTiket extends StatefulWidget {
  final String userId; // Menambahkan userId sebagai parameter

  listTiket({required this.userId}); // Menerima userId melalui konstruktor

  @override
  _listTiketState createState() => _listTiketState();
}

class _listTiketState extends State<listTiket> {
  // Fungsi untuk mengambil stream data dari Firestore
  Stream<QuerySnapshot> getWisataStream(String userId) {
    return FirebaseFirestore.instance
        .collection('tempat wisata')
        .doc(userId)
        .collection('detailWisata')
        .snapshots();
  }

  // Fungsi untuk menghapus data dari Firestore
  Future<void> deleteWisata(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('tempat wisata')
          .doc(id)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data berhasil dihapus")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menghapus data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/profile.png'),
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              "Wisata",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getWisataStream(
            widget.userId), // Menambahkan userId sebagai parameter
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No data available"));
          }

          final items = snapshot.data!.docs.map((doc) {
            return WisataModel.fromFirestore(
                doc); // Mengonversi data ke model Wisata
          }).toList();

          return Column(
            children: [
              // Tombol Posting Baru
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Posting baru",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded untuk ListView agar diskroll
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Clicked on ${item.namaLahan}")),
                          );
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Handling gambar (null)
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                child: item.imageUrl != null &&
                                        item.imageUrl!.isNotEmpty
                                    ? Image.network(
                                        item.imageUrl!,
                                        width: 150,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        color: Colors.grey[200],
                                        width: 150,
                                        height: 130,
                                        child: Icon(Icons.image,
                                            color: Colors.grey),
                                      ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
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
                                                fontSize: 16),
                                          ),
                                          PopupMenuButton<String>(
                                            onSelected: (value) async {
                                              if (value == 'edit') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          "Edit ${item.namaLahan}")),
                                                );
                                              } else if (value == 'delete') {
                                                // Konfirmasi penghapusan
                                                bool confirmDelete =
                                                    await showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Hapus data'),
                                                      content: Text(
                                                          'Apakah Anda yakin ingin menghapus ${item.namaLahan}?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false);
                                                          },
                                                          child: Text('Batal'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true);
                                                          },
                                                          child: Text('Hapus'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                if (confirmDelete) {
                                                  await deleteWisata(
                                                      item.userId);
                                                  setState(() {
                                                    items.removeAt(index);
                                                  });
                                                }
                                              }
                                            },
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry<String>>[
                                              const PopupMenuItem<String>(
                                                value: 'edit',
                                                child: Text('Edit'),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: 'delete',
                                                child: Text('Hapus'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Rp ${item.harga}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(item.lokasi,
                                          style: TextStyle(fontSize: 12)),
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
      ),
    );
  }
}
