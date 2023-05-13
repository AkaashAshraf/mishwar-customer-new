import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gronik/constants/app_colors.dart';

class ApiErrorHanlder {
  static void showError(statusCode, response, String url) {
    log('Route: $url, statusCode: $statusCode response: $response,');
    if (statusCode == 401 && url.contains('login')) {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        message: 'Credentials are not valid!',
        borderColor: AppColors.APP_RED,
        backgroundColor: AppColors.APP_RED,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        borderRadius: 10,
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Server error, Please try again!',
        borderColor: AppColors.APP_RED,
      ));
    }
  }
}
