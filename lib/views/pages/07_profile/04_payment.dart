import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../dialogs/add_card_sheet.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../theme/text_theme.dart';

class PaymentListScreen extends StatefulWidget {
  @override
  _PaymentListScreenState createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  bool showAddedPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GronikLayoutTwo(
        appBarTitle: 'payment_method'.tr,
        /* <---- Content ----> */
        content: Expanded(
          child: Column(
            children: [
              showAddedPayment
                  ?
                  /* <---- List of Payments ----> */
                  _ListOfPayments()
                  :
                  /* <---- Empty List of Cards ----> */
                  NoPaymentAvailable(),
              /* <---- Add a card ----> */
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: AppButton(
                  label: 'add_a_card'.tr,
                  onTap: () async {
                    showAddedPayment = await Get.bottomSheet(
                          AddACardSheet(),
                          isScrollControlled: true,
                          clipBehavior: Clip.none,
                        ) ??
                        false;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        /* <---- This is a stack ----> */
        bottomAppBar: Container(),
      ),
    );
  }
}

class _ListOfPayments extends StatelessWidget {
  const _ListOfPayments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          /* <---- Single Card ----> */
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                /* <---- header ----> */
                Row(
                  children: [
                    // Image
                    Container(
                      height: 34,
                      child: Image.asset(
                        AppImages.PAY_MASTERCARD,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    AppSizes.wGap20,
                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'master_card'.tr,
                          style: AppText.heading2,
                        ),
                        AppSizes.hGap5,
                        Text(
                          'Mahmudul Hasan',
                          style: AppText.paragraph1
                              .copyWith(color: AppColors.NEUTRAL_50),
                        ),
                      ],
                    ),
                  ],
                ),
                AppSizes.hGap5,
                Divider(),
                AppSizes.hGap5,
                /* <---- Footer ----> */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /* <---- Card Number ----> */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'card_number'.tr,
                          style: AppText.paragraph1
                              .copyWith(color: AppColors.NEUTRAL_50),
                        ),
                        AppSizes.hGap10,
                        Text('• • • •  • • • • 8637'),
                      ],
                    ),
                    /* <---- Expired ----> */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'expires'.tr,
                          style: AppText.paragraph1
                              .copyWith(color: AppColors.NEUTRAL_50),
                        ),
                        AppSizes.hGap10,
                        Text(
                          '8/24',
                          style: AppText.paragraph1.copyWith(
                              color: AppColors.PRIMARY_COLOR,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/* <---- When there is no payment saved ----> */
class NoPaymentAvailable extends StatelessWidget {
  const NoPaymentAvailable({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.6,
              child: Image.asset(AppImages.PAY_NO_CARD),
            ),
            AppSizes.hGap10,
            Text(
              'no_card'.tr,
              style: AppText.heading1.copyWith(
                color: AppColors.NEUTRAL_800,
                fontSize: 32,
              ),
            ),
            AppSizes.hGap10,
            Text(
              'it_looks_like_you_do_not_have_a_credit_or_debit_card_yet'.tr,
              style: AppText.paragraph1.copyWith(
                color: AppColors.APP_BLACK,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
