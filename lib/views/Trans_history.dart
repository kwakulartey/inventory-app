import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/utils/dimmension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TransHistory extends StatefulWidget {
  TransHistory({Key? key}) : super(key: key);

  @override
  State<TransHistory> createState() => _TransHistoryState();
}

class _TransHistoryState extends State<TransHistory> {
  final ProductManager _manager = ProductManager();

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
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
            stream: _manager.getTransaction(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.data == null) {
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 365)))
                                    .then((value) {
                                  setState(() {
                                    _datefromController.text =
                                        DateFormat.yMMMMd().format(value!);
                                  });
                                });
                              },
                              controller: _datefromController,
                              textCapitalization: TextCapitalization.sentences,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  label: const Text('Set Date From'),
                                  labelStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  hintText: 'Set Date From',
                                  hintStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: Dimensions.width10 / 10))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please select a Date';
                                }
                                if (value ==
                                    DateFormat.yMMMMd()
                                        .format(DateTime.now())) {
                                  return 'You selected today\'s date';
                                }
                              })),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Expanded(
                          child: TextFormField(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 365)))
                                    .then((value) {
                                  setState(() {
                                    _datetoController.text =
                                        DateFormat.yMMMMd().format(value!);
                                  });
                                });
                              },
                              controller: _datetoController,
                              textCapitalization: TextCapitalization.sentences,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  label: const Text('Set Date To'),
                                  labelStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  hintText: 'Set Date To',
                                  hintStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: Dimensions.width10 / 10))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please select a Date';
                                }
                                if (value ==
                                    DateFormat.yMMMMd()
                                        .format(DateTime.now())) {
                                  return 'You selected today\'s date';
                                }
                              })),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: snapshot.data?.docs.length ?? 0,
                      itemBuilder: (context, index) {
                        var date =
                            snapshot.data?.docs[index].data()?['createdAt'];
                        date.toDate();
                        var newDate =
                            DateFormat.yMEd().add_jm().format(date.toDate());

                        return Container(
                          height: Dimensions.height20 * 10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius15 - 5)),
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
                                                        itemCount: 6,
                                                        itemBuilder:
                                                            (BuildContext,
                                                                int) {
                                                          return ListTile(
                                                            title: Text(
                                                              'Chicken Thigh',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .font16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            subtitle: Text(
                                                              'Quantity: 15',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .font16),
                                                            ),
                                                            trailing: Text(
                                                              'GHC 200',
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
                                          '${snapshot.data?.docs[index].data()?['orderQuantity']}',
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
                                          'GHC ${snapshot.data?.docs[index].data()?['total']}',
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
                                        newDate,
                                        style: TextStyle(
                                            fontSize: Dimensions.font16),
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
                      },
                      separatorBuilder: ((context, index) {
                        return SizedBox(
                          height: Dimensions.height10,
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
