import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/routes/app_pages.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class ProductActionModal extends StatelessWidget {
  final Product product;

  ProductActionModal({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ProductActionModal: $product");

    return AlertDialog(
      elevation: 30,
      content: Container(
        height: Dimensions.height20 * 5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(Routes.EDIT_PRODUCT, arguments: product);
              },
              child: Container(
                height: Dimensions.height20 * 2,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15 - 5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                      horizontal: Dimensions.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Product',
                        style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 90, 145)),
                      ),
                      Icon(
                        Icons.edit_note_rounded,
                        size: Dimensions.iconSize24,
                        color: Color.fromARGB(225, 22, 90, 145),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            GestureDetector(
              onTap: () async {
                //TODO: Refactor this into theproduct/all_prodct_controller
                /*   showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Icon(Icons.warning_amber_rounded,
                            color: Colors.red),
                        content:
                            Text('Are you sure you want to delete product?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No')),
                          TextButton(
                              onPressed: () async {
                                bool isDeleted = await _productManager
                                    .deletedProduct(docId: docId);
                                if (isDeleted) {
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(
                                      msg: "Product Deleted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: _productManager.message,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: Dimensions.font16),
                              ))
                        ],
                      );
                    }));
              */
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete Product',
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
