class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  // Konversi data menjadi Map untuk penyimpanan di database
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Membuat UserModel dari Map untuk menerima data dari database
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      password: map['password'],
    );
  }
}
