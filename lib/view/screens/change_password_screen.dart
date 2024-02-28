import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/home/change_password_controller.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/view/widgets/custom_app_bar.dart';
import 'package:mobile_test_task/view/widgets/custom_button.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';

import '../../core/values/values.dart';
import '../widgets/custom_input_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppText.changePasswordPageTitle,
        hasBackButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          // current password
          CustomInputField(
            controller: Get.find<ChangePasswordController>().currentPassword,
            hintText: AppText.currentPassword,
            prefixIcon: Icons.key,
            isPassword: true,
          ),
          //
          // new password
          CustomInputField(
            controller: Get.find<ChangePasswordController>().newPassword,
            hintText: AppText.newPassword,
            prefixIcon: Icons.key,
            isPassword: true,
          ),
          //
          // confirm new password
          CustomInputField(
            controller: Get.find<ChangePasswordController>().confirmNewPassword,
            hintText: AppText.confirmPassword,
            prefixIcon: Icons.key,
            isPassword: true,
          ),
          //
          // SizedBox with 20 height
          20.height,
          //
          // submit button
          GetBuilder<ChangePasswordController>(
            builder: (controller) => handleState(controller),
          ),
        ],
      ).withWidth(context.width),
    );
  }

  Widget handleState(ChangePasswordController controller) {
    return controller.obx(
      (state) => _submitButton(controller),
      onEmpty: _submitButton(controller),
      onLoading: const CircularProgressIndicator(),
    );
  }

  Widget _submitButton(ChangePasswordController controller) {
    return CustomButton(
      onTap: () {
        controller.changePassword();
      },
      backgroundColor: AppColors.purple,
      title: AppText.save,
      textColor: AppColors.white,
      filled: true,
    );
  }
}
