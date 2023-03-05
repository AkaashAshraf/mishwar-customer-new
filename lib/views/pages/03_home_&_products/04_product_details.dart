import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../constants/app_sizes.dart';
import '../../theme/custom_paint.dart';
import '../../../constants/dummyData.dart';

import '../../../modal/food.dart';
import '../04_cart_&_checkout/01_cart.dart';
import '03_categories_details.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

/* <---- The reason this is stateful widget is because we want to 
          demonstrate how you can implement custom tab bar with custom paint
 ----> */

class ProductDetails extends StatefulWidget {
  final Food food;
  /* <---- For discount page ----> */
  final bool discountON;
  const ProductDetails({Key? key, required this.food, this.discountON = false});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool detailsToggled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /* <----------- Background Image ------------> */
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: Get.width,
                    height: Get.height * 0.4,
                    child: Image.asset(
                      '${widget.food.foodImage}',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: AppColors.APP_BLACK,
                          ),
                        ),
                      ),
                      /* <---- Discount ----> */
                      /* <---- This will show up if you are coming from discount page ----> */
                      widget.discountON
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFEB5757),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '30%',
                                style: AppText.paragraph1
                                    .copyWith(color: Colors.white),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              ),
              /* <----------- Screens ------------> */
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      /* <---- Main Container ----> */
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            // width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F5F7),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                /* <----------- Product Details ------------> */
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 24),
                                  margin: EdgeInsets.all(16),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'strawberry'.tr,
                                        style: AppText.heading1,
                                      ),
                                      AppSizes.hGap10,
                                      /* <---- Weight ----> */
                                      Text(
                                        '\$${widget.food.foodWeight}',
                                        style: TextStyle(
                                            color: AppColors.NEUTRAL_50),
                                      ),
                                      /* <---- Details ----> */
                                      AppSizes.hGap15,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          /* <---- Price ----> */
                                          Text(
                                            '\$${widget.food.foodPrice}',
                                            style: AppText.paragraph1,
                                          ),
                                          /* <---- Calories ----> */
                                          Text(
                                            '14 ' + 'calories'.tr,
                                            style: AppText.paragraph1,
                                          ),
                                          /* <---- Ratings ----> */
                                          Row(
                                            children: [
                                              Icon(Icons.star_outline_rounded),
                                              Text(
                                                '4.8',
                                                style: AppText.paragraph1,
                                              ),
                                              /* <---- Total Review ----> */
                                              Text(
                                                '(257)',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color:
                                                        AppColors.NEUTRAL_50),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      AppSizes.hGap20,
                                      /* <---- Counter ----> */
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.PRIMARY_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          AppSizes.wGap10,
                                          Text(
                                            '1 ' + 'kg'.tr,
                                            style: AppText.paragraph1.copyWith(
                                                fontSize: 14,
                                                color: AppColors.APP_BLACK),
                                          ),
                                          AppSizes.wGap10,
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.PRIMARY_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                /* <----------- Reviews And Details ------------> */
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    children: [
                                      AppSizes.hGap20,
                                      // Custom Tab Bar
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                detailsToggled = true;
                                              });
                                            },
                                            child: Text(
                                              'details'.tr,
                                              style: AppText.heading2.copyWith(
                                                  color: detailsToggled
                                                      ? null
                                                      : AppColors.NEUTRAL_50,
                                                  fontWeight: detailsToggled
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                detailsToggled = false;
                                              });
                                            },
                                            child: Container(
                                              width: 110,
                                              child: Text(
                                                'reviews'.tr,
                                                style: AppText.heading2
                                                    .copyWith(
                                                        color: detailsToggled
                                                            ? AppColors
                                                                .NEUTRAL_50
                                                            : null,
                                                        fontWeight:
                                                            detailsToggled
                                                                ? FontWeight
                                                                    .normal
                                                                : FontWeight
                                                                    .bold),
                                              ),
                                            ),
                                          ),
                                          AppSizes.wGap15,
                                        ],
                                      ),
                                      detailsToggled
                                          /* <---- Details ----> */
                                          ? _DetailsCard()
                                          :
                                          /* <---- Reviews ----> */
                                          _ReviewsCard(),
                                    ],
                                  ),
                                ),

                                /* <---- Similar Products ----> */

                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'similar_products'.tr,
                                        style: AppText.heading2.copyWith(
                                            color: AppColors.NEUTRAL_800),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SingleProduct(
                                              food: DummyData.foods[0],
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleProduct(
                                              food: DummyData.foods[1],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                                /* <---- Bottom Bar ----> */

                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '\$${widget.food.foodPrice}',
                                        style: AppText.heading2,
                                      ),
                                      /* <---- Add to cart button ----> */
                                      InkWell(
                                        onTap: () {
                                          DummyData.cartItems.add(widget.food);
                                          Get.find<CartController>()
                                              .cartItemsLength
                                              .value++;
                                          Get.offAll(CartScreen());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.PRIMARY_COLOR,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AppImages.MENU_CART,
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              AppSizes.wGap15,
                                              Text(
                                                'add_to_cart'.tr,
                                                style: AppText.paragraph1
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewsCard extends StatelessWidget {
  const _ReviewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: CustomPaint(
            painter: ReviewsCustomPaint(),
            size: Size(Get.width, Get.height * 0.15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _ProductReview(),
                    AppSizes.hGap20,
                    _ProductReview(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductReview extends StatelessWidget {
  const _ProductReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* <---- Single Reviews ----> */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* <---- Avatar with Name ----> */
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                ),
                AppSizes.wGap10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'victor_flexin'.tr,
                      style: AppText.paragraph1.copyWith(color: Colors.white),
                    ),
                    AppSizes.hGap5,
                    /* <---- Stars ----> */
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(
                            0xFFF2C94C,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(
                            0xFFF2C94C,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(
                            0xFFF2C94C,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(
                            0xFFF2C94C,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(
                            0xFFF2C94C,
                          ).withOpacity(0.6),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            /* <---- Date ----> */
            Text(
              '23 Sep, 2019',
              style: AppText.paragraph1.copyWith(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),
        AppSizes.hGap10,
        Text(
          '''The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.''',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: CustomPaint(
            painter: DetailsCustomPaint(),
            size: Size(Get.width, Get.height * 0.15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.''',
                      style: TextStyle(color: Colors.white),
                    ),
                    AppSizes.hGap10,
                    Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.''',
                      style: TextStyle(color: Colors.white),
                    ),
                    AppSizes.hGap10,
                    Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit,''',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
