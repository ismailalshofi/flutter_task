import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/auth/register_controller.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/view/widgets/custom_country_code_field.dart';
import 'package:mobile_test_task/view/widgets/screen_footer_widget.dart';
import 'package:mobile_test_task/view/widgets/screen_header_widget.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //
          // App logo and welcome text
          const ScreenHeader(title: AppText.register),

          // Input fields
          _buildFormWidget(),

          // Submit button with UI state handler
          GetBuilder<RegisterController>(
            builder: (controller) => handleState(controller),
          ),

          // Navigate to LoginScreen
          _buildScreenFooter(),
        ],
      ).withWidth(MediaQuery.of(context).size.height),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      child: Column(
        children: [
          // Name text field
          CustomInputField(
            controller: Get.find<RegisterController>().fullName,
            hintText: AppText.fullName,
            prefixIcon: Icons.person,
            isPassword: false,
          ),
          //
          // Phone number text field
          CountryCodeTextField(
            hintText: AppText.phoneNumber,
            icon: Icons.phone_android,
            controller: Get.find<RegisterController>().phoneNumber,
            onChanged: (phone) {
              Get.find<RegisterController>().countryCode = phone.countryCode;
              Get.find<RegisterController>().phoneNumber.text = phone.number;
            } ,
          ),
          //
          // Email address text field
          CustomInputField(
            controller: Get.find<RegisterController>().emailAddress,
            hintText: AppText.email,
            prefixIcon: Icons.email,
            isPassword: false,
          ),
          //
          // Password text field
          CustomInputField(
            controller: Get.find<RegisterController>().password,
            hintText: AppText.password,
            prefixIcon: Icons.key,
            isPassword: true,
          ),
          //
          // Confirm password text field
          CustomInputField(
            controller: Get.find<RegisterController>().confirmPassword,
            hintText: AppText.confirmPassword,
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
          AppText.goToLogin,
          style: TextStyle(
            fontFamily: 'AlexandriaFLF',
            color: AppColors.purple,
          ),
        ),
        10.width,
        TextButton(
          onPressed: () {
            Get.offAndToNamed(Paths.loginScreen);
          },
          child: const Text(
            AppText.login,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.purple,
            ),
          ),
        ),
      ],
    );
  }

  Widget handleState(RegisterController controller) {
    return controller.obx(
      (state) => _submitButton(controller),
      onEmpty: _submitButton(controller),
      onLoading: const CircularProgressIndicator(),
    );
  }

  Widget _submitButton(RegisterController controller) {
    return CustomButton(
      onTap: () {
        controller.register();
      },
      backgroundColor: AppColors.purple,
      title: AppText.register,
      textColor: AppColors.white,
      filled: true,
    );
  }
}
