import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/authentication/login.dart';
import 'package:inventory_1/utils/dimmension.dart';
import 'package:inventory_1/views/all_items.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/views/low_in_stock.dart';
import 'package:inventory_1/views/out_of_Stock.dart';
import 'package:inventory_1/widget/alertdialog.dart';
import 'package:inventory_1/widget/card_dash.dart';

import 'Trans_history.dart';
import 'more.dart';
import 'new_item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ProductManager _productManager = ProductManager();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int quantitys = 0;
  int lowInStock = 0;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    isUserAuth();
    super.initState();
  }

  isUserAuth() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Login()), (route) => false);
      }
      if (user != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return _firebaseAuth.currentUser == null
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: Dimensions.font20),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: Dimensions.width10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const More();
                      }));
                    },
                    icon: Icon(
                      Icons.more_vert,
                      size: Dimensions.iconSize24,
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                  stream: _productManager.getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }

                    // for (var element in snapshot.data!.docs) {
                    //   print('wow');
                    //   print(element.data()!['qauntity']);
                    // }

                    for (var i = 1; i < snapshot.data!.docs.length; i++) {
                      // quantitys = element[i].data()!['quantity'];
                      lowInStock = snapshot.data!.docs[i].data()!['lowOnStock'];
                      print(lowInStock);
                    }
                    // quantitys = element.data()!['quantity'];
                    // lowInStock = element.data()!['lowOnStock'];

                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          'Stats',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return AllItems();
                                  }));
                                },
                                child: CardDash(
                                  icon: Icons.desk_rounded,
                                  text: 'Total',
                                  number: snapshot.data!.docs.length.toString(),
                                ),
                              ),
                              StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>?>>(
                                  stream: _productManager.getOutOfStock(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting &&
                                        snapshot.data == null) {
                                      return const Center(
                                          child: CircularProgressIndicator
                                              .adaptive());
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return OutOfStock();
                                        }));
                                      },
                                      child: CardDash(
                                        icon: Icons.warning_amber_rounded,
                                        color: Colors.red,
                                        text: 'Out of Stock',
                                        number: snapshot.data!.docs
                                                .toString()
                                                .isEmpty
                                            ? "0"
                                            : snapshot.data!.docs.length
                                                .toString(),
                                      ),
                                    );
                                  })
                            ]),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>?>>(
                                  stream: _productManager.getLowStock(
                                      lowInStock: lowInStock),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting &&
                                        snapshot.data == null) {
                                      return const Center(
                                          child: CircularProgressIndicator
                                              .adaptive());
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LowOnStock(
                                            lowOnStock: lowInStock,
                                          );
                                        }));
                                      },
                                      child: CardDash(
                                        icon: Icons.warning_amber_rounded,
                                        text: 'Low Stock',
                                        color: Colors.yellow,
                                        number: snapshot.data!.docs.length
                                            .toString(),
                                      ),
                                    );
                                  }),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return TransHistory();
                                  }));
                                },
                                child: CardDash(
                                  icon: Icons.add,
                                  text: 'Daily Sales',
                                  color: Color.fromARGB(255, 16, 79, 131),
                                  number: '0',
                                ),
                              )
                            ]),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return TransHistory();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black,
                                        width: Dimensions.width10 / 10))),
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10,
                                vertical: Dimensions.height10),
                            height: Dimensions.height45 + 5,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: Dimensions.iconSize24,
                                      color: Color.fromARGB(255, 11, 72, 122),
                                    ),
                                    Text(
                                      'Transaction History',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 11, 72, 122),
                                          fontSize: Dimensions.font16),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  size: Dimensions.iconSize24,
                                  color: Color.fromARGB(255, 11, 72, 122),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recent',
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: (() {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return NewItem();
                                }));
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 11, 72, 122),
                                    borderRadius: BorderRadius.circular(10)),
                                height: Dimensions.height20 * 2,
                                width: Dimensions.width30 * 5,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimensions.height10),
                                  child: Center(
                                    child: Text(
                                      ' +NEW ITEM',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height15,
                        ),
                        StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                            stream: _productManager.getRecent(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting &&
                                  snapshot.data == null) {
                                const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                              return ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(
                                    parent: NeverScrollableScrollPhysics(),
                                  ),
                                  shrinkWrap: true,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                        height: Dimensions.height10);
                                  },
                                  itemCount: snapshot.data == null
                                      ? 0
                                      : snapshot.data!.docs.length,
                                  itemBuilder:
                                      ((BuildContext context, int index) {
                                    var name = snapshot.data!.docs[index]
                                        .data()!['name'];
                                    var type = snapshot.data?.docs[index]
                                        .data()?['type'];

                                    var stocks = snapshot.data!.docs[index]
                                        .data()?['quantity'];
                                    var id = snapshot.data!.docs[index].id;

                                    // var newDat = date.toDate();

                                    // var newDate = DateFormat.yMEd()
                                    //     .add_jm()
                                    //     .format(newDat);

                                    return Container(
                                      height: Dimensions.height20 * 5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black12),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.width10,
                                            vertical: Dimensions.height10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '$name $type',
                                                  style: TextStyle(
                                                      fontSize:
                                                          Dimensions.font16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                // SizedBox(
                                                //   width: Dimensions.width10,
                                                // ),
                                                // Text(newDate),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                Icon(
                                                  Icons.warning_amber_rounded,
                                                  size: Dimensions.iconSize24,
                                                  color:
                                                      stocks <= 20 && stocks > 0
                                                          ? Colors.yellow
                                                          : stocks == 0
                                                              ? Colors.red
                                                              : Colors.green,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimensions.height20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '$stocks in Stock',
                                                  style: TextStyle(
                                                      fontSize:
                                                          Dimensions.font16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                GestureDetector(
                                                    onTap: (() {
                                                      showDialog(
                                                          barrierColor:
                                                              Colors.black45,
                                                          context: context,
                                                          builder: (context) {
                                                            return alertdialog(
                                                              docId: id,
                                                              text: 'Edit Item',
                                                              text1:
                                                                  'Delete Item',
                                                              icon: Icons
                                                                  .edit_note_rounded,
                                                              icon1: Icons
                                                                  .delete_outline_rounded,
                                                            );
                                                          });
                                                    }),
                                                    child: Icon(
                                                      Icons.more_horiz,
                                                      size:
                                                          Dimensions.iconSize24,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }));
                            })
                      ],
                    );
                  }),
            ));
  }
}
