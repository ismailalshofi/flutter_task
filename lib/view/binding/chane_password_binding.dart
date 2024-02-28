

import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/home/change_password_controller.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}