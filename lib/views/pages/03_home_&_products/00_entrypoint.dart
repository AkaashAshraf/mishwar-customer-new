import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/views/widgets/menu_item.dart';
import '../../../constants/app_images.dart';
import '../../theme/custom_paint.dart';
import '../../widgets/cart_button.dart';
import '../../../controller/navigation/navigation_controller.dart';

class AppEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* <----------- Background Image ------------> */
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: Color(0xFF29AF61).withOpacity(0.8),
            ),
            child: Image.asset(
              AppImages.GRONIK_BACKGROUND,
              color: Colors.white,
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.fitWidth,
            ),
          ),
          /* <----------- Screens ------------> */
          GetBuilder<NavigationController>(
            builder: (controller) => SafeArea(
              bottom: false,
              child: PageTransitionSwitcher(
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    fillColor: Colors.transparent,
                  );
                },
                child: controller.currentScreen(),
              ),
            ),
          ),
          /* <---- Bottom Navigation Bar ----> */
          GronikBottomBar(),
        ],
      ),
    );
  }
}

// The appbar
class GronikBottomBar extends StatelessWidget {
  const GronikBottomBar({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          width: Get.width,
          height: Get.height * 0.11,
          child: AspectRatio(
            aspectRatio: 7 / 1.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: CustomPaint(
                size: Size(Get.width, Get.height * 0.11),
                painter: CustomBottomBarPaint(),
                child: Container(
                  width: Get.width,
                  height: 100,
                  child: GetBuilder<NavigationController>(
                    builder: (controller) => Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MenuItemm(
                              icon: AppImages.MENU_HOME,
                              itemName: "",
                              onTap: () {}),
                          MenuItemm(
                            icon: AppImages.MENU_HOME,
                            itemName: 'home'.tr,
                            active: controller.selectedMenu == 0,
                            onTap: () {
                              // Main Home
                              controller.updateMenu(0);
                              if (Get.currentRoute != '/AppEntryPoint') {
                                Get.to(() => AppEntryPoint());
                              }
                            },
                          ),
                          MenuItemm(
                            icon: AppImages.MENU_ORDER,
                            itemName: 'order'.tr,
                            active: controller.selectedMenu == 1,
                            onTap: () {
                              // Go to order page
                              controller.updateMenu(1);
                              if (Get.currentRoute != '/AppEntryPoint') {
                                Get.to(() => AppEntryPoint());
                              }
                            },
                          ),

                          /// THIS ONE IS FOR THE CART BUTTON
                          SizedBox(
                            width: Get.width * 0.2,
                          ),

                          /// which value is 2
                          ////////

                          MenuItemm(
                            icon: AppImages.MENU_OFFER,
                            itemName: 'offer'.tr,
                            active: controller.selectedMenu == 3,
                            onTap: () {
                              // Go to offer page
                              controller.updateMenu(3);
                              if (Get.currentRoute != '/AppEntryPoint') {
                                Get.to(() => AppEntryPoint());
                              }
                            },
                          ),
                          MenuItemm(
                            icon: AppImages.MENU_MORE,
                            itemName: 'more'.tr,
                            active: controller.selectedMenu == 4,
                            onTap: () {
                              // Go to more page
                              controller.updateMenu(4);
                              if (Get.currentRoute != '/AppEntryPoint') {
                                Get.to(() => AppEntryPoint());
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: Get.height * 0.052,
          child: CartButton(
            onTap: () {
              Get.find<NavigationController>().updateMenu(2);
              if (Get.currentRoute != '/AppEntryPoint') {
                Get.to(() => AppEntryPoint());
              }
            },
          ),
        ),
      ],
    );
  }
}
