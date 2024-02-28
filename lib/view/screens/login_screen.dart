import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/auth/login_controller.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/view/widgets/custom_button.dart';
import 'package:mobile_test_task/view/widgets/screen_footer_widget.dart';
import 'package:mobile_test_task/view/widgets/screen_header_widget.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';

import '../widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // App logo and screen title
          const ScreenHeader(title: AppText.login),

          // Input fields
          _buildFormWidget(),

          // Submit button with UI state handler
          GetBuilder<LoginController>(
            builder: (controller) => handleState(controller),
          ),

          // Navigate to RegisterScreen
          _buildScreenFooter()
        ],
      ).withWidth(context.width),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      child: Column(
        children: [
          //
          // Email address text field
          CustomInputField(
            controller: Get.find<LoginController>().emailAddress,
            hintText: AppText.email,
            prefixIcon: Icons.email,
            isPassword: false,
          ),
          10.height,
          //
          // Password text field
          CustomInputField(
            controller: Get.find<LoginController>().password,
            hintText: AppText.password,
            prefixIcon: Icons.key,
            isPassword: true,
          ),
        ],
      ),
    );
  }

  Widget _buildScreenFooter() {
    return ScreenFooter(
      children: [
        const Text(
          AppText.goToRegister,
          style: TextStyle(
            color: AppColors.purple,
            fontFamily: 'AlexandriaFLF',
          ),
        ),
        10.width,
        TextButton(
          onPressed: () {
            Get.offAndToNamed(Paths.registerScreen);
          },
          child: const Text(
            AppText.register,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.purple,
            ),
          ),
        )
      ],
    );
  }

  Widget handleState(LoginController controller) {
    return controller.obx(
      (state) => _submitButton(controller),
      onEmpty: _submitButton(controller),
      onLoading: const CircularProgressIndicator(),
    );
  }

  Widget _submitButton(LoginController controller) {
    return CustomButton(
      onTap: () {
        controller.login();
      },
      backgroundColor: AppColors.purple,
      title: AppText.login,
      textColor: AppColors.white,
      filled: true,
    );
  }
}
