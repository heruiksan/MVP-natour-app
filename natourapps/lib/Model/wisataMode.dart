import 'package:cloud_firestore/cloud_firestore.dart';

class WisataModel {
  final String namaLahan;
  final String deskripsi;
  final String jenisLahan;
  final String kapasitas;
  final String fasilitas;
  final double harga;
  final String lokasi;
  final String? imageUrl;
  final String userId;

  WisataModel({
    required this.namaLahan,
    required this.deskripsi,
    required this.jenisLahan,
    required this.kapasitas,
    required this.fasilitas,
    required this.harga,
    required this.lokasi,
    required this.userId,
    this.imageUrl,
  });

  // Mengonversi objek ke Map untuk Firestore
  Map<String, dynamic> toMap() {
    return {
      'namaLahan': namaLahan,
      'deskripsi': deskripsi,
      'jenisLahan': jenisLahan,
      'kapasitas': kapasitas,
      'fasilitas': fasilitas,
      'harga': harga,
      'lokasi': lokasi,
      'userId': userId,
      'imageUrl': imageUrl,
    };
  }

  // Mengonversi data Firestore ke objek WisataModel
  factory WisataModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WisataModel(
      namaLahan: data['namaLahan'] ?? '',
      deskripsi: data['deskripsi'] ?? '',
      jenisLahan: data['jenisLahan'] ?? '',
      kapasitas: data['kapasitas'] ?? '',
      fasilitas: data['fasilitas'] ?? '',
      harga: data['harga'] is double
          ? data['harga']
          : double.tryParse(data['harga'].toString()) ??
              0.0, // Pastikan harga dalam bentuk double
      lokasi: data['lokasi'] ?? '',
      userId: data['userId'] ?? '',
      imageUrl: data['imageUrl'] ?? '', // imageUrl bisa kosong
    );
  }
}
