import 'package:get/get.dart';
import 'package:gronik/http/http.dart';

import '../../controller/categories/category_detail_controller.dart';
import '../../repositories/product_repository.dart';

class CategoryDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(Get.find<HttpClient>()));
    Get.lazyPut<CategoryDetailController>(
      () => CategoryDetailController(
        Get.find<ProductRepository>(),
      ),
    );
  }
}
