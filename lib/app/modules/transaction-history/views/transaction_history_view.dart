import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/order/order.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  TransactionHistoryView({Key? key}) : super(key: key);

  final TextEditingController _datefromController = TextEditingController();
  final TextEditingController _datetoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10, vertical: Dimensions.height20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: TextFormField(
                        onTap: () {
                          controller.showDatePicker();
                        },
                        keyboardType: TextInputType.none,
                        showCursor: false,
                        controller: _datefromController,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 1,
                        decoration: InputDecoration(
                            label: const Text('Set Date From'),
                            labelStyle: TextStyle(fontSize: Dimensions.font16),
                            hintText: 'Set Date From',
                            hintStyle: TextStyle(fontSize: Dimensions.font16),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: Dimensions.width10 / 10))),
                        validator: (value) {})),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Expanded(
                    child: TextFormField(
                        onTap: () {
                          controller.showDatePicker();
                        },
                        keyboardType: TextInputType.none,
                        showCursor: false,
                        controller: _datetoController,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 1,
                        decoration: InputDecoration(
                            label: const Text('Set Date To'),
                            labelStyle: TextStyle(fontSize: Dimensions.font16),
                            hintText: 'Set Date To',
                            hintStyle: TextStyle(fontSize: Dimensions.font16),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: Dimensions.width10 / 10))),
                        validator: (value) {
                          controller.validateDateFields();
                        })),
                Expanded(
                    child: TextButton(
                  child: const Text("Search"),
                  onPressed: () async {},
                ))
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: controller.getTransactionHistory.length,
                itemBuilder: (context, index) {
                  // var date = snapshot.data?.docs[index].data()?['createdAt'];
                  // date.toDate();
                  // var newDate =
                  //     DateFormat.yMEd().add_jm().format(date.toDate());

                  // for (var i = 0;
                  //     i <=
                  //         snapshot.data?.docs[index]
                  //             .data()?['orderDetails'];
                  //     i++) {
                  //   var productID = snapshot.data?.docs[index]
                  //       .data()?['orderDetails'][i]['id'];
                  //   print(productID);
                  // }
                  // var productID;

                  // for (var element in snapshot.data?.docs[index]
                  //     .data()?['orderDetails']) {
                  //   for (var i = 0; i < element.length; i++) {
                  //     productID = snapshot.data?.docs[index]
                  //         .data()?['orderDetails'][i]['id'];
                  //   }
                  // }

                  //TODO:get the right data from the controller
                  var docID = controller.getTransactionHistory[index].id;
                  var data = controller.getTransactionHistory[index];

                  if (data != null) {
                    // print(
                    //     "*** 127: @index: $index Product.fromJson() $data");
                    Order order = Order.fromJson({...data, 'id': docID});

                    // print(
                    //     "*** 133: @index: $index Product.toJson() ${product.toJson()}");

                    return Container(
                      height: Dimensions.height20 * 10,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15 - 5)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              right: Dimensions.width10,
                              left: Dimensions.width20,
                            ),
                            child: Container(
                                height: Dimensions.height20 * 2,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: Dimensions.width10 / 10,
                                            color: Colors.grey))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Item(s)',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          showBarModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return ListView.builder(
                                                    itemCount: order
                                                        .orderDetails.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      var entry = order
                                                          .orderDetails.entries
                                                          .elementAt(index);

                                                      return ListTile(
                                                        title: Text(
                                                          entry.value.product
                                                              .name,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .font16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        subtitle: Text(
                                                          'Quantity: ${entry.value.quantity}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .font16),
                                                        ),
                                                        trailing: Text(
                                                          'GHC ${entry.value.product.price}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .font16),
                                                        ),
                                                      );
                                                    });
                                              });
                                        },
                                        child: Text(
                                          'View details',
                                          style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 10, 86, 148)),
                                        ))
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                right: Dimensions.width10,
                                left: Dimensions.width20),
                            child: Container(
                                height: Dimensions.height20,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: Dimensions.width10 / 10,
                                            color: Colors.grey))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Quantity Sold',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${order.orderQuantity}',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                right: Dimensions.width10,
                                left: Dimensions.width20),
                            child: Container(
                                height: Dimensions.height20,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: Dimensions.width10 / 10,
                                            color: Colors.grey))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'GHC ${order.total}',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                right: Dimensions.width10,
                                left: Dimensions.width20),
                            child: Container(
                              height: Dimensions.height20,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '',
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
                                  ),
                                ],
                              ),
                              // decoration: BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(
                              //             width: Dimensions.width10 / 10,
                              //             color: Colors.grey)))
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text("");
                },
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: Dimensions.height10,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}