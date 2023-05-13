import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gronik/model/product.dart';
import 'package:gronik/repositories/product_repository.dart';

class SearchProductController extends GetxController {
  final ProductRepository repo;

  SearchProductController(this.repo);
  static SearchProductController get to => Get.find();

  final searchTextCtr = TextEditingController();

  List<Product> searchProducts = [];
  int totalResults = 0;
  final _loading = false.obs;
  bool get loading => _loading.value;
  @override
  void onInit() {
    super.onInit();
  }

  getSearch() async {
    try {
      _loading.value = true;
      if (searchTextCtr.text != '') {
        final searchModel = await repo.searchProduct(searchTextCtr.text);
        if (searchModel != null) {
          searchProducts = searchModel.products ?? [];
          totalResults = searchModel.totalSize ?? 0;
          log(totalResults.toString());
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      _loading.value = false;
    }
  }
}
