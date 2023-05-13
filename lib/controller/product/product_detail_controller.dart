import 'package:get/get.dart';
import 'package:gronik/repositories/product_repository.dart';

import '../../model/product.dart';

class ProductDetailController extends GetxController {
  final ProductRepository repo;

  ProductDetailController(this.repo);
  static ProductDetailController get to => Get.find();

  final quantity = 0.obs;
  increaseQuantity() => quantity.value++;
  decreaseQuantity() => quantity <= 1 ? null : quantity.value--;

  final relatedLoading = false.obs;
  List<Product> relatedProducts = [];

  getRelatedProducts(int? productId) async {
    if (productId == null) return;
    final id = productId.toString();
    try {
      relatedLoading.value = true;
      relatedProducts = await repo.getRelatedProduct(id);
    } catch (e) {
    } finally {
      relatedLoading.value = false;
    }
  }
}
