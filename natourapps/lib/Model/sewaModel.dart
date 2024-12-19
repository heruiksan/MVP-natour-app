import 'package:cloud_firestore/cloud_firestore.dart';

class AlatModel {
  String namaProduk;
  String deskripsiProduk;
  String jenisProduk;
  String kapasitas;
  int jumlahStok;
  double harga;
  String lokasi;
  String userId;
  String imageUrl;

  AlatModel({
    required this.namaProduk,
    required this.deskripsiProduk,
    required this.jenisProduk,
    required this.kapasitas,
    required this.jumlahStok,
    required this.harga,
    required this.lokasi,
    required this.userId,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'namaProduk': namaProduk,
      'deskripsiProduk': deskripsiProduk,
      'jenisProduk': jenisProduk,
      'kapasitas': kapasitas,
      'jumlahStok': jumlahStok,
      'harga': harga,
      'lokasi': lokasi,
      'userId': userId,
      'imageUrl': imageUrl,
    };
  }

  factory AlatModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AlatModel( // Dapatkan ID dokumen
      namaProduk: data['namaProduk'],
      deskripsiProduk: data['deskripsiProduk'],
      jenisProduk: data['jenisProduk'],
      kapasitas: data['kapasitas'],
      jumlahStok: data['jumlahStok'],
      harga: data['harga'],
      lokasi: data['lokasi'],
      userId: data['userId'],
      imageUrl: data['imageUrl'],
    );
  }
}
