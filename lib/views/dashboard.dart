import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventory_1/views/all_items.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/views/low_in_stock.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return More();
                  }));
                },
                icon: Icon(Icons.more_vert),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
              stream: _productManager.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    snapshot.data == null) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }

                for (var element in snapshot.data!.docs) {
                  print('wow');
                  print(element.data()!['qauntity']);
                }

                for (int i = 1; i < snapshot.data!.docs.length; i++) {
                  // quantitys = element[i].data()!['quantity'];
                  print(snapshot.data!.docs[i].data()!['quantity']);
                }
                // quantitys = element.data()!['quantity'];
                // lowInStock = element.data()!['lowOnStock'];

                return ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      'Stats',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(quantitys);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return AllItems();
                              }));
                            },
                            child: CardDash(
                              icon: Icons.desk_rounded,
                              text: 'Total',
                              number: snapshot.data!.docs.length.toString(),
                            ),
                          ),
                          StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                              stream: _productManager.getOutOfStock(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting &&
                                    snapshot.data == null) {
                                  return const Center(
                                      child:
                                          CircularProgressIndicator.adaptive());
                                }
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return AllItems();
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
                                        : snapshot.data!.docs.length.toString(),
                                  ),
                                );
                              })
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                              stream:
                                  _productManager.getLowStock(lowInStock: 20),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting &&
                                    snapshot.data == null) {
                                  return const Center(
                                      child:
                                          CircularProgressIndicator.adaptive());
                                }

                                return GestureDetector(
                                  onTap: () {
                                    print('tapped');

                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return LowOnStock(
                                        lowOnStock: 20,
                                      );
                                    }));
                                  },
                                  child: CardDash(
                                    icon: Icons.warning_amber_rounded,
                                    text: 'Low Stock',
                                    color: Colors.yellow,
                                    number:
                                        snapshot.data!.docs.length.toString(),
                                  ),
                                );
                              }),
                          GestureDetector(
                            // onTap: () {
                            //   Navigator.of(context)
                            //       .push(MaterialPageRoute(builder: (context) {
                            //     return AllItems();
                            //   }));
                            // },
                            child: CardDash(
                              icon: Icons.warning_amber_rounded,
                              text: 'Reminders',
                              color: Color.fromARGB(255, 16, 79, 131),
                              number: '0',
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 20,
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
                            border: const Border(
                                bottom: BorderSide(color: Colors.black))),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.history,
                                  color: Color.fromARGB(255, 11, 72, 122),
                                ),
                                Text(
                                  'Transaction History',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 11, 72, 122),
                                      fontSize: 16),
                                )
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Color.fromARGB(255, 11, 72, 122),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
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
                            height: 40,
                            width: 120,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Text(
                                '+New Item',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(
                          parent: NeverScrollableScrollPhysics(),
                        ),
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: 5,
                        itemBuilder: ((BuildContext context, int index) {
                          return Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Cow Meat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('23:40;32'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '0 in Stock',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                          onTap: (() {
                                            showDialog(
                                                barrierColor: Colors.black45,
                                                context: context,
                                                builder: (context) {
                                                  return alertdialog(
                                                    text: 'Edit Item',
                                                    text1: 'Delete Item',
                                                    icon:
                                                        Icons.edit_note_rounded,
                                                    icon1: Icons
                                                        .delete_outline_rounded,
                                                  );
                                                });
                                          }),
                                          child: Icon(Icons.more_horiz))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }))
                  ],
                );
              }),
        ));
  }
}
