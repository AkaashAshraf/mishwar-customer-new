import 'package:get/get.dart';
import 'package:gronik/http/http.dart';
import 'package:gronik/repositories/auth_repoository.dart';

import '../../views/pages/02_auth/06_auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<HttpClient>()));
    Get.put<AuthController>(
      AuthController(
        Get.find<AuthRepository>(),
      ),
    );
  }
}
