import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  // final count = 0.obs;

  final RxInt _totalProductCount = RxInt(0);
  int get totalProductCount => _totalProductCount.value;
  set totalProductCount(int value) => _totalProductCount.value = value;

  final RxInt _lowOnStockProductsCount = RxInt(0);
  int get lowOnStockProductsCount => _lowOnStockProductsCount.value;
  set lowOnStockProductsCount(int value) =>
      _lowOnStockProductsCount.value = value;

  final RxInt _outOfStockProductsCount = RxInt(0);
  int get outOfStockProductsCount => _outOfStockProductsCount.value;
  set outOfStockProductsCount(int value) =>
      _outOfStockProductsCount.value = value;

  final RxDouble _dailySales = RxDouble(0);
  double get dailySales => _dailySales.value;
  set dailySales(double value) => _dailySales.value = value;

  final RxList _recentProducts = RxList([]);
  List get recentProducts => _recentProducts.value;
  set recentProducts(List value) => _recentProducts.value = value;

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

  void gotoAccountPage() {
    // TODO(parables): Implement this navigation
  }

  void gotoTransactionHistory() {
    // TODO(parables): Implement this navigation
  }

  void gotoCreateNewItem() {
    // TODO(parables): Implement this navigation
  }

  void showProductActionModal() {
    // showDialog(
    //     barrierColor: Colors.black45,
    //     context: context,
    //     builder: (context) {
    //       return alertdialog(
    //         docId: '',
    //         label: 'Edit Item',
    //         text1: 'Delete Item',
    //         icon: Icons.edit_note_rounded,
    //         icon1: Icons.delete_outline_rounded,
    //       );
    //     });
  }
}
