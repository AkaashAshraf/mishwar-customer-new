import 'package:get/get.dart';
import 'package:gronik/controller/categories/categories_controller.dart';
import 'package:gronik/controller/dashboard/dashboard_controller.dart';

import '../../http/http.dart';
import '../../repositories/category_repository.dart';
import '../../repositories/dashboard_repository.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardRepository>(
      () => DashboardRepositoryImpl(
        Get.find<HttpClient>(),
      ),
      fenix: true,
    );
    Get.lazyPut<CategoryRepository>(
      () => CategoryRepositoryImpl(
        Get.find<HttpClient>(),
      ),
      fenix: true,
    );
    // Get.lazyPut(() => AuthRepo());

    Get.put<DashboardController>(
      DashboardController(Get.find<DashboardRepository>()
          // Get.find<AuthRepo>(),
          ),
    );
    Get.put<CategoriesController>(
      CategoriesController(Get.find<CategoryRepository>()
          // Get.find<AuthRepo>(),
          ),
    );
  }
}
