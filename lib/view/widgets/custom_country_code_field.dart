import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobile_test_task/core/values/values.dart';

class CountryCodeTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final Function(PhoneNumber) onChanged;

  const CountryCodeTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 280.w,
      child: IntlPhoneField(
        showCountryFlag: true,
        showDropdownIcon: false,
        showCursor: false,
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
            icon,
            color: AppColors.iconColor,
            size: 15.sp,
          ),
          alignLabelWithHint: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.iconColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        initialCountryCode: 'AE',
        onChanged: onChanged,
      ),
    );
  }
}
