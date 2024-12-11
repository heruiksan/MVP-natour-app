import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/Model/sewaModel.dart';
import 'package:natourapps/view/penyewa/addAlat.dart';

class Sewacontroller {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fungsi untuk menambahkan data wisata
  Future<void> addsewaAlat(AlatModel sewaAlat) async {
    try {
      // Mendapatkan UID pengguna yang sedang login
      String userId = _auth.currentUser!.uid;

      // Menyimpan data wisata dalam koleksi 'wisata' dan sub-koleksi 'detailWisata' berdasarkan UID pengguna
      await _firestore
          .collection('Sewa alat') // Koleksi utama
          .doc(userId) // ID dokumen adalah UID pengguna
          .collection('Detail alat') // Sub-koleksi untuk setiap wisata
          .add(sewaAlat.toMap()); // Menyimpan data wisata

      print("Data wisata berhasil ditambahkan!");
    } catch (e) {
      throw Exception("Gagal menambahkan data wisata: $e");
    }
  }
}
