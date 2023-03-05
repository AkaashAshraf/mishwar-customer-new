import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_defaults.dart';
import '../../constants/app_images.dart';
import '../../constants/app_sizes.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons.dart';

class SuccessAddressDialog extends StatelessWidget {
  const SuccessAddressDialog({Key? key}) : super(key: key);

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
              child: Image.asset(AppImages.PAY_ADDRESS_ADDED),
            ),
            AppSizes.hGap40,
            /* <---- Header ----> */
            Text(
              'address_added'.tr,
              style: AppText.heading1.copyWith(color: AppColors.APP_BLACK),
            ),
            AppSizes.hGap10,
            Text(
              '''your_new_address_is_successfully_added'''.tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.APP_BLACK),
            ),
            AppSizes.hGap20,
            /* <---- Confirm button ----> */
            AppButton(
              label: 'continue'.tr,
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
