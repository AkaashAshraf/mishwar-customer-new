import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:gronik/controller/product/search_product_controller.dart';
import 'package:gronik/routes/routes.dart';
import 'package:gronik/views/widgets/empty_view.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/loading_bar.dart';

import '03_categories_details.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctr = SearchProductController.to;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            /* <----------- Background Image ------------> */
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(0xFF29AF61).withOpacity(0.8),
              ),
              child: Image.asset(
                AppImages.GRONIK_BACKGROUND,
                color: Colors.white,
                fit: BoxFit.fitWidth,
              ),
            ),
            /* <----------- Screens ------------> */
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  /* <----- Appbar -----> */
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'search'.tr,
                              style: AppText.heading1
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(),
                          ],
                        ),
                        /* <---- Search Box ----> */
                        AppSizes.hGap30,
                        TextField(
                          controller: ctr.searchTextCtr,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.NEUTRAL_50,
                            ),
                            hintText: 'apple'.tr,
                            labelText: 'search_your_daily_grocery_food'.tr,
                          ),
                          onSubmitted: (text) => ctr.getSearch(),
                          onChanged: (text) => ctr.getSearch(),
                        )
                      ],
                    ),
                  ),
                  AppSizes.hGap20,

                  /* <---- Main Container ----> */
                  Expanded(
                    child: _ResultView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GetX<SearchProductController>(builder: (ctr) {
        return ctr.loading
            ? LoadingBar()
            : Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /* <---- Content ----> */
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /* <---- Filter By ----> */
                          Row(
                            children: [
                              Text(
                                'filter_by'.tr,
                                style: AppText.paragraph1.copyWith(
                                  color: AppColors.NEUTRAL_50,
                                ),
                              ),
                              AppSizes.wGap10,
                              DropdownButton<String>(
                                underline: SizedBox(),
                                value: 'low',
                                items: [
                                  DropdownMenuItem(
                                    value: 'low'.tr,
                                    child: Text('lowest_price'.tr),
                                  ),
                                  DropdownMenuItem(
                                    value: 'high',
                                    child: Text('highest_price'.tr),
                                  )
                                ],
                                onChanged: (value) {},
                              )
                            ],
                          ),
                          /* <---- Total Results ----> */
                          Text(
                            '${ctr.totalResults} ' + 'results'.tr,
                            style: AppText.paragraph1.copyWith(
                              color: AppColors.NEUTRAL_50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      //<--- check list is empty or not --->
                      child: ctr.searchProducts.isEmpty
                          ? EmptyView()
                          : StaggeredGridView.countBuilder(
                              crossAxisCount: 4,
                              itemBuilder: (context, index) {
                                return SingleProduct(
                                  onTap: () {
                                    Get.toNamed(Routes.prodcutDetails,
                                        arguments: ctr.searchProducts[index]);
                                  },
                                  food: ctr.searchProducts[index],
                                );
                              },
                              staggeredTileBuilder: (ti) =>
                                  StaggeredTile.fit(2),
                              itemCount: ctr.searchProducts.length,
                            ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
