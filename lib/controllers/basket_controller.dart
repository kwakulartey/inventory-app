import 'package:get/get.dart';
import 'package:inventory_1/models/basket_model.dart';

class BasketController extends GetxController {
  RxMap<String, BasketItem> basket = RxMap({});
}
