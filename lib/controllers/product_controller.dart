import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/controllers/cart_controller.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/models/cart_model.dart';
import 'package:inventory_1/models/product.dart';

class ProductController extends GetxController {
  // final ProductManager productManager;
  ProductController();

  List<dynamic> _productsList = [];
  List<dynamic> get productList => _productsList;
  late CartController _cart;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem;

  // Future<void> getProductList() async {
  //   Stream<QuerySnapshot<Map<String, dynamic>?>> response =
  //       await productManager.getAllProducts();
  //   _productsList = [];
  //   _productsList.addAll(Product.fromDocumentSnapshot(doc).)
  // }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar("Product Count", "Can't be below zero",
          backgroundColor: Colors.blue, colorText: Colors.white);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItem + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(Product product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(Product product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print('the id is ' +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
