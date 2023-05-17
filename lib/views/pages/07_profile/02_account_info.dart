import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import '../../widgets/buttons.dart';

class AccountInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'account_information'.tr,
        content: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GronikTextField(
                          labelText: 'name'.tr,
                          textEditingController: null,
                        ),
                        GronikTextField(
                          labelText: 'username'.tr,
                          textEditingController: null,
                        ),
                        GronikTextField(
                          labelText: 'email_address'.tr,
                          textEditingController: null,
                          textInputType: TextInputType.emailAddress,
                        ),
                        GronikTextField(
                          labelText: 'phone_number'.tr,
                          textEditingController: null,
                          textInputType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: AppButton(
                  label: 'save_changes'.tr,
                  onTap: null,
                ),
              ),
            ],
          ),
        ),
        bottomAppBar: SizedBox(),
      ),
    );
  }
}
