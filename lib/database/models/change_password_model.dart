class ChangePasswordModel{
  String currentPassword;
  String newPassword;
  String confirmNewPassword;

  ChangePasswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmNewPassword
  });

  Map<String, String> toJson(){
    return {
      'current_password' : currentPassword,
      'password' : newPassword,
      'password_confirm' : confirmNewPassword,
    };
  }
}