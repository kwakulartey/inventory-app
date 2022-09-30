import 'package:get/get.dart';
import 'package:inventory_1/controllers/cart_controller.dart';
import 'package:inventory_1/controllers/product_controller.dart';
import 'package:inventory_1/managers/cart_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //load repository

  Get.lazyPut(() => CartRepo());

  //load controllers
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
