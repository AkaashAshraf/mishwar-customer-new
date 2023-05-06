import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../api_client/api_client.dart';
import '../constants/app_constants.dart';
import '../controller/location/location_controller.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository

  Get.lazyPut(() => LocationController());

  Map<String, Map<String, String>> languages = {};
  String jsonStringValues =
      await rootBundle.loadString('assets/language/en.json');
  Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
  Map<String, String> json = {};
  mappedJson.forEach((key, value) {
    json[key] = value.toString();
  });
  languages['${'en'}_${'US'}'] = json;
  String jsonValues = await rootBundle.loadString('assets/language/ar.json');
  Map<String, dynamic> mappJson = jsonDecode(jsonValues);
  Map<String, String> jsonAr = {};
  mappJson.forEach((key, value) {
    jsonAr[key] = value.toString();
  });
  languages['${'ar'}_${'OM'}'] = jsonAr;
  return languages;
}
