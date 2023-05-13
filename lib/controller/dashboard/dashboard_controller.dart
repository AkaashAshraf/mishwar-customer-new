import 'package:get/get.dart';
import 'package:gronik/model/banner.dart';
import 'package:gronik/model/category.dart';
import 'package:gronik/model/dashboard.dart';
import 'package:gronik/model/product.dart';
import 'package:gronik/repositories/dashboard_repository.dart';

class DashboardController extends GetxController {
  final DashboardRepository repo;
  DashboardController(this.repo);
  static DashboardController get to => Get.find();
  RxBool loading = false.obs;
  RxList<Banner> banners = <Banner>[].obs;
  RxList<Category> categories = <Category>[].obs;
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    loading.close();
    banners.close();
    categories.close();
    products.close();
  }

  fetchData() async {
    try {
      loading(true);
      Dashboard dasboardData = await repo.fetchData();

      banners(dasboardData.banners);
      categories(dasboardData.categories);
      products(dasboardData.products);
    } catch (e) {
      print(e.toString());
    } finally {
      loading(false);
    }
  }
}
