import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/view/widgets/custom_button.dart';
import 'package:mobile_test_task/view/widgets/screen_footer_widget.dart';
import 'package:mobile_test_task/view/widgets/screen_header_widget.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // App logo and welcome text
          const ScreenHeader(title: AppText.welcomeText),
          // Navigation buttons to Register & Login
          Column(
            children: [
              CustomButton(
                onTap: () {
                  Get.toNamed(Paths.loginScreen);
                },
                backgroundColor: AppColors.purple,
                title: AppText.login,
                textColor: AppColors.white,
                filled: true,
              ),
              //
              // SizedBox with 20 height
              20.height,
              CustomButton(
                onTap: () {
                  Get.toNamed(Paths.registerScreen);
                },
                backgroundColor: AppColors.purple,
                title: AppText.register,
                textColor: AppColors.white,
                filled: false,
              ),
            ],
          ),
          // Copy right text
          _buildScreenFooter(),
        ],
      ).withWidth(MediaQuery.of(context).size.width),
    );
  }

  Widget _buildScreenFooter() {
    return ScreenFooter(
      children: [
        const Text(
          AppText.copyRightsText,
          style: TextStyle(
            color: AppColors.purple,
            fontFamily: 'AlexandriaFLF',
          ),
        ),
        10.width,
        const Text(
          AppText.desiger,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.purple,
          ),
        ),
      ],
    );
  }
}
