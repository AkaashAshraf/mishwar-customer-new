import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gronik/routes/pages.dart';
import 'package:gronik/utils/app_storage.dart';
import 'package:gronik/utils/get_di.dart';
import 'package:gronik/utils/message.dart';
import 'controller/cart/cart_controller.dart';
import 'controller/navigation/navigation_controller.dart';
import 'utils/ui_helper.dart';
import 'views/root_gronik.dart';
import 'views/theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await init();
  final lang = AppStorage.getLanguageCode();
  final locale = lang == null || lang == '' || lang == 'en'
      ? const Locale('en', 'US')
      : const Locale('ar', 'OM');
  runApp(MyApp(
    languages: languages,
    locale: locale,
  ));
  AppUiHelper.autoRotateOff();
  Get.put(NavigationController());

  Get.put(CartController());
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  final Locale locale;

  const MyApp({Key? key, required this.languages, required this.locale})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ini();
    return GetMaterialApp(
      title: 'Meshwar',
      theme: AppThemes.lightGronikTheme,
      locale: locale,
      translations: Messages(languages: languages),
      home: GronikRoot(),
      getPages: Pages.getPages,
    );
  }
}
