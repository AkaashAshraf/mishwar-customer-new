import 'package:get/get.dart';

import '../../views/pages/02_auth/06_auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthRepo());
    Get.put<AuthController>(
      AuthController(
          // Get.find<AuthRepo>(),
          ),
    );
  }
}
