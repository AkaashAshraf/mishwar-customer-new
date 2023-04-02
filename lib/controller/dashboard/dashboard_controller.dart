import 'package:get/get.dart';
import 'package:gronik/config/api_urls.dart';
import 'package:gronik/http/http.dart';
import 'package:gronik/model/banner.dart';
import 'package:gronik/model/category.dart';
import 'package:gronik/model/dashboard.dart';
import 'package:gronik/model/product.dart';

class DashboardController extends GetxController {
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
      var response = await get(dashboardDataUrl);
      if (response != null) {
        if (response?.statusCode == 200) {
          var jsonResponse = dashboardFromJson(response?.body);
          banners(jsonResponse.banners);
          categories(jsonResponse.categories);
          products(jsonResponse.products);
        }
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading(false);
    }
  }
}
