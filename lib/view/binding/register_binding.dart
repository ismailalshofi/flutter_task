
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/auth/register_controller.dart';

class RegisterBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }

}