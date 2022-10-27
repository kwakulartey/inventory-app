import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/utils/helpers.dart';

class AddProductController extends GetxController {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _productCollection =
      _firebaseFirestore.collection("products");

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Rx<ProductDTO> _productDTO =
      Rx<ProductDTO>(ProductDTO(name: '', price: 0, lowOnStock: 0));
  ProductDTO get productDTO => _productDTO.value;

  final _validationMessages =
      RxMap<String, String?>({"name": "This field is required"});
  Map<String, String?> get validationMessages => _validationMessages;

  void setProductName(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "name", value.isEmpty ? 'This field is required' : null);
    } else {
      _productDTO(productDTO.copyWith(name: value));
    }
  }

  void setProductType(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "type", value.isEmpty ? 'This field is required' : null);
    } else {
      _productDTO(productDTO.copyWith(type: value));
    }
  }

  void setProductPrice(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "price", value.isEmpty ? 'This field is required' : null);
    } else {
      _productDTO(productDTO.copyWith(
        price: double.tryParse(value.isEmpty ? "0" : value) ?? 0,
      ));
    }
  }

  void setProductQuantity(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "quantity", value.isEmpty ? 'This field is required' : null);
    } else {
      _productDTO(productDTO.copyWith(
        quantity: double.tryParse(value.isEmpty ? "0" : value) ?? 0,
      ));
    }
  }

  void setProductUnit(String? value) {
    if (value != null) {
      validationMessages.assign(
          "unit", value.isEmpty ? 'This field is required' : null);
    } else {
      _productDTO(productDTO.copyWith(unit: value));
    }
  }

  void setProductLowOnStock(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "lowOnStock", value.isEmpty ? 'This field is required' : null);
    } else {
      _productDTO(productDTO.copyWith(
        lowOnStock: double.tryParse(value.isEmpty ? "0" : value) ?? 0,
      ));
    }
  }

  void addProductToFirestore() async {
    if (formKey.currentState!.validate()) {
      showSnackBar(message: 'Processing Data...please wait');

      await _productCollection.doc().set({
        ...productDTO.toJson(),
        "createdAt": FieldValue.serverTimestamp()
      }).then((_) {
        showSnackBar(message: "Product added successfully");
        Get.back();
      }).catchError((onError) {
        showSnackBar(message: "Something went wrong... $onError");
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        showSnackBar(
            message: "Please check your internet connection and try again");
      });
    }
    showSnackBar(message: "Please fill in the required fields");
  }
}
