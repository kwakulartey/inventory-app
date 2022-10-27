import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/app/data/models/dashboard_start/dashboard_stats.dart';
import 'package:inventory_1/app/data/models/order/order.dart';
import 'package:inventory_1/app/data/models/product/product.dart';

class DashboardStatsService extends GetxService {
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

  final RxList<Product> allProducts = RxList<Product>([]);
  final RxList<Product> lowOnStockProducts = RxList<Product>([]);
  final RxList<Product> outOfStockProducts = RxList<Product>([]);
  final RxList<Order> todaysOrders = RxList<Order>([]);

  @override
  DashboardStatsService onInit() {
    super.onInit();

    // A listenert to update product stats
    FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .listen((event) {
      // STEP 1: set allProduct List
      allProducts(
        event.docs
            .map((doc) => Product.fromJson({...doc.data(), "id": doc.id}))
            .toList(),
      );

      // STEP 2: set the stats
      setTotalProductCount();
      setLowOnStockProductsCount();
      setOutOfStockProductsCount();
      updateDashbaordStats();
    });

// a listener to update the dailySales stats
    FirebaseFirestore.instance.collection('orders').snapshots().listen((event) {
      // STEP 1: set allorders List
      todaysOrders(
        event.docs
            .map((doc) => Order.fromJson({...doc.data(), "id": doc.id}))
            .where((Order order) {
          Timestamp? createdAt = order.createdAt;

          if (createdAt != null) {
            int year = createdAt.toDate().year;
            int month = createdAt.toDate().month;
            int day = createdAt.toDate().day;
            return DateTime.utc(year, month, day).weekday ==
                DateTime.now().weekday;
          }
          return false;
        }).toList(),
      );

      // STEP 2: set the stats
      setDailySales();
      updateDashbaordStats();
    });

    return this;
  }

  void setTotalProductCount() {
    dashboardStats(
        dashboardStats.value.copyWith(totalProductCount: allProducts.length));
  }

  void setLowOnStockProductsCount() {
    lowOnStockProducts(
      allProducts
          .where((product) => ((product.quantity ?? 0) <= product.lowOnStock))
          .toList(),
    );

    dashboardStats(dashboardStats.value
        .copyWith(lowOnStockProductsCount: lowOnStockProducts.length));
  }

  void setOutOfStockProductsCount() {
    outOfStockProducts(
      allProducts.where((product) => ((product.quantity ?? 0) == 0)).toList(),
    );

    dashboardStats(dashboardStats.value
        .copyWith(outOfStockProductsCount: outOfStockProducts.length));
  }

  void setDailySales() {
    double dailySales = 0;

    for (Order order in todaysOrders) {
      dailySales += order.total;
    }

    dashboardStats(dashboardStats.value.copyWith(dailySales: dailySales));
  }

  void updateDashbaordStats() {
    print("dashboard stats updated: ${dashboardStats.toJson()}");

    FirebaseFirestore.instance
        .collection('dashboard')
        .doc('stats')
        .update(dashboardStats.toJson());
  }
}
