import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/home/home_controller.dart';
import 'package:mobile_test_task/database/models/update_information_model.dart';
import 'package:mobile_test_task/database/repositories/update_information_repository.dart';
import 'package:mobile_test_task/models/user_model.dart';
import 'package:mobile_test_task/core/values/values.dart';

import '../../view/widgets/custom_snack_bar.dart';

class UpdateInformationController extends GetxController with StateMixin {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String countryCode = '';

  @override
  void onInit() {
    //
    // Fill the text field controllers with current user information.
    UserModel user = Get.arguments as UserModel;
    fullName.text = user.fullName;
    phoneNumber.text = user.phoneNumber;
    emailAddress.text = user.email;
    countryCode = user.countryCode;
    //
    // Set state to Empty or Initial.
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> updateInformation() async {
    //
    // Create request model for updat information Api.
    UpdateInformationModel updateModel = UpdateInformationModel(
      fullName: fullName.text,
      email: emailAddress.text,
      phone: phoneNumber.text,
      countryCode: countryCode,
    );
    //
    // Set state to loading.
    change(null, status: RxStatus.loading());

   try {
      final value = await Get.find<UpdateInformationRepository>().update(updateModel);
      //
      // Set state to Success.
      change(value, status: RxStatus.success());
      //
      // Call getUser Api from HomeController to update the screen information.
      Get.find<HomeController>().getUser();
      //
      // Navigate back to HomeScreen.
      Get.back();
      showSnackBar(value.message, '', SnackbarType.success);
    } catch (e) {
      //
      // Set state to Empty or Initial.
      change(null, status: RxStatus.empty());
      showSnackBar(AppText.someError, e.toString(), SnackbarType.error);
    }
  }
}
