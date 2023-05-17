import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import 'success_address_dialog.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field_custom.dart';

class AddAddressSheet extends StatelessWidget {
  const AddAddressSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          Container(
            height: 5,
            width: Get.width * 0.15,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          AppSizes.hGap20,
          Text(
            'add_an_address'.tr,
            style: AppText.heading2,
          ),
          Divider(),
          /* <---- Card Form ----> */
          GronikTextField(
            hintText: 'name_of_the_location_eg_home'.tr,
            labelText: '',
            textEditingController: null,
            marginLabelDisable: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                /* <---- Drop down ----> */
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: 'country'.tr,
                      items: [
                        DropdownMenuItem(
                          value: 'country'.tr,
                          child: Text(
                            'country'.tr,
                            style: TextStyle(color: AppColors.NEUTRAL_50),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'city_1'.tr,
                          child: Text('Dhaka'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
                AppSizes.wGap10,
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: 'city'.tr,
                      items: [
                        DropdownMenuItem(
                          value: 'city'.tr,
                          child: Text(
                            'city'.tr,
                            style: TextStyle(color: AppColors.NEUTRAL_50),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'city1'.tr,
                          child: Text('Dhaka'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          GronikTextField(
            hintText: 'address'.tr,
            labelText: '',
            textEditingController: null,
            marginLabelDisable: true,
          ),
          AppSizes.hGap20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                width: Get.width * 0.43,
                label: 'add_address'.tr,
                onTap: () {
                  /* <---- Success Pop up ----> */
                  Get.back(result: true);
                  Get.dialog(SuccessAddressDialog());
                },
              ),
              AppButtonOutline(
                width: Get.width * 0.43,
                label: 'cancel'.tr,
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
          AppSizes.hGap20,
        ],
      ),
    );
  }
}
