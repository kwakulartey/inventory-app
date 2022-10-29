import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/data/models/order/order.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/utils/helpers.dart';

class CheckoutController extends GetxController {
  RxMap<String, BasketItem> basket = RxMap({});

  @override
  void onInit() {
    super.onInit();
  }

  void confirmOrder() {
    // STEP 1: save the order to firebase.
    saveOrder();

    // STEP 2: adjust the product collection to reduce the quanitySold
    adjustProductInventory();

    completeCheckout();
  }

  int get itemsInBasketCount => basket.keys.length;

  double getProductUnitValue(Product product) {
    return product.unit == "kilos" ? 0.5 : 1;
  }

  double getBasketItemQuantity(Product product) {
    return basket[product.id]?.quantity ?? 0;
  }

  double getSubTotal(Product product) {
    return getProductUnitValue(product) * getBasketItemQuantity(product);
  }

  double getGrandQuantity() {
    double quantity = 0.0;
    basket.forEach(
      (_, basketItem) {
        quantity += basketItem.quantity;
      },
    );
    return quantity;
  }

  double getGrandTotal() {
    double total = 0.0;
    basket.forEach(
      (_, basketItem) {
        total += basketItem.quantity * basketItem.product.price;
      },
    );
    return total;
  }

  decreaseBasketQuantity(Product product) {
    double basketQuantity = getBasketItemQuantity(product);
    double productUnitValue = getProductUnitValue(product);

    if (basketQuantity > 1) {
      basketQuantity -= productUnitValue;
      basket[product.id] =
          BasketItem(product: product, quantity: basketQuantity);
    } else {
      basket.remove(product.id);
    }
  }

  increaseBasketQuantity(Product product) {
    double basketQuantity = getBasketItemQuantity(product);
    double productUnitValue = getProductUnitValue(product);

    if (basketQuantity < (product.quantity ?? 0)) {
      basketQuantity += productUnitValue;
      basket[product.id] =
          BasketItem(product: product, quantity: basketQuantity);
    } else {
      showSnackBar(
          message: "There are only ${product.quantity ?? 0} pcs of products");
    }
  }

  void saveOrder() {
    if (basket.isEmpty) {
      Get.snackbar(
        "Empty Cart",
        "Can't proceed with empty cart",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    OrderDTO orderDTO = OrderDTO(
      orderDetails: basket,
      orderQuantity: getGrandQuantity(),
      total: getGrandTotal(),
    );
    FirebaseFirestore.instance.collection('orders').add(orderDTO.toJson());
  }

  void adjustProductInventory() {
    basket.forEach((productId, basketItem) async {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({"quantity": basketItem.quantity});
    });
  }

  void completeCheckout() {
    showSnackBar(message: "Your order been confirmed successfully");
    basket.clear();
    Get.back();
  }
}
