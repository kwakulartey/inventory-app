import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/order/order.dart';

class TodaySalesController extends GetxController {
  //TODO: Implement TodaySalesController

  final RxList<Order> _todaysOrders = RxList<Order>([]);
  List<Order> get todaysOrders => _todaysOrders;
  set todaysOrders(List<Order> value) => _todaysOrders.value = value;

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance.collection('orders').snapshots().listen((event) {
      _todaysOrders(
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
    });

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      super.onClose();
    }
  }
}
