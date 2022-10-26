import 'package:get/get.dart';

import '../controllers/all_products.dart';

class AllProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProductsController>(
      () => AllProductsController(),
    );
  }
}
