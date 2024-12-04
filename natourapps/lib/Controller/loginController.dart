import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/Model/loginModel.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(String email, String password) async {
    try {
      // Mengautentikasi pengguna menggunakan Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return 'Login Berhasil'; // Berhasil login
      } else {
        return 'Email atau password salah'; // Gagal login
      }
    } on FirebaseAuthException catch (e) {
      // Menangani kesalahan Firebase Authentication
      if (e.code == 'user-not-found') {
        return 'Pengguna tidak ditemukan';
      } else if (e.code == 'wrong-password') {
        return 'Kata sandi salah';
      }
      return 'Terjadi kesalahan: ${e.message}';
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
