import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

showErrorMessage(String message) {
  return Get.showSnackbar(
    GetSnackBar(
      duration: Duration(seconds: 2),
      message: message,
      borderColor: AppColors.APP_RED,
      backgroundColor: AppColors.APP_RED,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      borderRadius: 10,
    ),
  );
}
