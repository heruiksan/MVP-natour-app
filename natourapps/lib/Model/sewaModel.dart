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
  String? imageUrl;

  AlatModel({
    required this.namaProduk,
    required this.deskripsiProduk,
    required this.jenisProduk,
    required this.kapasitas,
    required this.jumlahStok,
    required this.harga,
    required this.lokasi,
    required this.userId,
    this.imageUrl,
  });

  // Mengonversi objek ke Map untuk Firestore
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

  // Mengonversi data Firestore ke objek AlatModel
  factory AlatModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AlatModel(
      namaProduk: data['namaProduk'] ?? '',
      deskripsiProduk: data['deskripsiProduk'] ?? '',
      jenisProduk: data['jenisProduk'] ?? '',
      kapasitas: data['kapasitas'] ?? '',
      jumlahStok: data['jumlahStok'] is int
          ? data['jumlahStok']
          : int.tryParse(data['jumlahStok'].toString()) ?? 0, // Pastikan int
      harga: data['harga'] is double
          ? data['harga']
          : double.tryParse(data['harga'].toString()) ?? 0.0, // Pastikan double
      lokasi: data['lokasi'] ?? '',
      userId: data['userId'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
