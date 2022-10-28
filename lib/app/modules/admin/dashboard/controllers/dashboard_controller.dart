import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/dashboard_start/dashboard_stats.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final dashboardStats = Rx<DashboardStats>(
    DashboardStats(
      totalProductCount: 0, // add or delete a product
      lowOnStockProductsCount:
          0, // when product is bought or editted to a lower quantity
      outOfStockProductsCount:
          0, // when product is bought or editted to a lower quantity such that quantity ==0
      dailySales: 0, // when an order is confirmed
    ),
  );

  final RxList _recentProducts = RxList([]);
  List get recentProducts => _recentProducts;
  set recentProducts(List value) => _recentProducts.value = value;

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance
        .collection('dashboard')
        .doc('stats')
        .snapshots()
        .listen(
      (event) {
        var json = event.data();
        if (json != null) {
          dashboardStats(DashboardStats.fromJson(json));
        }
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

  void handleSignOut() async {
    await _firebaseAuth.signOut();
    Get.off(Routes.LOGIN);
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
