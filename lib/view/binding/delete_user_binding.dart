
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/home/delete_user_controller.dart';

class DeleteUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeleteUserController());
  }

}