import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/cart/cart_controller.dart';
import 'controller/navigation/navigation_controller.dart';
import 'utils/ui_helper.dart';
import 'views/root_gronik.dart';
import 'views/theme/theme.dart';
import 'package:get/get.dart';
import 'utils/get_di.dart' as di;

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
  AppUiHelper.autoRotateOff();
  Get.put(NavigationController());

  Get.put(CartController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ini();
    return GetMaterialApp(
      title: 'Meshwar',
      theme: AppThemes.lightGronikTheme,
      home: GronikRoot(),
    );
  }

  // ini() async {
  //   final prfs = await SharedPreferences.getInstance();
  //   Get.put(
  //       ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: prfs));
  //   Get.put(LocationController());
  // }
}
