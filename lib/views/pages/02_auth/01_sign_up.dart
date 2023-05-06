import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/utils/validations.dart';
import 'package:gronik/views/pages/02_auth/06_auth_controller.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import '../../theme/text_theme.dart';

class SignUpScreen extends StatelessWidget {
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
                  'sign_up'.tr,
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'sign_up_with_your_email_and_password_to_continue'.tr,
                  style: AppText.paragraph1,
                  textAlign: TextAlign.center,
                ),
                AppSizes.hGap40,
                /* <---- Form ----> */
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: ctr.sFormKey,
                      child: Column(
                        children: [
                          GronikTextField(
                            labelText: 'name'.tr,
                            hintText: 'enter_your_full_name'.tr,
                            textEditingController: ctr.sNameController,
                            validator: Validation.validateName,
                          ),
                          AppSizes.hGap20,
                          GronikTextField(
                            labelText: 'email',
                            hintText: 'enter_your_email'.tr,
                            textInputType: TextInputType.emailAddress,
                            textEditingController: ctr.sEmailController,
                            validator: Validation.validateEmail,
                          ),
                          AppSizes.hGap20,
                          GronikTextField(
                            labelText: 'password',
                            hintText: 'enter_a_password',
                            isItPassWordBox: true,
                            textEditingController: ctr.sPasswordController,
                            validator: Validation.validatePassword,
                          ),
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
        padding: EdgeInsets.symmetric(vertical: 10),
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
              onPressed: ctr.onSignUp,
              child: Container(
                width: Get.width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'sign_up'.tr,
                  style: AppText.paragraph1.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AppSizes.hGap10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('already_have_an_account'.tr),
                AppSizes.wGap10,
                InkWell(
                  onTap: ctr.navToSignIn,
                  child: Text(
                    'sign_in'.tr,
                    style: AppText.paragraph1
                        .copyWith(color: AppColors.PRIMARY_COLOR, fontSize: 14),
                  ),
                )
              ],
            ),
            AppSizes.hGap20,
          ],
        ),
      ),
    );
  }
}
