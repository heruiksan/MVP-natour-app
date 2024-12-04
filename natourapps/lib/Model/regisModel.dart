class RegisterUserModel {
  final String email;
  final String fullName;
  final String phoneNumber;
  final String password;

  RegisterUserModel({
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }
}
