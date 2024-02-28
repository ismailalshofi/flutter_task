class UserModel {
  String id;
  String fullName;
  String phoneNumber;
  String countryCode;
  String email;
  String token;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['name'],
      phoneNumber: json['phone'],
      countryCode: json['country_code'],
      email: json['email'],
      token: json['token'] ?? '',
    );
  }
}
