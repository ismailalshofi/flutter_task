import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_test_task/core/values/values.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color backgroundColor;
  final String title;
  final Color textColor;
  final bool filled;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.title,
    required this.textColor,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    if (filled) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 35.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 35.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            border: Border.all(
              width: 1,
              color: AppColors.purple,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    }
  }
}
