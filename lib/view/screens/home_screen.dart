import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/home/home_controller.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/view/widgets/custom_app_bar.dart';
import 'package:mobile_test_task/view/widgets/option_card_widget.dart';
import 'package:mobile_test_task/view/widgets/profile_information_widget.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppText.homePageTitle,
        hasBackButton: false,
      ),
      body: Column(
        children: [
          // Profile widgte with state handler
          GetBuilder<HomeController>(
            builder: (controller) => handleState(controller),
          ),

          // SizedBox with 10 height
          10.height,

          // List of user options [change password , logout ..]
          _buildOptions(),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        // Update information
        GetBuilder<HomeController>(
          builder: (controller) => controller.obx(
            (user) => OptionCard(
              title: AppText.updatePageTitle,
              onTap: () {
                Get.toNamed(Paths.updateInformationScreen, arguments: user);
              },
            ),
            onLoading: OptionCard(
              title: AppText.updatePageTitle,
              // To prevent user from update before request completed
              onTap: () {},
            ),
          ),
        ),

        // Change password
        OptionCard(
          title: AppText.changePasswordPageTitle,
          onTap: () {
            Get.toNamed(Paths.changePasswordScreen);
          },
        ),

        // Delete account
        OptionCard(
          title: AppText.deleteAccountPageTitle,
          onTap: () {
            Get.toNamed(Paths.deleteUserScreen);
          },
        ),

        // Logout
        OptionCard(
          title: AppText.logout,
          onTap: () {
            Get.offAllNamed(Paths.landingScreen);
          },
        ),
      ],
    );
  }

  Widget handleState(HomeController controller) {
    return controller.obx(
      (state) => ProfileInformationWidget(user: state!),
      onLoading: const CircularProgressIndicator(),
    );
  }
}
