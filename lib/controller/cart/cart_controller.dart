import 'dart:developer';

import 'package:get/get.dart';
import 'package:gronik/model/product.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();
  final RxInt cartItemsLength = 0.obs;

  // addQuintity() {

  // }

  final Rx<List<Map<String, dynamic>>> _cartItems =
      Rx<List<Map<String, dynamic>>>([]);
  List<Map<String, dynamic>> get cartItems => _cartItems.value;

  addItem(Product product, int quantity) {
    _cartItems.value.add({'item': product, 'quantity': quantity});
    cartItemsLength.value++;
  }

  increaseQuantity(int index) {
    int q = _cartItems.value[index]['quantity'];
    q++;
    _cartItems.value[index]['quantity'] = q;
    _cartItems.refresh();
  }

  decreaseQuantity(int index) {
    int q = _cartItems.value[index]['quantity'];
    if (q <= 1) return;
    q--;
    _cartItems.value[index]['quantity'] = q;
    _cartItems.refresh();
  }

  removeItem(index) {
    _cartItems.value.removeAt(index);
    cartItemsLength.value--;
    _cartItems.refresh();
  }

  String getTotal() {
    double total = 0.0;
    for (var item in _cartItems.value) {
      Product product = item['item'];
      final quantity = item['quantity'];
      final price = product.price != null ? product.price! * quantity : 0;
      double discountPrice = 0.0;
      double taxPrice = 0.0;
      if (product.discountType == 'percent') {
        if (product.discount != null) {
          discountPrice = (product.discount! / 100) * price;
        } else {
          discountPrice = (product.discount ?? 0).toDouble();
        }
      }
      if (product.taxType == 'percent') {
        if (product.discount != null) {
          taxPrice = (product.tax! / 100) * price;
        } else {
          taxPrice = (product.tax ?? 0).toDouble();
        }
      }
      total = (total + price) + (taxPrice - discountPrice);
    }
    log(total.toString());
    update();
    return (total).toStringAsFixed(3);
  }

  // on dispose
  @override
  void dispose() {
    super.dispose();
    // cartItemsLength.close();
  }
}
