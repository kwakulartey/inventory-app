import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  EditProductView({Key? key}) : super(key: key);
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: Dimensions.height45 + 5,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15 - 5)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width20,
                                    vertical: Dimensions.height10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Quantity:',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16),
                                    ),
                                    Text(
                                      ' 0',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimensions.font16),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              height: Dimensions.height45 + 5,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width10,
                                    vertical: Dimensions.height10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Total Value:',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16),
                                    ),
                                    Text(
                                      ' GHC ${5 * 6}',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Container(
                        height: Dimensions.height20 * 20,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15 - 5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Dimensions.height45 + 5,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: Dimensions.width10 / 10,
                                          color: Colors.grey))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: Dimensions.width20 * 4,
                                    left: Dimensions.width20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Product Name:',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      'name type',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: Dimensions.height45 + 25,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: Dimensions.width10 / 10,
                                          color: Colors.grey))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: Dimensions.width20 * 4,
                                    left: Dimensions.width20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Quantity in Stock:',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '20',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: Dimensions.height45 + 25,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: Dimensions.width10 / 10,
                                          color: Colors.grey))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: Dimensions.width20 * 2.5,
                                    left: Dimensions.width20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price:',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height20 * 3,
                                      width: Dimensions.width20 * 5,
                                      child: TextFormField(
                                        // initialValue: price.toString(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          prefix: Text(
                                            'GHC  ',
                                            style: TextStyle(
                                                fontSize: Dimensions.font16),
                                          ),
                                          labelStyle: TextStyle(
                                              fontSize: Dimensions.font16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          hintStyle: TextStyle(
                                              fontSize: Dimensions.font16),
                                        ),
                                        controller: _priceController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontSize: Dimensions.font16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: Dimensions.height45 * 4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: Dimensions.width10,
                                          color: Colors.black))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width20,
                                    vertical: Dimensions.height10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Adjust',
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: Dimensions.height20 * 3,
                                          width: Dimensions.width15 * 10,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width:
                                                        Dimensions.width10 / 10,
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              labelText: 'Quantity',
                                              prefix: Text('kilos    '),
                                              labelStyle: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              hintStyle: TextStyle(
                                                fontSize: Dimensions.font16,
                                              ),
                                            ),
                                            controller: _quantityController,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.bold),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please fill here';
                                              }
                                            },
                                          ),
                                        ),
                                        Container(
                                            color: Colors.black12,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.chevron_left,
                                                      size:
                                                          Dimensions.iconSize24,
                                                    )),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.chevron_right,
                                                      size:
                                                          Dimensions.iconSize24,
                                                    )),
                                              ],
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10 - 5,
                                    ),
                                    GestureDetector(
                                      onTap: (() async {}),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 16, 81, 133),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15 - 5)),
                                        height: Dimensions.height10 * 5,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                            child: Text(
                                          'Save Changes',
                                          style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
