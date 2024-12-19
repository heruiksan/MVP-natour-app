import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:natourapps/Model/sewaModel.dart';
import 'package:natourapps/view/penyewa/addAlat.dart'; // Ensure the model is imported

class listAlatSewa extends StatefulWidget {
  @override
  _listAlatSewaState createState() => _listAlatSewaState();
}

class _listAlatSewaState extends State<listAlatSewa> {
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
        .collection('Sewa alat')
        .doc(userId)
        .collection('Detail alat')
        .snapshots();
  }

  void _editItem(String id) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Edit item: $id')));
  }

  void _deleteItem(String id, String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Sewa alat')
          .doc(userId)
          .collection('Detail alat')
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
              "Penyewaan",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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

              final items = snapshot.data!.docs
                  .map((doc) => AlatModel.fromFirestore(doc))
                  .toList();

              return Column(
                children: [
                  // Tombol Posting Baru
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addAlat()),
                        );
                      },
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
                            Icon(Icons.add, color: Colors.grey),
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
                                    content:
                                        Text("Clicked on ${item.namaProduk}")),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: (item.imageUrl != null &&
                                            item.imageUrl!.isNotEmpty)
                                        ? Image.network(
                                            item.imageUrl!,
                                            width: 150,
                                            height: 130,
                                            fit: BoxFit.cover,
                                          )
                                        : SizedBox(
                                            width: 150,
                                            height: 130,
                                            child: Center(
                                              child: Text(
                                                'No Image',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.namaProduk,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              PopupMenuButton<String>(
                                                onSelected: (value) {
                                                  if (value == 'Edit') {
                                                    _editItem(item
                                                        .userId); // Use document ID for edit
                                                  } else if (value ==
                                                      'Delete') {
                                                    _deleteItem(item.userId,
                                                        userId); // Pass userId to delete
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
                                          SizedBox(height: 4),
                                          Text(item.kapasitas,
                                              style: TextStyle(fontSize: 12)),
                                          Text(
                                            "Rp${item.harga}/day", // Assuming the price field
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
          );
        },
      ),
    );
  }
}
