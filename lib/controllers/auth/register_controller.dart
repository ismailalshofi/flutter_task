import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/database/local_data/shared_pref.dart';
import 'package:mobile_test_task/database/models/register_model.dart';
import 'package:mobile_test_task/database/repositories/register_repository.dart';
import 'package:mobile_test_task/view/widgets/custom_snack_bar.dart';

import '../../core/values/values.dart';

class RegisterController extends GetxController with StateMixin {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String countryCode = '';
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void onInit() {
    //
    // Set state to Empty or Initial.
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> register() async {
    //
    // Create request model for [register] Api.
    RegisterModel registerModel = RegisterModel(
      fullName: fullName.text,
      phoneNumber: phoneNumber.text,
      countryCode: countryCode,
      email: emailAddress.text,
      password: password.text,
      confirmPassword: confirmPassword.text,
    );
    //
    // Set state to Loading.
    change(null, status: RxStatus.loading());

    try {
      final value = await Get.find<RegisterRepository>().register(registerModel);
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
