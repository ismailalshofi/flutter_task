class RegisterModel {
  String fullName;
  String phoneNumber;
  String countryCode;
  String email;
  String password;
  String confirmPassword;

  RegisterModel({
    required this.fullName,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'phone': phoneNumber,
      'country_code': countryCode,
      'password': password,
      'password_confirm': confirmPassword,
    };
  }
}
