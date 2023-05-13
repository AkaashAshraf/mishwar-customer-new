import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gronik/repositories/auth_repoository.dart';
import 'package:gronik/routes/routes.dart';

import '../../../utils/show_snack_bar.dart';
import '../03_location/pick_map_screen.dart';
import '03_password_recovery.dart';

class AuthController extends GetxController {
  final AuthRepository repo;

  AuthController(this.repo);
  static AuthController get to => Get.find();

/* <---- Text Editing controllers ----> */
  final lPhoneNumberCtr = TextEditingController();
  final lPasswordController = TextEditingController();
  final sEmailController = TextEditingController();
  final sPasswordController = TextEditingController();
  final sNameController = TextEditingController();

  String cuntryCode = '+968';
  String? verificationCode;

  /* <---- Form keys ----> */
  final lFormKey = GlobalKey<FormState>();
  final sFormKey = GlobalKey<FormState>();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  /* <---- User clicked sign in button ----> */
  onSignIn() async {
    _isLoading.value = true;
    if (!lFormKey.currentState!.validate()) return;
    final res = await repo.login(lPhoneNumberCtr.text, cuntryCode);
    _isLoading.value = false;
    if (res != null) {
      Get.toNamed(Routes.verification);
    }
  }

  /* <---- Sign up ----> */
  onSignUp() {
    if (!sFormKey.currentState!.validate()) return;
    Get.toNamed(Routes.login);
  }

  onVerify() async {
    _isLoading.value = true;
    if (verificationCode == null || verificationCode == '') {
      showErrorMessage('Please enter a verification code');
      return;
    }
    final res =
        await repo.phoneVerification(lPhoneNumberCtr.text, verificationCode!);
    _isLoading.value = false;
    if (res == null) {
      Get.toNamed(Routes.init);
    }
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
    Get.toNamed(Routes.login);
  }

  /* <---- User clicked Sign up button on login page ----> */
  navToSignUp() {
    Get.toNamed(Routes.signup);
  }
}
