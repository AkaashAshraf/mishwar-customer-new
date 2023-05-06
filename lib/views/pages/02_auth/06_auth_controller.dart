import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gronik/routes/routes.dart';

import '../03_home_&_products/00_entrypoint.dart';
import '../03_location/pick_map_screen.dart';
import '03_password_recovery.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

/* <---- Text Editing controllers ----> */
  final lEmailController = TextEditingController();
  final lPasswordController = TextEditingController();
  final sEmailController = TextEditingController();
  final sPasswordController = TextEditingController();
  final sNameController = TextEditingController();

  /* <---- Form keys ----> */
  final lFormKey = GlobalKey<FormState>();
  final sFormKey = GlobalKey<FormState>();

  /* <---- User clicked sign in button ----> */
  onSignIn() {
    if (!lFormKey.currentState!.validate()) return;
    Get.to(() => AppEntryPoint());
  }

  /* <---- Sign up ----> */
  onSignUp() {
    if (!sFormKey.currentState!.validate()) return;
    Get.toNamed(Routers.login);
  }

  /* <---- User clicked forget password button ----> */
  onForgotPass() {
    Get.to(() => PasswordRecovery());
  }

  /* <---- User clicked cuntinue as gest button ----> */
  onCuntinueAsGuest() {
    Get.to(() => PickMapScreen(
          fromSignUp: true,
          // fromHome: false,
          route: '',
          fromAddAddress: false,
          canRoute: false,
        ));
  }

  /* <---- Sign in on signup page ----> */
  navToSignIn() {
    Get.toNamed(Routers.login);
  }

  /* <---- User clicked Sign up button on login page ----> */
  navToSignUp() {
    Get.toNamed(Routers.signup);
  }
}
