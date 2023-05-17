import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/routes/routes.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '02_account_info.dart';
import '03_password.dart';
import '04_payment.dart';
import '05_address.dart';
import '06_refer.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../theme/text_theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Profile',
        content: Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* <---- Image and info ----> */
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width * 0.3,
                          child: Hero(
                            tag: 'profile',
                            child: Image.asset(AppImages.PROFILE_USER),
                          ),
                        ),
                        AppSizes.hGap15,
                        Text(
                          'Mahmudul Hasan',
                          style: AppText.heading1.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        AppSizes.hGap5,
                        Text(
                          '@mhmanik02',
                          style: TextStyle(
                            color: AppColors.NEUTRAL_50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* <---- Menu ----> */
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        /* <---- Account info ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => AccountInfoScreen());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_USER,
                            ),
                          ),
                          title: Text('account_information'.tr),
                        ),
                        Divider(),
                        /* <---- Password ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => PasswordChangeScreen());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_LOCK,
                            ),
                          ),
                          title: Text('password'.tr),
                        ),
                        Divider(),
                        /* <---- Payment Method ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => PaymentListScreen());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_CARD,
                            ),
                          ),
                          title: Text('payment_method'.tr),
                        ),
                        Divider(),
                        /* <---- Delivery Address ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => AddressList());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_MARKER,
                            ),
                          ),
                          title: Text('delivery_address'.tr),
                        ),
                        Divider(),
                        /* <---- Refer ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => ReferScreen());
                          },
                          leading: Container(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                AppImages.ICON_PROFILE_AT,
                              )),
                          title: Text('refer_friends'.tr),
                        ),
                      ],
                    ),
                  ),
                  /* <---- LogOut ----> */
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: AppButton(
                      label: 'logout'.tr,
                      onTap: () {
                        Get.offAllNamed(Routes.login);
                      },
                      color: Color(0xFFEB5757),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
