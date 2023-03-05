import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../views/widgets/categories_tile.dart';
import '../../views/pages/03_home_&_products/03_categories_details.dart';

class CategoriesController {
  /// FETCH CART FROM SERVICES
  static List<CategoriesTile> categories = [
    CategoriesTile(
      categoryName: 'vegetables'.tr,
      imageLocation: AppImages.CATEGORY_VEGETABLES,
      onTap: () {
        // Go to categories details page
        Get.to(() => CategoriesDetails());
      },
    ),
    CategoriesTile(
      categoryName: 'fruits'.tr,
      imageLocation: AppImages.CATEGORY_FRUITS,
      onTap: () {
        // Go to categories details page
        Get.to(() => CategoriesDetails());
      },
    ),
    CategoriesTile(
      categoryName: 'meat'.tr,
      imageLocation: AppImages.CATEGORY_MEAT,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'milk_and_egg'.tr,
      imageLocation: AppImages.CATEGORY_MILK_EGG,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'fish'.tr,
      imageLocation: AppImages.CATEGORY_FISH,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'drinks'.tr,
      imageLocation: AppImages.CATEGORY_DRINKS,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'seafood'.tr,
      imageLocation: AppImages.CATEGORY_SEA_FOODS,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'cake'.tr,
      imageLocation: AppImages.CATEGORY_CAKE,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'bbakery'.tr,
      imageLocation: AppImages.CATEGORY_BAKERY,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'biscuits'.tr,
      imageLocation: AppImages.CATEGORY_BISCUITS,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'ice_cream'.tr,
      imageLocation: AppImages.CATEGORY_ICE_CREAM,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'juice'.tr,
      imageLocation: AppImages.CATEGORY_JUICE,
      onTap: null,
    ),
  ];
}
