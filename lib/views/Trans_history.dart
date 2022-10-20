import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/utils/dimmension.dart';

class TransHistory extends StatelessWidget {
  TransHistory({Key? key}) : super(key: key);

  final ProductManager _manager = ProductManager();

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

              return ListView.separated(
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context, index) {
                  var date = snapshot.data?.docs[index].data()?['createdAt'];
                  date.toDate();
                  var newDate =
                      DateFormat.yMEd().add_jm().format(date.toDate());
                 
                  return Container(
                    height: Dimensions.height20 * 9,
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
                                    'Item(s)',
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Chicken thigh',
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.arrow_drop_down_rounded)),
                                  )
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
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
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
                                    'Amount',
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'GHC ${snapshot.data?.docs[index].data()?['total']}',
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  newDate,
                                  style: TextStyle(fontSize: Dimensions.font16),
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
              );
            }),
      ),
    );
  }
}
