import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/views/pages/02_auth/06_auth_controller.dart';
import '../../../constants/app_sizes.dart';
import '../../../utils/validations.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctr = AuthController.to;
    return Scaffold(
      body: GronikLayoutOne(
        /* <----------- Content ------------> */
        content: Expanded(
          child: Container(
            margin: EdgeInsets.all(16),
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSizes.hGap40,
                Text(
                  'sign_in'.tr,
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'already_have_an_account_sign_in_with_your_email_and_password_to_continue'
                      .tr,
                  style: AppText.paragraph1,
                  textAlign: TextAlign.center,
                ),
                AppSizes.hGap40,
                /* <---- Form ----> */
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: ctr.lFormKey,
                      child: Column(
                        children: [
                          GronikTextField(
                            labelText: 'email_phone_number'.tr,
                            hintText: 'enter_email_or_phone_number'.tr,
                            textInputType: TextInputType.emailAddress,
                            textEditingController: ctr.lEmailController,
                            validator: Validation.validateEmail,
                          ),
                          AppSizes.hGap20,
                          GronikTextField(
                            labelText: 'password'.tr,
                            hintText: 'enter_a_password'.tr,
                            isItPassWordBox: true,
                            textEditingController: ctr.lPasswordController,
                            validator: Validation.validatePassword,
                          ),
                          AppSizes.hGap15,
                          /* <---- Remember me ----> */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Container(
                              //       width: 20,
                              //       height: 20,
                              //       decoration: BoxDecoration(
                              //         border: Border.all(
                              //           width: 1,
                              //           color: AppColors.NEUTRAL_50,
                              //         ),
                              //         borderRadius: BorderRadius.circular(5),
                              //       ),
                              //     ),
                              //     AppSizes.wGap5,
                              //     Text(
                              //       'remember_me'.tr,
                              //       style: AppText.paragraph1
                              //           .copyWith(color: AppColors.NEUTRAL_50),
                              //     ),
                              //   ],
                              // ),
                              InkWell(
                                onTap: ctr.onForgotPass,
                                child: Text(
                                  'forgot_password'.tr,
                                  style: AppText.paragraph1.copyWith(
                                      color: AppColors.APP_RED, fontSize: 14),
                                ),
                              )
                            ],
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
        /* <----------- Bottom Bar ------------> */
        bottomBar: SizedBox(),
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: ctr.onSignIn,
              child: Container(
                width: Get.width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'sign_in'.tr,
                  style: AppText.paragraph1.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AppSizes.hGap10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('don_t_have_any_account'.tr),
                AppSizes.wGap10,
                InkWell(
                  onTap: ctr.navToSignUp,
                  child: Text(
                    'Sign up',
                    style: AppText.paragraph1
                        .copyWith(color: AppColors.PRIMARY_COLOR, fontSize: 14),
                  ),
                )
              ],
            ),
            SizedBox(height: 2),
            InkWell(
              onTap: ctr.onCuntinueAsGuest,
              child: Text(
                'continue_as_guest'.tr,
                style: AppText.paragraph1
                    .copyWith(color: AppColors.PRIMARY_COLOR, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
