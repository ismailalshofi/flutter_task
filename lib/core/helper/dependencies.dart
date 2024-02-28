import 'package:get/get.dart';
import 'package:mobile_test_task/database/repositories/change_password_repository.dart';
import 'package:mobile_test_task/database/repositories/delete_user_repository.dart';
import 'package:mobile_test_task/database/repositories/get_user_repository.dart';
import 'package:mobile_test_task/database/network/network_service.dart';
import 'package:mobile_test_task/database/repositories/login_repository.dart';
import 'package:mobile_test_task/database/repositories/register_repository.dart';
import 'package:mobile_test_task/database/repositories/update_information_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This function init the dependencies of
//
// local data source
//
// Remote data source
//
// Api repository

late SharedPreferences sharedPreferences;

Future<void> init() async {
  //
  // Remote data source
  //
  Get.put(NetworkService(), permanent: true);
  //
  // Local data source
  //
  sharedPreferences = await SharedPreferences.getInstance();
  //
  // Api repositories
  //
  Get.put(LoginRepository(), permanent: true);
  Get.put(RegisterRepository(), permanent: true);
  Get.put(UpdateInformationRepository(), permanent: true);
  Get.put(GetUserRepository(), permanent: true);
  Get.put(ChangePasswordRepository(), permanent: true);
  Get.put(DeleteUserRepository(), permanent: true);
}
