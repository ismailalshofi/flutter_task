import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  const ScreenHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImagePath.appLogo, width: 80.w),
        20.height,
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.purple,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
