import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/modules/admin/products/controllers/edit_product_controller.dart';
import 'package:inventory_1/app/modules/admin/products/widgets/product_action_modal.dart';

class AllProductsController extends GetxController {
  final EditProductController editProductController =
      Get.find<EditProductController>();

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      productStreamSubscription;

  final RxList<Product> allProducts = RxList<Product>([]);
  final RxList<Product> lowOnStockProducts = RxList<Product>([]);
  final RxList<Product> outOfStockProducts = RxList<Product>([]);
  final RxList<Product> productList = RxList([]);

  final RxString _pageTitle = RxString('');
  String get pageTitle => _pageTitle.value;
  set pageTitle(String value) => _pageTitle.value = value;

  @override
  void onInit() {
    // A listenert to update product stats
    productStreamSubscription =
        FirebaseFirestore.instance.collection('products').snapshots().listen(
      (event) {
        // STEP 1: set allProduct List
        allProducts(
          event.docs
              .map((doc) => Product.fromJson({...doc.data(), "id": doc.id}))
              .toList(),
        );

        // STEP 2: set the stats
        setLowOnStockProducts();
        setOutOfStockProducts();
      },
      onError: (err) {
        print("Product Stream error: $err");
      },
      onDone: () {
        print("Product Stream is done");
      },
    );

    String? q = Get.parameters['q'];

    pageTitle = q?.replaceAll("-", " ").capitalize ?? 'All Products';

    print("query products q: $q");

    if (q == 'low-on-stock') {
      productList(lowOnStockProducts);
    } else if (q == 'out-of-stock') {
      productList(outOfStockProducts);
    } else {
      productList(allProducts);
    }

    super.onInit();
  }

  void setLowOnStockProducts() {
    lowOnStockProducts(
      allProducts
          .where((product) => product.quantity <= product.lowOnStock)
          .toList(),
    );
  }

  void setOutOfStockProducts() {
    outOfStockProducts(
      allProducts.where((product) => product.quantity == 0).toList(),
    );
  }

  void onDeleteProductConfirmed(Product product) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .delete()
        .then((_) {
      Get.back();
      Get.back();
      Get.snackbar("Success", "Product was deleted successfully");
    });
  }

  void showAlertDialog({required Product product}) {
    editProductController.product = product;
    Get.dialog(ProductActionModal(product: product));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
