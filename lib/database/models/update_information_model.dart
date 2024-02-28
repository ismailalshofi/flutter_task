class UpdateInformationModel{
  String fullName;
  String email;
  String phone;
  String countryCode;

  UpdateInformationModel({
  required this.fullName,
  required this.email,
  required this.phone,
  required this.countryCode,
  });

  Map<String, dynamic> toJson(){
   return {
      'name': fullName,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
    };
  }
}