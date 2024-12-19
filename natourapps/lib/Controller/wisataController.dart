import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/Model/wisataMode.dart';

class WisataController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fungsi untuk menambahkan data wisata
  Future<void> addWisata(WisataModel wisata) async {
    try {
      // Mendapatkan UID pengguna yang sedang login
      String userId = _auth.currentUser!.uid;

      // Menyimpan data wisata dalam koleksi 'tempat wisata' dan sub-koleksi 'detailWisata' berdasarkan UID pengguna
      await _firestore
          .collection('tempat wisata') // Koleksi utama
          .doc(userId) // ID dokumen adalah UID pengguna
          .collection('detailWisata') // Sub-koleksi untuk setiap wisata
          .add(wisata.toMap()); // Menyimpan data wisata
      print("Data wisata berhasil ditambahkan!");
    } catch (e) {
      print("Gagal menambahkan data wisata: $e");
      throw Exception("Gagal menambahkan data wisata: $e");
    }
  }
}
