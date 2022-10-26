import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionHistoryController extends GetxController {
  final TextEditingController fromDateTextEditingController =
      TextEditingController();
  final TextEditingController toDateTextEditingController =
      TextEditingController();

  final RxList _getTransactionHistory = RxList([]);
  List get getTransactionHistory => _getTransactionHistory.value;
  set getTransactionHistory(List value) => _getTransactionHistory.value = value;

  final Rx<DateTime> _filterFromDate = Rx<DateTime>(DateTime.now());
  DateTime get filterFromDate => _filterFromDate.value;
  set filterFromDate(DateTime value) => _filterFromDate.value = value;

  final Rx<DateTime> _fitlrerToDate = Rx<DateTime>(DateTime.now());
  DateTime get filterToDate => _fitlrerToDate.value;
  set filterToDate(DateTime value) => _fitlrerToDate.value = value;

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

  void openDatePicker({bool setFromDate = false}) {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now().add(const Duration(days: 365 * 30)))
        .then((value) {
      if (value != null) {
        if (setFromDate == true) {
          fromDateTextEditingController.text = "$value";
          filterFromDate = value;
        } else {
          toDateTextEditingController.text = "$value";
          filterToDate = value;
        }
      }
    });
  }

  void validateDateFields() {
    // if (value!.isEmpty) {
    //   return 'Please select a Date';
    // }
    // if (value == DateFormat.yMMMMd().format(DateTime.now())) {
    //   return 'You selected today\'s date';
    // }
  }
  // void increment() => count.value++;
}
