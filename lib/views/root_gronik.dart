import 'package:flutter/material.dart';
import '../services/intro_service.dart';
import '../utils/ui_helper.dart';
import 'pages/01_intro_screens/introductions.dart';
import 'pages/03_home_&_products/00_entrypoint.dart';

class GronikRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // init();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        AppUiHelper.dismissKeyboard(context: context);
      },
      child:
          IntroService.isIntroDone() ? AppEntryPoint() : IntroductionScreens(),
    );
  }

  // init() async {
  //   log('dfsdfsdfsd');
  //   Get.put(SharedPreferences);
  //   Get.put(ApiClient(
  //       appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  //   Get.put(LocationController());
  // }
}
