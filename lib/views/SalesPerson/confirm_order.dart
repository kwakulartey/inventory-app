import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/controllers/basket_controller.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/models/basket_model.dart';
import 'package:inventory_1/utils/dimmension.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  BasketController basketController = Get.find<BasketController>();
  ProductManager productManager = ProductManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirmation',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.separated(
            itemCount: basketController.basket.length,
            itemBuilder: (context, index) {
              String key = basketController.basket.keys.elementAt(index);
              BasketItem basketItem = basketController.basket[key]!;
              double subTotal =
                  (basketItem.product.price ?? 0) * basketItem.quantity;
              return Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${basketItem.product.name} ${basketItem.product.type}',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'GHC $subTotal',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            '${basketItem.quantity}',
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Container(
                            height: Dimensions.height10 * 4,
                            width: Dimensions.width20 * 5,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15 - 5)),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: Dimensions.iconSize16,
                                  ),
                                  onPressed: () {
                                    if (basketItem.quantity > 1) {
                                      basketItem.quantity -= 1;

                                      basketController.basket[
                                              basketItem.product.id ?? ''] =
                                          basketItem;
                                    } else {
                                      basketController.basket
                                          .remove(basketItem.product.id);
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: Dimensions.iconSize16,
                                  ),
                                  onPressed: () {
                                    if (basketItem.quantity <
                                        (basketItem.product.quantity ?? 0)) {
                                      basketItem.quantity += 1;

                                      basketController.basket[
                                              basketItem.product.id ?? ''] =
                                          basketItem;
                                    }
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: ((context, index) {
              return SizedBox(
                height: Dimensions.height10,
              );
            }),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: Dimensions.width10 / 10))),
        height: Dimensions.height20 * 4,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Total Cost',
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Obx(() {
                    double total = 0.0;
                    basketController.basket.forEach(
                      (key, value) {
                        total += value.quantity * (value.product.price ?? 0);
                      },
                    );
                    return Text(
                      'GHC $total',
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w600),
                    );
                  })
                ],
              ),
              GestureDetector(
                onTap: () {
                  basketController.basket.forEach((key, value) {
                    productManager.updateProduct(
                        docID: key,
                        price: value.product.price,
                        quantity:
                            (value.product.quantity ?? 0) - value.quantity);
                  });
                },
                child: Container(
                  height: Dimensions.height20 * 2.5,
                  width: Dimensions.width20 * 8,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 71, 118),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 - 5)),
                  child: Center(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Text(
                      'CONFIRM SALES',
                      style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
