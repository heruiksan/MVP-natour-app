class AlatModel {
  final String namaProduk;
  final String deskripsiProduk;
  final String jenisProduk;
  final String kapasitas;
  final int jumlahStok;
  final String lokasi;
  final double harga;
  final String userId; 
  final String? imageUrl;

  AlatModel({
    required this.namaProduk,
    required this.deskripsiProduk,
    required this.jenisProduk,
    required this.kapasitas,
    required this.jumlahStok,
    required this.lokasi,
    required this.harga,
    required this.userId,
    this.imageUrl,
  });

  // Method untuk mengonversi model ke map
  Map<String, dynamic> toMap() {
    return {
      'namaProduk': namaProduk,
      'deskripsiProduk': deskripsiProduk,
      'jenisProduk': jenisProduk,
      'kapasitas': kapasitas,
      'jumlahStok': jumlahStok,
      'lokasi': lokasi,
      'harga': harga,
      'userId': userId,
      'imageUrl': imageUrl,
    };
  }

}
