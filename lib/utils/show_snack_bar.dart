import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/views/theme/text_theme.dart';

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

showSuccessMessage(String message) {
  return Get.showSnackbar(
    GetSnackBar(
      duration: Duration(seconds: 2),
      message: message,
      borderColor: AppColors.PRIMARY_COLOR,
      backgroundColor: AppColors.PRIMARY_COLOR,
      messageText: Text(
        message,
        style: AppText.paragraph1.copyWith(color: Colors.white),
      ),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      borderRadius: 10,
    ),
  );
}
