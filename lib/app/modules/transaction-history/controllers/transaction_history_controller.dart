import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  //TODO: Implement TransactionHistoryController

  final RxList _getTransactionHistory = RxList([]);
  List get getTransactionHistory => _getTransactionHistory.value;
  set getTransactionHistory(List value) => _getTransactionHistory.value = value;

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

  void showDatePicker() {
    // showDatePicker(
    //         context: context,
    //         initialDate: DateTime.now(),
    //         firstDate: DateTime(2021),
    //         lastDate: DateTime.now().add(const Duration(days: 365)))
    //     .then((value) {
    //   setState(() {
    //     _datefromController.text = DateFormat.yMMMMd().format(value!);
    //   });
    // });
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
