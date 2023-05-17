import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/views/pages/02_auth/06_auth_controller.dart';
import 'package:pinput/pinput.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class VerificationScreen extends StatelessWidget {
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
                  'verification'.tr,
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'we_have_sent_code_to_your_number'.tr,
                  style: AppText.paragraph1,
                  textAlign: TextAlign.center,
                ),
                AppSizes.hGap10,
                /* <---- Number ----> */
                Text(
                  '(${ctr.cuntryCode}) ' + ctr.lPhoneNumberCtr.text,
                  style: AppText.paragraph1
                      .copyWith(color: AppColors.PRIMARY_COLOR),
                ),
                AppSizes.hGap40,
                /* <---- Verification ----> */
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /* <---- OTP ----> */
                        /* <---- You can use this plugin here ----> */
                        // PinCodeTextField(
                        //   appContext: context,
                        //   length: 4,
                        //   onChanged: (String value) {},
                        //   controller: null,
                        //   cursorColor: AppColors.primaryColor,
                        //   AppColors.backgroundColor: AppColors.bgGreen,
                        //   showCursor: false,
                        // ),
                        _buldOTPTextField(),
                        /* <---- Didn't Recieve Code ----> */
                        AppSizes.hGap20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('didn_t_receive_code'.tr),
                            AppSizes.wGap10,
                            Text(
                              'resend'.tr,
                              style: AppText.paragraph1.copyWith(
                                  color: AppColors.PRIMARY_COLOR, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                /* <----------- Small Notes ------------> */
                // Container(
                //   margin: EdgeInsets.only(bottom: 30),
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(5),
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: AppColors.APP_GREEN,
                //         ),
                //         child: Icon(
                //           Icons.check_box,
                //           color: AppColors.PRIMARY_COLOR,
                //         ),
                //       ),
                //       AppSizes.wGap10,
                //       Expanded(
                //         child: Text(
                //           'Verification codes are only sent to the registered phone number',
                //           style: TextStyle(
                //             fontSize: 12,
                //             color: AppColors.NEUTRAL_50,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
        /* <----------- BottomBar ------------> */
        bottomBar: Container(
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
            children: [
              TextButton(
                onPressed: () => ctr.onVerify(),
                child: Container(
                  width: Get.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'continue'.tr,
                    style: AppText.paragraph1.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buldOTPTextField() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.PRIMARY_COLOR),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      separator: AppSizes.wGap15,
      onCompleted: (pin) => AuthController.to.verificationCode = pin,
    );
  }
}
