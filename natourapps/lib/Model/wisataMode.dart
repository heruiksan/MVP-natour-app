class WisataModel {
  final String namaLahan;
  final String deskripsi;
  final String jenisLahan;
  final String kapasitas;
  final String fasilitas;
  final double harga;
  final String lokasi;
  final String userId; 
  final String? imageUrl;

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

  // Konversi objek ke Map untuk Firestore
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
}
