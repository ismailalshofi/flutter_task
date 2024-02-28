

import 'package:get/get.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/database/repositories/delete_user_repository.dart';
import 'package:mobile_test_task/core/values/values.dart';

import '../../view/widgets/custom_snack_bar.dart';

class DeleteUserController extends GetxController with StateMixin {

  @override
  void onInit() {
    //
    // Set state to Empty or Initial.
    change(null, status: RxStatus.empty());
    super.onInit();
  }

   Future<void> deleteUser() async {
    //
    // Set state to Loading.
    change(null, status: RxStatus.loading());

    try {
      final value = await Get.find<DeleteUserRepository>().deleteUser();
      //
      // Set state to Success.
      change(value, status: RxStatus.success());
      //
      // Navigate out to LandingScreen.
      Get.offAndToNamed(Paths.landingScreen);
      //
      showSnackBar(value.message, '', SnackbarType.success);
    } catch (e) {
      //
      // Set state to Empty or Initial.
      change(null, status: RxStatus.empty());
      showSnackBar(AppText.someError, e.toString(), SnackbarType.error);
    }
  }
}