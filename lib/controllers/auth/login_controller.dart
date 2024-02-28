import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/database/models/login_model.dart';
import 'package:mobile_test_task/view/widgets/custom_snack_bar.dart';

import '../../database/local_data/shared_pref.dart';
import '../../database/repositories/login_repository.dart';
import '../../core/values/values.dart';

class LoginController extends GetxController with StateMixin {

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    //
    // Set state to Empty or Initial.
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> login() async {
    //
    // Create request model for [login] Api.
    LoginModel loginModel = LoginModel(email: emailAddress.text, password: password.text);
    //
    // Set state to Loading.
    change(null, status: RxStatus.loading());

    try {
      final value = await Get.find<LoginRepository>().login(loginModel);
      //
      // Store token in local storage.
      setValue('token', value.token);
      //
      // Store user_id to use it later in getUser Api.
      setValue('user_id', value.id);
      //
      // Set state to Success.
      change(value, status: RxStatus.success());
      //
      // Navigate to HomeScreen on success state.
      Get.offAndToNamed(Paths.homeScreen);
    } catch (e) {
      //
      // Set state to Empty or Initial.
      change(null, status: RxStatus.empty());
      showSnackBar(AppText.someError, e.toString(), SnackbarType.error);
    }
  }
}
