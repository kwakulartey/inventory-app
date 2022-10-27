import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/products/controllers/edit_product_controller.dart';

import '../controllers/all_products.dart';

class AllProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(
      () => EditProductController(),
      fenix:
          true, // pheonix(fenix) is a legend about a bird that was consumed by fire but was reborn from the ashes
    );

    Get.lazyPut<AllProductsController>(
      () => AllProductsController(),
    );
  }
}
