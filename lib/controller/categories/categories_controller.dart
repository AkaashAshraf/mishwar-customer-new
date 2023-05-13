import 'dart:developer';

import 'package:get/get.dart';
import 'package:gronik/model/category.dart';
import 'package:gronik/repositories/category_repository.dart';

class CategoriesController extends GetxController {
  final CategoryRepository repo;
  CategoriesController(this.repo);
  RxBool loading = false.obs;

  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    loading.close();
    categories.close();
  }

  fetchData() async {
    try {
      loading(true);
      categories.value = await repo.fetchCategories();
    } catch (e) {
      log(e.toString());
    } finally {
      loading(false);
    }
  }
}
