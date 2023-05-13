import 'package:get/get.dart';
import 'package:gronik/controller/product/product_detail_controller.dart';
import 'package:gronik/http/http.dart';

import '../../repositories/product_repository.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(Get.find<HttpClient>()));
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(
        Get.find<ProductRepository>(),
      ),
    );
  }
}
