import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/products/widgets/product_action_modal.dart';

class AllProductsController extends GetxController {
  //TODO: Implement AllItemsController

  final RxList<Product> allProducts = RxList<Product>([]);

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .listen((event) {
      final source = (event.metadata.hasPendingWrites) ? "Local" : "Server";

      allProducts(
        event.docs
            .map((doc) => Product.fromJson({...doc.data(), "id": doc.id}))
            .toList(),
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

// TODO: Implement this later
  void updateProduct(Product product) {}
  void deleteProduct(Product product) {}

  void showAlertDialog({required Product product}) {
    Get.dialog(ProductActionModal(product: product));
  }
  // void increment() => count.value++;
}
