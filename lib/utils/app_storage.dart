import 'package:get_storage/get_storage.dart';
import 'package:gronik/constants/app_constants.dart';

class AppStorage {
  static final box = GetStorage();

  static String? getLanguageCode() => box.read(AppConstants.LANGUAGE_CODE);
  static setLanguageCode(String code) =>
      box.write(AppConstants.LANGUAGE_CODE, code);

  /* <--- authentication token ---> */
  // static String? getToken() =>
}
