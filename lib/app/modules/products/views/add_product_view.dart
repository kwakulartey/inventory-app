import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  AddProductView({Key? key}) : super(key: key);

  String dropdownMenuUnit = 'select option';
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _lowOnStockController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Item',
          style: TextStyle(color: Colors.black, fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.height20, horizontal: Dimensions.width10),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black26,
                                width: Dimensions.width10 / 10))),
                    height: Dimensions.height20 * 4,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.type_specimen,
                            color: Colors.red,
                            size: Dimensions.iconSize24,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Name of item',
                                  labelStyle: TextStyle(
                                      fontSize: Dimensions.font16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  hintText: 'Enter name of item'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please item name';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black26,
                                width: Dimensions.width10 / 10))),
                    height: Dimensions.height20 * 4,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.type_specimen,
                            color: Colors.red,
                            size: Dimensions.iconSize24,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _typeController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Type',
                                  // prefix: Text('GHC    '),
                                  labelStyle: TextStyle(
                                      fontSize: Dimensions.font16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  hintText: 'Type of item'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please specify the type';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black26,
                                width: Dimensions.width10 / 10))),
                    height: Dimensions.height20 * 4,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.green,
                            size: Dimensions.iconSize24,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Price',
                                  prefix: const Text('GHC    '),
                                  labelStyle: TextStyle(
                                      fontSize: Dimensions.font16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintStyle:
                                      TextStyle(fontSize: Dimensions.font16),
                                  hintText: 'Enter price of product'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please set price for product';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: Dimensions.width10 / 10))),
                        height: Dimensions.height20 * 4,
                        width: Dimensions.width30 * 5,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: Dimensions.width10 - 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _quantityController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Quantity',
                                      labelStyle: TextStyle(
                                          fontSize: Dimensions.font16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      hintStyle: TextStyle(
                                          fontSize: Dimensions.font16),
                                      hintText: '10'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please set quantity';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: Dimensions.height20 * 4,
                          width: Dimensions.width30,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height10,
                                left: Dimensions.width30,
                                right: Dimensions.width30),
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  labelText: 'Units',
                                  labelStyle: TextStyle(
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.w600),
                                ),
                                dropdownColor: Colors.white,
                                validator: (value) {
                                  if (value == 'Select option') {
                                    return 'Please select an option';
                                  }
                                  return null;
                                },
                                value: dropdownMenuUnit,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: Dimensions.iconSize24,
                                ),
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.font20),
                                items: <String>[
                                  'select option',
                                  'kilos',
                                  'Others',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // setState(() {
                                  //   dropdownMenuUnit = newValue!;
                                  // }
                                  // );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: Dimensions.width10 / 10))),
                    height: Dimensions.height20 * 4,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Color.fromARGB(255, 236, 215, 25),
                                size: Dimensions.iconSize24,
                              )
                            ],
                          ),
                          Expanded(
                            child: TextFormField(
                                controller: _lowOnStockController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Low Stock',
                                    labelStyle: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    hintStyle:
                                        TextStyle(fontSize: Dimensions.font16),
                                    hintText: '20'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please set low on stock';
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: Dimensions.height10 * 5,
                        width: Dimensions.width20 * 5,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addProductToFirestore(
                          ProductDTO(
                            name: _nameController.text,
                            type: _typeController.text,
                            quantity: double.parse(_quantityController.text),
                            unit: dropdownMenuUnit.toString(),
                            price: double.parse(_priceController.text),
                            lowOnStock:
                                double.parse(_lowOnStockController.text),
                          ),
                        );
                      },
                      child: Container(
                        height: Dimensions.height10 * 5,
                        width: Dimensions.width20 * 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 9, 82, 142)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, top: 15),
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
