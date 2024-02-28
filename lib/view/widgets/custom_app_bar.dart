import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/values/values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final String title;

  const CustomAppBar({
    super.key,
    required this.hasBackButton,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.zero,
      child: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: hasBackButton ? true : false,
        leading: hasBackButton ? IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 16.sp),
          onPressed: () {
            Get.back();
          },
        ) : null,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 50.h);
}
