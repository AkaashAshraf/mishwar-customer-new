import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dialogs/add_review_sheet.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../modal/food.dart';

import '04_progress_order.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../theme/text_theme.dart';

class CompletedOrderReview extends StatelessWidget {
  final Food food;

  const CompletedOrderReview({Key? key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'completed_order'.tr,
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* <---- Order Status ----> */
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        OrderStatus(
                          time: '9:30 AM',
                          label: 'order_placed'.tr,
                          description: 'your_order'.tr +
                              ' #212423 ' +
                              'was_placed_for_delivery'.tr,
                          completed: true,
                        ),
                        OrderStatus(
                          time: '9:35 AM',
                          label: 'pending'.tr,
                          description:
                              'your_order_is_pending_for_confirmation_will_confirmed_within_5_minutes'
                                  .tr,
                          completed: true,
                        ),
                        OrderStatus(
                          time: '9:45 AM',
                          label: 'confirmed'.tr,
                          description:
                              'your_order_is_confirmed_will_deliver_soon_within_20_minutes'
                                  .tr,
                          completed: true,
                        ),
                        OrderStatus(
                          time: '1:30 PM',
                          label: 'processing'.tr,
                          description:
                              'your_product_is_processing_to_deliver_you_on_time'
                                  .tr,
                          completed: true,
                        ),
                        OrderStatus(
                          time: '4:50 PM',
                          label: 'delivered'.tr,
                          description:
                              'product_deliver_to_you_and_marked_as_deliverd_by_customer'
                                  .tr,
                          completed: true,
                          lastItem: true,
                        ),
                      ],
                    ),
                  ),
                  AppSizes.hGap10,
                  /* <---- Product Description ----> */
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'description'.tr,
                          style: AppText.heading1
                              .copyWith(color: AppColors.NEUTRAL_800),
                        ),
                        Divider(),
                        // Food Details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Image.asset(
                                  '${food.foodImage}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${food.foodName}',
                                        style: AppText.paragraph1.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      AppSizes.hGap10,
                                      Text(
                                        '\$${food.foodWeight}',
                                        style: AppText.paragraph1.copyWith(
                                            color: AppColors.NEUTRAL_50),
                                      ),
                                    ],
                                  ),
                                  AppSizes.hGap10,
                                  Text(
                                    '\$${food.foodPrice} (${'paid'.tr})',
                                    style: AppText.paragraph1.copyWith(
                                        color: AppColors.PRIMARY_COLOR,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSizes.hGap10,
                  Container(
                    height: Get.height * 0.11,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: AppButton(
                      label: 'leave_a_feedback'.tr,
                      onTap: () {
                        Get.bottomSheet(
                          AddReviewSheet(),
                          isScrollControlled: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        /* <---- Bottombar ----> */
        bottomAppBar: Positioned(
          bottom: 0,
          child: SizedBox(),
        ),
      ),
    );
  }
}
