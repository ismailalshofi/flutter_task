import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/view/widgets/custom_app_bar.dart';
import 'package:mobile_test_task/view/widgets/custom_button.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';

import '../../controllers/home/delete_user_controller.dart';
import '../../core/values/values.dart';

class DeleteUserScreen extends StatelessWidget {
  const DeleteUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppText.deleteAccountPageTitle,
        hasBackButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox with 20 height
          20.height,

          // Confirm account deleting
          Text(
            AppText.deleteAccountConfirmText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          // SizedBox with 20 height
          20.height,

          // Submit button with state handler
          GetBuilder<DeleteUserController>(
            builder: (controller) => handleState(controller),
          ),
        ],
      ).withWidth(context.width),
    );
  }

  Widget handleState(DeleteUserController controller) {
    return controller.obx(
      (state) => _submitButtons(controller),
      onEmpty: _submitButtons(controller),
      onLoading: const CircularProgressIndicator(),
    );
  }

  Widget _submitButtons(DeleteUserController controller) {
    return Column(
      children: [
        CustomButton(
          onTap: () {
            Get.back();
          },
          backgroundColor: AppColors.purple,
          title: AppText.no,
          textColor: AppColors.white,
          filled: true,
        ),
        10.height,
        CustomButton(
          onTap: () {
            controller.deleteUser();
          },
          backgroundColor: AppColors.purple,
          title: AppText.yes,
          textColor: AppColors.white,
          filled: false,
        ),
      ],
    );
  }
}
