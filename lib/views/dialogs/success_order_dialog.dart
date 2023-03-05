/* <---- Order Succesfull ----> */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/constants/app_colors.dart';
import 'package:gronik/constants/app_defaults.dart';
import 'package:gronik/constants/app_images.dart';
import 'package:gronik/constants/app_sizes.dart';
import 'package:gronik/views/widgets/buttons.dart';
import 'package:gronik/views/theme/text_theme.dart';

class SuccessOrderDialog extends StatelessWidget {
  const SuccessOrderDialog({Key? key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppDefaults.defaulBorderRadius,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: Get.height * 0.06,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* <---- Heading Image ----> */
            Container(
              width: Get.width * 0.5,
              child: Image.asset(AppImages.PAY_ORDER_SUCCESS),
            ),
            AppSizes.hGap40,
            /* <---- Header ----> */
            Text(
              'Order Successful',
              style: AppText.heading1.copyWith(color: AppColors.APP_BLACK),
            ),
            AppSizes.hGap10,
            Text(
              '''your_order_6578345_is_successfully_placed'''.tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.APP_BLACK),
            ),
            AppSizes.hGap20,
            /* <---- Confirm button ----> */
            AppButton(
              label: 'track_my_order'.tr,
              onTap: null,
            ),
            AppSizes.hGap20,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                'go_back'.tr,
                style: AppText.paragraph1.copyWith(
                  color: AppColors.PRIMARY_COLOR,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
