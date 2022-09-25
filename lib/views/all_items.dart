import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/views/item_specific.dart';

import '../widget/alertdialog.dart';

class AllItems extends StatelessWidget {
  AllItems({
    Key? key,
  }) : super(key: key);

  final ProductManager _productManager = ProductManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Items'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                stream: _productManager.getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) {
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data == null) {
                    return const Text("no dat available yet");
                  }
                  return ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemBuilder: ((context, index) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.data == null) {
                          const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        var name = snapshot.data!.docs[index].data()!['name'];
                        var type = snapshot.data!.docs[index].data()!['type'];
                        var quantity =
                            snapshot.data!.docs[index].data()!['quantity'];
                        var price = snapshot.data!.docs[index].data()!['price'];
                        var newPrice = price * quantity;
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ItemSpecific();
                            }));
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '$name $type',
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
                                        '$quantity in Stock',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'GHC $newPrice',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
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
                          ),
                        );
                      }),
                      separatorBuilder: ((context, index) => Divider()),
                      itemCount: snapshot.data == null
                          ? 0
                          : snapshot.data!.docs.length);
                })));
  }
}
