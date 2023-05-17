import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../theme/text_theme.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'FAQs',
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSizes.hGap10,
                  QuestionAndAnswer(
                    question:
                        'how_do_i_order_grocery_from_this_mobile_application'
                            .tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
                  ),
                  QuestionAndAnswer(
                    question: 'are_the_prices_different_than_at_the_shop'.tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
                  ),
                  QuestionAndAnswer(
                    question:
                        'what_if_the_restaurant_has_changed_its_prices'.tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
                  ),
                  QuestionAndAnswer(
                    question: 'when_are_you_getting_more_shop_as_partners'.tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
                  ),
                  QuestionAndAnswer(
                    question:
                        'how_can_i_put_special_requests_on_my_online_order'.tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
                  ),
                  QuestionAndAnswer(
                    question:
                        'who_do_i_call_if_there_is_a_mistake_with_my_order'.tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
                  ),
                  QuestionAndAnswer(
                    question:
                        'who_do_i_call_if_there_is_a_mistake_with_my_order'.tr,
                    answer:
                        'you_can_pay_with_a_credit_card_or_via_net_banking_if_you_re_in_united_states_we_will_renew_your_subscription_automatically_at_the_end_of_every_billing_cycle'
                            .tr,
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

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({
    Key? key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  _QuestionAndAnswerState createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  bool isContainerExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              isContainerExpanded = !isContainerExpanded;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.question}',
                      style: AppText.paragraph1.copyWith(
                        color: AppColors.APP_BLACK,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.APP_BLACK),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isContainerExpanded ? Icons.remove : Icons.add,
                    ),
                  ),
                ],
              ),
              isContainerExpanded
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              '${widget.answer}',
                              style: AppText.paragraph1.copyWith(
                                color: Color(0xFF5A7184),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
