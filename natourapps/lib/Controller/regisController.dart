import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:natourapps/Model/regisModel.dart';

class RegisterUserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUser(RegisterUserModel user) async {
    try {
      // Buat akun pengguna di Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Simpan data tambahan pengguna di Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set(user.toMap());

      return 'Success'; // Mengembalikan status sukses
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email sudah terdaftar.';
      } else if (e.code == 'weak-password') {
        return 'Kata sandi terlalu lemah.';
      }
      return 'Terjadi kesalahan: ${e.message}';
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}

