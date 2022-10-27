import 'package:get/get.dart';

import '../controllers/today_sales_controller.dart';

class TodaySalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodaySalesController>(
      () => TodaySalesController(),
    );
  }
}
