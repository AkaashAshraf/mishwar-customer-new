import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/buttons.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class ReferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Refer Friend'.tr,
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                AppSizes.hGap20,
                /* <---- Head ----> */
                Text(
                  'refer_now'.tr,
                  style: AppText.heading1,
                ),
                AppSizes.hGap20,
                /* <---- Desc ----> */
                Text(
                  'refer_your_friends_for_purchase_the_grocery_product_for_daily_life'
                      .tr,
                  style:
                      AppText.paragraph1.copyWith(color: AppColors.APP_BLACK),
                  textAlign: TextAlign.center,
                ),
                /* <---- Mail Box ----> */
                AppSizes.hGap30,
                Stack(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'mail_address'.tr),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: Get.width * 0.2,
                        margin: EdgeInsets.only(top: 0),
                        child: AppButton(
                          label: 'send'.tr,
                          onTap: null,
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSizes.hGap20,
                /* <---- Divider ----> */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 0.2,
                      color: AppColors.NEUTRAL_50,
                      height: 1,
                    ),
                    Text(
                      'or_share_via'.tr,
                      style: AppText.paragraph1.copyWith(
                        color: AppColors.NEUTRAL_50,
                      ),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      color: AppColors.NEUTRAL_50,
                      height: 1,
                    ),
                  ],
                ),
                AppSizes.hGap15,
                /* <---- Social Media Icon ----> */
                Container(
                  child: Row(
                    children: [
                      /* <---- Google ----> */
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            child: Image.asset(
                              AppImages.ICON_GOOGLE,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      /* <---- Facebook ----> */
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            child: Image.asset(
                              AppImages.ICON_FACEBOOK,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      /* <---- LinkedIn ----> */
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            child: Image.asset(
                              AppImages.ICON_LINKEDIN,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      /* <---- Copy Icon ----> */
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            child: Image.asset(
                              AppImages.ICON_REF_COPY_LINK,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                      /* <---- More ----> */
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            height: 25,
                            child: Image.asset(
                              AppImages.ICON_REF_MORE,
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        /* <---- Bottom Bar ----> */
        bottomAppBar: SizedBox(),
      ),
    );
  }
}
