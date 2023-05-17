import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/constants/app_constants.dart';
import 'package:gronik/model/product.dart';
import 'package:gronik/views/widgets/custome_image_view.dart';
import '../../../constants/app_images.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../controller/navigation/navigation_controller.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '02_checkout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class CartScreen extends StatelessWidget {
  final bool fromBottom;

  const CartScreen({Key? key, required this.fromBottom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ctr = CartController.to;
    return Scaffold(
      body: Container(
        child: GronikLayoutTwo(
          appBarTitle: 'cart'.tr,
          backButtonFunction: () {
            log(fromBottom.toString());
            if (fromBottom)
              Get.find<NavigationController>().getBackPrevScreen();
            else
              Get.back();
          },

          /* <----------- Content ------------> */
          content: Expanded(
            child: Column(
              children: [
                /* <---- Cart List ----> */
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        ctr.cartItemsLength.value == 0
                            ? Expanded(
                                child: EmptyCart(),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: ctr.cartItemsLength.value,
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                        key: UniqueKey(),
                                        onDismissed: (direction) {
                                          ctr.removeItem(index);
                                        },
                                        background: DisMissBackground(),
                                        child: Obx(
                                          () => SingleProductHorizontal(
                                            food: ctr.cartItems[index]['item'],
                                            quantity: ctr.cartItems[index]
                                                ['quantity'],
                                            onIncrease: () => CartController.to
                                                .increaseQuantity(index),
                                            onDecrease: () => CartController.to
                                                .decreaseQuantity(index),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                        AppSizes.hGap40,
                        AppSizes.hGap10,
                      ],
                    ),
                  ),
                ),
                /* <---- Total Money ----> */
                Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total'.tr + ': \$30',
                        style: AppText.heading2,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'checkout'.tr,
                              style: AppText.paragraph1
                                  .copyWith(color: Colors.white),
                            ),
                            AppSizes.wGap10,
                            Icon(
                              Icons.double_arrow_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /* <----------- Bottom Bar ------------> */
          bottomAppBar: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9F7EF),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              'total'.tr + ': \$${ctr.getTotal()}',
                              style: AppText.heading2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // User clicked on checkout
                              Get.to(() => CheckoutScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'checkout'.tr,
                                    style: AppText.paragraph1
                                        .copyWith(color: Colors.white),
                                  ),
                                  AppSizes.wGap10,
                                  Icon(
                                    Icons.double_arrow_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // GronikBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.EMPTY_CART),
          Text('cart_is_empty'.tr),
        ],
      ),
    );
  }
}

/* <---- DisMiss Background ----> */

class DisMissBackground extends StatelessWidget {
  const DisMissBackground({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          AppImages.ICON_TRASH,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}

/* <---- How a Single product will look like in cart ----> */
class SingleProductHorizontal extends StatelessWidget {
  const SingleProductHorizontal({
    Key? key,
    required this.food,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  final Product food;
  final int quantity;
  final Function() onIncrease;
  final Function() onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF4F5F7),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: CustomImageView(
                '${food.image?[0]}',
                type: AppConstants.PRODUCT_IMG,
              ),
            ),
          ),
          /* <---- Food Details ----> */
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${food.name}',
                      style: AppText.paragraph1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    AppSizes.hGap10,
                    Text(
                      '\$${food.price} - ${food.capacity}${food.unit}',
                      style: AppText.paragraph1
                          .copyWith(color: AppColors.NEUTRAL_50),
                    ),
                  ],
                ),
                AppSizes.hGap10,
                Text(
                  '\$${food.price != null ? food.price! * quantity : 0}',
                  style: AppText.paragraph1.copyWith(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          /* <---- Counter ----> */
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onIncrease,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
                AppSizes.hGap5,
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '${quantity.toString().padLeft(2, '0')}',
                    style: AppText.paragraph1
                        .copyWith(fontSize: 14, color: Colors.white),
                  ),
                ),
                AppSizes.hGap5,
                InkWell(
                  onTap: onDecrease,
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
