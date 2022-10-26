import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/app/data/models/order/order.dart';

class TransactionHistoryController extends GetxController {
  final TextEditingController fromDateTextEditingController =
      TextEditingController();
  final TextEditingController toDateTextEditingController =
      TextEditingController();

  final RxList _filteredOrders = RxList([]);
  List get filteredOrders => _filteredOrders.value;
  set filteredOrders(List value) => _filteredOrders.value = value;

  final Rx<DateTime> _filterFromDate = Rx<DateTime>(DateTime.now());
  DateTime get filterFromDate => _filterFromDate.value;
  set filterFromDate(DateTime value) => _filterFromDate.value = value;

  final Rx<DateTime> _fitlrerToDate = Rx<DateTime>(DateTime.now());
  DateTime get filterToDate => _fitlrerToDate.value;
  set filterToDate(DateTime value) => _fitlrerToDate.value = value;

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance.collection('orders').snapshots().listen((event) {
      final source = (event.metadata.hasPendingWrites) ? "Local" : "Server";

      print("Orders History: ${event.docs}");

      _filteredOrders(
        event.docs.map((doc) {
          Order order = Order.fromJson({...doc.data(), "id": doc.id});
          print("Order: ${order.toJson()}");
          return order;
        }).toList(),
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openDatePicker({bool setFromDate = false}) {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now().add(const Duration(days: 365 * 30)))
        .then((value) {
      if (value != null) {
        if (setFromDate == true) {
          fromDateTextEditingController.text =
              DateFormat.yMMMMd().format(value);
          filterFromDate = value;
        } else {
          toDateTextEditingController.text = DateFormat.yMMMMd().format(value);
          filterToDate = value;
        }
      }
    });
  }

  void filterOrders() {
    print(
        "Filtering from: ${fromDateTextEditingController.text} to: ${toDateTextEditingController.text}");
    // if (value!.isEmpty) {
    //   return 'Please select a Date';
    // }
    // if (value == DateFormat.yMMMMd().format(DateTime.now())) {
    //   return 'You selected today\'s date';
    // }
  }
  // void increment() => count.value++;
}
