import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Validation {
  static String? validateName(String? value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return "name_is_required".tr;
    } else if (!regExp.hasMatch(value)) {
      return "the_name_must_be_a_z_and_a_z".tr;
    }
    return null;
  }

  static String? validateMobile(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return "mobile_is_required".tr;
    } else if (value.length < 8) {
      return "mobile_number_must_8_digits".tr;
    } else if (!regExp.hasMatch(value)) {
      return "mobile_number_must_be_digits".tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "password_is_required".tr;
    } else if (value.length < 6) {
      return "Password is too short";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "email_is_required".tr;
    } else if (!regExp.hasMatch(value)) {
      return "invalid_email".tr;
    } else {
      return null;
    }
  }

  static String? validateEmmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "required_field".tr;
    } else {
      return null;
    }
  }
}
