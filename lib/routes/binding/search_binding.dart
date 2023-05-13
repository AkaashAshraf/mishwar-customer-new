import 'package:get/get.dart';
import 'package:gronik/http/http.dart';

import '../../controller/product/search_product_controller.dart';
import '../../repositories/product_repository.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(Get.find<HttpClient>()));
    Get.lazyPut<SearchProductController>(
      () => SearchProductController(
        Get.find<ProductRepository>(),
      ),
    );
  }
}
