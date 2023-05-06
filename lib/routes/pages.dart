import 'package:get/route_manager.dart';
import 'package:gronik/routes/binding/auth_binding.dart';
import 'package:gronik/routes/routes.dart';
import 'package:gronik/views/pages/02_auth/01_sign_up.dart';
import 'package:gronik/views/pages/02_auth/02_login.dart';

class Pages {
  static List<GetPage> getPages = [
    /* <--- login page --->*/
    GetPage(
      name: Routers.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    /* <--- signup page --->*/
    GetPage(
      name: Routers.signup,
      page: () => SignUpScreen(),
    ),
  ];
}
