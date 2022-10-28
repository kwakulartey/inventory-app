import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/providers/dashboard_stats_service.dart';
import 'package:inventory_1/app/modules/admin/products/controllers/edit_product_controller.dart';
import 'package:inventory_1/app/modules/admin/products/widgets/confirm_product_delete_alert.dart';
import 'package:inventory_1/app/modules/admin/products/widgets/product_action_modal.dart';

class AllProductsController extends GetxController {
  final EditProductController editProductController =
      Get.find<EditProductController>();

  final DashboardStatsService dashboardStatsService =
      Get.find<DashboardStatsService>();

  RxList<Product> get allProducts => dashboardStatsService.allProducts;
  RxList<Product> get lowOnStockProducts =>
      dashboardStatsService.lowOnStockProducts;
  RxList<Product> get outOfStockProducts =>
      dashboardStatsService.outOfStockProducts;

  RxList<Product> productList = RxList([]);

  final RxString _pageTitle = RxString('');
  String get pageTitle => _pageTitle.value;
  set pageTitle(String value) => _pageTitle.value = value;

  @override
  void onInit() {
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
}
