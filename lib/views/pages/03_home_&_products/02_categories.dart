import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/controller/categories/categories_controller.dart';
import 'package:gronik/views/pages/03_home_&_products/03_categories_details.dart';
import 'package:gronik/views/widgets/categories_tile.dart';
import '../../widgets/gronik_layout.dart';
import '00_entrypoint.dart';

class AllCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<CategoriesController>(builder: (controller) {
        return GronikLayoutTwo(
          appBarTitle: 'categories'.tr,
          /* <---- Content ----> */
          content: Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: controller.categories
                          .map(
                            (element) => CategoriesTile(
                              category: element,
                              onTap: () {
                                // Go to categories details page
                                Get.to(() => CategoriesDetails());
                              },
                            ),
                          )
                          .toList(),
                      // crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /* <---- Bottom AppBar ----> */
          bottomAppBar: GronikBottomBar(),
        );
      }),
    );
  }
}
