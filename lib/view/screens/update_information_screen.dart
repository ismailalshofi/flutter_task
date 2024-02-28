import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/home/update_information_controller.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/view/widgets/custom_app_bar.dart';
import 'package:mobile_test_task/view/widgets/custom_button.dart';
import 'package:mobile_test_task/view/widgets/custom_country_code_field.dart';
import 'package:mobile_test_task/view/widgets/custom_input_field.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';

import '../../core/values/values.dart';

class UpdateInformationScreen extends StatelessWidget {
  const UpdateInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppText.updatePageTitle,
        hasBackButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox with 10 height
          10.height,
          //
          // name text field
          CustomInputField(
            controller: Get.find<UpdateInformationController>().fullName,
            hintText: AppText.fullName,
            prefixIcon: Icons.person,
            isPassword: false,
          ),
          10.height,
          //
          // phone number text field
           CountryCodeTextField(
            hintText: AppText.phoneNumber,
            icon: Icons.phone_android,
            controller: Get.find<UpdateInformationController>().phoneNumber,
            onChanged: (phone) {
              Get.find<UpdateInformationController>().countryCode = phone.countryCode;
              Get.find<UpdateInformationController>().phoneNumber.text = phone.number;
            } ,
          ),
          //
          // email address text field
          CustomInputField(
            controller: Get.find<UpdateInformationController>().emailAddress,
            hintText: AppText.email,
            prefixIcon: Icons.email,
            isPassword: false,
          ),
          20.height,
          //
          // Submit button with state handler
          GetBuilder<UpdateInformationController>(
            builder: (controller) => handleState(controller),
          ),
        ],
      ).withWidth(context.width),
    );
  }

  Widget handleState(UpdateInformationController controller) {
    return controller.obx(
      (state) => _submitButton(controller),
      onEmpty: _submitButton(controller),
      onLoading: const CircularProgressIndicator(),
    );
  }

  Widget _submitButton(UpdateInformationController controller) {
    return CustomButton(
      onTap: () {
        controller.updateInformation();
      },
      backgroundColor: AppColors.purple,
      title: AppText.save,
      textColor: AppColors.white,
      filled: true,
    );
  }
}
