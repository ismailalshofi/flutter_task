import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/database/models/change_password_model.dart';
import 'package:mobile_test_task/database/repositories/change_password_repository.dart';
import 'package:mobile_test_task/core/values/values.dart';

import '../../view/widgets/custom_snack_bar.dart';

class ChangePasswordController extends GetxController with StateMixin {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  @override
  void onInit() {
    //
    // Set state to Empty or Initial.
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> changePassword() async {
    //
    // Create request model for [updat information] Api.
    ChangePasswordModel passwordModel = ChangePasswordModel(
      currentPassword: currentPassword.text,
      newPassword: newPassword.text,
      confirmNewPassword: confirmNewPassword.text,
    );

    //
    // Set state to Loading.
    change(null, status: RxStatus.loading());

    try {
      final value = await Get.find<ChangePasswordRepository>().changePassword(passwordModel);
      //
      // Set state to Success.
      change(value, status: RxStatus.success());
      //
      // Navigate back to HomeScreen.
      Get.back();
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
