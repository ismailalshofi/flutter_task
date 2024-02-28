import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error }

void showSnackBar(String title, String message, SnackbarType type) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == SnackbarType.error ? Colors.red : Colors.green,
  );
}
