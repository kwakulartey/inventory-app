import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/controllers/basket_controller.dart';
import 'package:inventory_1/controllers/product_controller.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/models/basket_model.dart';
import 'package:inventory_1/models/product.dart';
import 'package:inventory_1/views/SalesPerson/confirm_order.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utils/dimmension.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final ProductManager _productManager = ProductManager();
  final BasketController basketController = Get.find<BasketController>();

  void updateList(String value) {
    setState(() {
      _productManager.getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: Dimensions.font26 - 2),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout_rounded,
                size: Dimensions.iconSize24,
                color: Colors.red,
              ))
        ],
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
          stream: _productManager.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.data == null) {
              const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return GetBuilder<ProductController>(builder: (product) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        right: Dimensions.width10,
                        left: Dimensions.width10,
                        bottom: Dimensions.height10 - 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: Dimensions.iconSize24,
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ('Search'),
                        labelStyle: TextStyle(fontSize: Dimensions.font16),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: Dimensions.width10 / 10)),
                        hintText: 'Search items here',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10),
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius15))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10,
                            vertical: Dimensions.height10),
                        itemBuilder: (context, index) {
                          var docID = snapshot.data?.docs[index].id;

                          return GestureDetector(
                            onTap: () {
                              showBarModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StreamBuilder<
                                            DocumentSnapshot<
                                                Map<String, dynamic>>>(
                                        stream: _productManager.getProduct(
                                            docID: docID ?? ''),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.waiting &&
                                              snapshot.data == null) {
                                            const Center(
                                              child: CircularProgressIndicator
                                                  .adaptive(),
                                            );
                                          }
                                          return StatefulBuilder(
                                              builder: ((context, setState) {
                                            if (snapshot.connectionState ==
                                                    ConnectionState.waiting &&
                                                snapshot.data == null) {
                                              const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              );
                                            }
                                            return Obx(() {
                                              int quantity = basketController
                                                      .basket[docID]
                                                      ?.quantity ??
                                                  0;
                                              int availQuantity = snapshot.data
                                                      ?.data()?['quantity'] ??
                                                  0;
                                              double unitPrice = snapshot.data
                                                      ?.data()?['price'] ??
                                                  0;
                                              double total =
                                                  quantity * unitPrice;

                                              Product product =
                                                  Product.fromMap({
                                                ...snapshot.data?.data() ?? {},
                                                'id': docID
                                              });
                                              BasketItem basketItem =
                                                  BasketItem(
                                                      product: product,
                                                      quantity: quantity);
                                              print(product.toJson());

                                              return Container(
                                                  height:
                                                      Dimensions.height30 * 8,
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                Dimensions
                                                                    .width20,
                                                            vertical: Dimensions
                                                                .height20),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: Dimensions
                                                                  .height20 *
                                                              4,
                                                          decoration: BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      width: Dimensions
                                                                              .width10 /
                                                                          10))),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '${snapshot.data?.data()?['name']} ${snapshot.data?.data()?['type']}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .font16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    quantity
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            Dimensions
                                                                                .font16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: Dimensions
                                                                        .width10,
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .black12,
                                                                        borderRadius:
                                                                            BorderRadius.circular(Dimensions.radius15 -
                                                                                5)),
                                                                    child: Row(
                                                                      children: [
                                                                        IconButton(
                                                                            icon:
                                                                                Icon(
                                                                              Icons.remove,
                                                                              size: Dimensions.iconSize24,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              if (quantity > 1) {
                                                                                quantity -= 1;
                                                                                basketItem.quantity = quantity;
                                                                                basketController.basket[docID ?? ''] = basketItem;
                                                                              } else {
                                                                                basketController.basket.remove(docID);
                                                                              }
                                                                            }),
                                                                        IconButton(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add,
                                                                            size:
                                                                                Dimensions.iconSize24,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            if (quantity <
                                                                                availQuantity) {
                                                                              quantity += 1;
                                                                              basketItem.quantity = quantity;
                                                                              basketController.basket[docID ?? ''] = basketItem;
                                                                            }
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Dimensions
                                                              .height20,
                                                        ),
                                                        Container(
                                                          height: Dimensions
                                                                  .height20 *
                                                              4,
                                                          decoration: BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      width: Dimensions
                                                                              .width10 /
                                                                          10))),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        Dimensions
                                                                            .height20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Total',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              Dimensions.font16),
                                                                    ),
                                                                    SizedBox(
                                                                      width: Dimensions
                                                                          .width10,
                                                                    ),
                                                                    Text(
                                                                      'GHC ${total}',
                                                                      style: TextStyle(
                                                                          fontSize: Dimensions
                                                                              .font16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: Dimensions
                                                                          .height20 *
                                                                      2,
                                                                  width: Dimensions
                                                                          .width30 *
                                                                      5,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(Dimensions.radius15 -
                                                                              5)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'ADD TO ORDER',
                                                                      style: TextStyle(
                                                                          fontSize: Dimensions
                                                                              .font16,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ));
                                            });
                                          }));
                                        });
                                  });
                            },
                            child: Container(
                              height: Dimensions.height20 * 4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: Dimensions.width10 / 10,
                                          color: Colors.grey))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data?.docs[index].data()?['name']} ${snapshot.data?.docs[index].data()?['type']} ',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'GHC ${snapshot.data?.docs[index].data()?['price']} ',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext int, index) {
                          return Divider(
                            height: Dimensions.height10,
                          );
                        },
                        itemCount: product.productList.length),
                  ),
                ],
              );
            });
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.height20, horizontal: Dimensions.width30),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ConfirmOrder();
            }));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 13, 71, 118),
                  borderRadius: BorderRadius.circular(Dimensions.radius15 - 5)),
              height: Dimensions.height20 * 3,
              width: Dimensions.width30,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20,
                    horizontal: Dimensions.width20),
                child: Obx(() {
                  double total = 0.0;
                  basketController.basket.forEach(
                    (key, value) {
                      total += value.quantity * (value.product.price ?? 0);
                    },
                  );
                  return Text(
                    'CONFIRM ORDER ${basketController.basket.keys.length} ITEM(S) GHC $total',
                    style: TextStyle(
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  );
                }),
              )),
        ),
      ),
    );
  }
}
