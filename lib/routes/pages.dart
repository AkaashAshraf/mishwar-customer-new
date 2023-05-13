import 'package:get/route_manager.dart';
import 'package:gronik/routes/binding/auth_binding.dart';
import 'package:gronik/routes/routes.dart';
import 'package:gronik/views/pages/02_auth/01_sign_up.dart';
import 'package:gronik/views/pages/02_auth/02_login.dart';
import 'package:gronik/views/pages/03_home_&_products/04_product_details.dart';
import 'package:gronik/views/pages/03_home_&_products/05_search.dart';

import '../views/pages/02_auth/04_verification.dart';
import '../views/pages/03_home_&_products/00_entrypoint.dart';
import '../views/pages/03_home_&_products/03_categories_details.dart';
import '../views/root_gronik.dart';
import 'binding/category_details_binding.dart';
import 'binding/dashboard_binding.dart';
import 'binding/product_details_binding.dart';
import 'binding/search_binding.dart';

class Pages {
  static List<GetPage> getPages = [
    /* <--- login page --->*/
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    /* <--- signup page --->*/
    GetPage(
      name: Routes.signup,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => AppEntryPoint(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.init,
      page: () => GronikRoot(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.verification,
      page: () => VerificationScreen(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.prodcutDetails,
      page: () => ProductDetails(food: Get.arguments),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: Routes.categoryDetails,
      page: () => CategoriesDetails(category: Get.arguments),
      binding: CategoryDetailBinding(),
    ),
  ];
}
