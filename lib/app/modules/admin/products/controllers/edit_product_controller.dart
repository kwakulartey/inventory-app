import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';

class EditProductController extends GetxController {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();

  final Rx<Product?> _product = Rx<Product?>(null);
  Product? get product => _product.value;
  set product(Product? value) => _product.value = value;

  late Worker _worker;

  @override
  void onInit() {
    super.onInit();
    _worker = ever<Product?>(_product, (selectedProduct) {
      if (selectedProduct != null) {
        quantityController.text = "${selectedProduct.quantity ?? 0}";
        priceController.text = "${selectedProduct.price}";
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    //  TODO: Redirect if product
    print("Editcontroller Products: $product");
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  void updateProduct() {}
}
