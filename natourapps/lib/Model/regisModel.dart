class RegisterUserModel {
  final String email;
  final String fullName;
  final String phoneNumber;
  final String password;
  final String role; // Tambahkan properti role

  RegisterUserModel({
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.role, // Tambahkan role ke konstruktor
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'role': role, // Sertakan role dalam map
    };
  }
}
