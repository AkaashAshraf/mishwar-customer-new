import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/config/api_urls.dart';
import 'package:gronik/controller/categories/categories_controller.dart';
import 'package:gronik/controller/dashboard/dashboard_controller.dart';
import 'package:gronik/views/pages/03_home_&_products/03_categories_details.dart';
import 'package:gronik/views/widgets/categories_tile.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';

import '02_categories.dart';
import '05_search.dart';
import '../07_profile/01_profile.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  DashboardController dashboardController = Get.put(DashboardController());
  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* <---- HeadLine ----> */
                    Container(
                      width: Get.width * 0.7,
                      child: Text(
                        'hey_😊_n_let_s_search_your_grocery_food'.tr,
                        style: AppText.paragraph1.copyWith(color: Colors.white),
                      ),
                    ),
                    /* <---- Profile Image ----> */
                    InkWell(
                      onTap: () {
                        // Go to profile screen
                        Get.to(() => ProfileScreen());
                      },
                      child: Container(
                        child: Hero(
                          tag: 'profile'.tr,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AppImages.PROFILE_USER),
                            radius: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /* <---- Search Box ----> */
                // GronikTextField(
                //   onTap: () {
                //     Get.to(() => SearchScreen());
                //   },
                //   prefixIcon: Icon(
                //     Icons.search,
                //     color: AppColors.neutral50,
                //   ),
                //   hintText: 'Search your daily grocery food...',
                //   textEditingController: null,
                //   labelText: '',
                //   marginLabelDisable: true,
                // ),
                InkWell(
                  onTap: () {
                    Get.to(() => SearchScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.NEUTRAL_50,
                        ),
                        AppSizes.wGap10,
                        Text(
                          'search_your_daily_grocery_food'.tr,
                          style: AppText.placeholder1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          AppSizes.hGap20,

          /* <---- Main Container ----> */
          GetX<DashboardController>(builder: (controller) {
            return Expanded(
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F5F7),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /* <---- Categories Column ----> */
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'categories'.tr,
                                  style: AppText.heading2,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => AllCategories());
                                  },
                                  child: Text(
                                    'see_all'.tr,
                                    style: AppText.paragraph1.copyWith(
                                        color: AppColors.PRIMARY_COLOR),
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            AppSizes.hGap10,
                            /* <---- List Of Categories ----> */
                            Container(
                              height: 130,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoriesTile(
                                    category: controller.categories[index],
                                    onTap: () {
                                      Get.to(() => CategoriesDetails());
                                    },
                                  );
                                },
                                itemCount: controller.categories.length,
                              ),
                            )
                          ],
                        ),
                      ),
                      /* <---- End of Categories Column ----> */

                      /* <---- Banner ----> */
                      // Container(
                      //   padding: EdgeInsets.only(left: 10),
                      //   height: Get.height * 0.18,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: DummyData.banners.length,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         margin: EdgeInsets.symmetric(horizontal: 10),
                      //         child: Image(
                      //           image: DummyData.banners[index],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: Get.height * 0.18,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.banners.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    "${imageBaseUrl}banner/${controller.banners[index].image}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      /* <---- Popular Deals ----> */
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'popular_deals'.tr,
                                  style: AppText.heading2,
                                ),
                                Text(
                                  'see_all',
                                  style: AppText.paragraph1
                                      .copyWith(color: AppColors.PRIMARY_COLOR),
                                )
                              ],
                            ),
                            Divider(),
                            AppSizes.hGap10,
                            /* <---- All the deals ----> */
                            // Container(
                            //   height: 120,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: DummyData.deals.length,
                            //     itemBuilder: (context, index) {
                            //       return Container(
                            //         margin: EdgeInsets.symmetric(horizontal: 8),
                            //         height: 120,
                            //         child: Image(
                            //           image: DummyData.deals[index],
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            Container(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.products.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 120,
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        "${imageBaseUrl}product/${controller.products[index].image?[0]}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            AppSizes.hGap40,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
