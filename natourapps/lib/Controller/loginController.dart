import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/Model/loginModel.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      // Mengautentikasi pengguna menggunakan Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Ambil data pengguna dari Firestore berdasarkan email
        DocumentSnapshot userDoc = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          return {
            'status': 'success',
            'role': userData['role'], // Role pengguna
          };
        } else {
          return {'status': 'error', 'message': 'Data pengguna tidak ditemukan'};
        }
      } else {
        return {'status': 'error', 'message': 'Email atau password salah'};
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {'status': 'error', 'message': 'Pengguna tidak ditemukan'};
      } else if (e.code == 'wrong-password') {
        return {'status': 'error', 'message': 'Kata sandi salah'};
      }
      return {'status': 'error', 'message': 'Terjadi kesalahan: ${e.message}'};
    } catch (e) {
      return {'status': 'error', 'message': 'Error: ${e.toString()}'};
    }
  }
}
