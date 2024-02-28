import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/models/user_model.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';

class ProfileInformationWidget extends StatelessWidget {
  /// This widget used to display the user information in HomeScreen
  ///
  final UserModel user;
  const ProfileInformationWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Name Widget
        ListTile(
          leading: const Icon(
            Icons.person,
            color: AppColors.purple,
          ),
          title: Text(
            user.fullName,
            style: TextStyle(color: AppColors.lightBlack),
          ),
        ),
        // Phone Number Widget
        ListTile(
          leading: const Icon(
            Icons.phone_android,
            color: AppColors.purple,
          ),
          title: Text(
            '${user.countryCode} ${user.phoneNumber}',
            style: TextStyle(color: AppColors.lightBlack),
          ),
        ),
        // Email Widget
        ListTile(
          leading: const Icon(
            Icons.email,
            color: AppColors.purple,
          ),
          title: Text(
            user.email,
            style: TextStyle(color: AppColors.lightBlack),
          ),
        ),
      ],
    ).withWidth(context.width);
  }
}
