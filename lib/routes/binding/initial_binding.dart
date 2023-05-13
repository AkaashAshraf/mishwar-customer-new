import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../controller/cart/cart_controller.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../http/http.dart';
// import 'package:delivery_app_getx/core/services/gql_client.dart';
// import 'package:delivery_app_getx/core/services/http_client.dart';
// import 'package:delivery_app_getx/core/services/local_storage_get.dart';
// import 'package:delivery_app_getx/core/stores/auth_store.dart';
// import 'package:delivery_app_getx/core/stores/cart_store.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LocalStorage>(() => LocalStorageImpl());
    Get.put(NavigationController(), permanent: true);

    Get.put(CartController(), permanent: true);
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);

    // Get.put<AuthStore>(AuthStore(Get.find<LocalStorage>()), permanent: true);
    // Get.put<CartStore>(CartStore(Get.find<LocalStorage>()), permanent: true);
    // Get.put<GraphQLClient>(GraphQLClient(), permanent: true);
  }
}
