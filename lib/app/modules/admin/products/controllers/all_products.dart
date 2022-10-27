import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/providers/dashboard_stats_service.dart';
import 'package:inventory_1/app/modules/admin/products/controllers/edit_product_controller.dart';
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

  void onDeleteProductConfirmed(Product product) {}

  void showAlertDialog({required Product product}) {
    editProductController.product = product;
    Get.dialog(ProductActionModal(product: product));
  }
}
