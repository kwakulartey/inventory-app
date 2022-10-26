import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';

class AddProductController extends GetxController {
  //TODO: Implement CreateNewItemController
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _productCollection =
      _firebaseFirestore.collection("products");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> addProductToFirestore(ProductDTO product) async {
    bool result = false;

    await _productCollection.doc().set({
      "name": product.name,
      "type": product.type,
      "price": product.price,
      "quantity": product.quantity,
      "unit": product.unit,
      "lowOnStock": product.lowOnStock,
      "createdAt": FieldValue.serverTimestamp()
    }).then((_) {
      result = true;
      Get.snackbar('Success', "Item created successfully");
      Get.back();
    }).catchError((onError) {
      result = false;
      Get.snackbar('Error', "$onError");
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      result = false;
      Get.snackbar('Internet Error', "Please check your connection");
    });
    return result;
  }
}
