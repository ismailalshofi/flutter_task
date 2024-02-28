import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_test_task/core/extensions/widget_extensions.dart';
import 'package:mobile_test_task/core/values/values.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.iconColor,
          ),
        ),
        filled: true,
        fillColor: AppColors.white,
        constraints: BoxConstraints(maxHeight: 40.h, maxWidth: 280.w),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.iconColor,
          size: 15.sp,
        ),
        suffixIcon: isPassword
            ? Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.iconColor,
                size: 15.sp,
              )
            : null,
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.iconColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    ).paddingSymmetric(vertical: 5.h);
  }
}
