import 'dart:developer';

import 'package:get/get.dart';
import 'package:gronik/repositories/product_repository.dart';

import '../../model/product.dart';

class CategoryDetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final ProductRepository repo;

  CategoryDetailController(this.repo);
  static CategoryDetailController get to => Get.find();

  List<Product> products = [];

  final _loading = false.obs;
  bool get loading => _loading.value;

  fetchProductByCategory(int? id) async {
    try {
      if (id == null) return;
      _loading.value = true;
      products = await repo.getProductsByCategory(id.toString());
    } catch (e) {
      log('fetchProductByCategory' + e.toString());
    } finally {
      _loading.value = false;
    }
  }
}
