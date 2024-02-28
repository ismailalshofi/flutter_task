
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/auth/login_controller.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}