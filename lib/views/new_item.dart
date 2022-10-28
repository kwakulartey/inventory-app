import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/models/product.dart';
import 'package:inventory_1/utils/dimmension.dart';

import 'dashboard.dart';

class NewItem extends StatefulWidget {
  NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  String dropdownValueItem = 'Select option';
  String dropdownValueType = 'Select option';
  String dropdownValueUnit = 'Select option';
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _lowStockController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final ProductManager _productManager = ProductManager();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;

  List<String> cowData = [
    'Select option',
    'Beef',
    'Feet',
    'Tripe',
    'Minerva',
  ];
  List<String> chickenhardData = [
    'Select option',
    'Thigh',
    'Back',
    'Wings',
    'Full',
  ];
  List<String> softchickenData = [
    'Select option',
    'Thigh',
    'Drum sticks',
    'Back',
    'Wings',
    'Gizzard',
    'Sausage',
  ];
  List<String> mackerelData = [
    'Select option',
    '',
  ];
  List<String> kpanlaData = [
    'Select option',
    '',
  ];
  List<String> tilapiaData = [
    'Select option',
    'Eco',
    'Size 1',
    'Size 2',
    'Size 3',
    'Size 4',
  ];
  List<String> redfishData = [
    'Select option',
    '',
  ];
  List<String> samosaData = [
    'Select option',
    '',
  ];
  List<String> springrollData = [
    'Select option',
    '',
  ];
  List<String> potatochipsData = [
    'Select option',
    '',
  ];
  List<String> tomatopastettData = [
    'Select option',
    '2.2kg',
    '1.1kg',
    '400g (sachet)',
    '400g (can)',
    '210g (sachet)',
    '210g (can)',
    '60g'
  ];
  List<String> tomatosaucetjData = [
    'Select option',
    '210g',
    '60g',
  ];
  List<String> tomatosaucekData = [
    'Select option',
    '2.2kg',
    '1.1kg',
    '400g',
  ];
  List<String> tomatopasteothersData = [
    'Select option',
    '2.2kg',
  ];
  List<String> frytolData = [
    'Select option',
    '10 litres',
    '4.5 litres',
    '0.9 litres bottle',
    '0.9 litres sachet',
    '0.45 litres',
    '0.2 litres',
  ];
  List<String> tomatoketchupData = [
    'Select option',
    '',
  ];
  List<String> vinegarData = [
    'Select option',
    'White',
    'Apple cider',
  ];
  List<String> mayonnaiseData = [
    'Select option',
    '',
  ];
  List<String> saladcreamData = [
    'Select option',
    '',
  ];
  List<String> bakedbeansData = [
    'Select option',
    '',
  ];
  List<String> soysauceData = [
    'Select option',
    '0.9 litres',
  ];
  List<String> maggiesauceData = [
    'Select option',
    '',
  ];
  List<String> gardenpeasData = [
    'Select option',
    '',
  ];
  List<String> sweetcornData = [
    'Select option',
    '',
  ];

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
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: Dimensions.height20 * 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width30, right: Dimensions.width30),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            labelText: 'Items',
                            labelStyle: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w600),
                            prefixIcon: Icon(
                              Icons.type_specimen,
                              color: Colors.red,
                              size: Dimensions.iconSize24,
                            )),
                        dropdownColor: Colors.white,
                        validator: (value) {
                          if (value == 'Select option') {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        value: dropdownValueItem,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: Dimensions.iconSize24,
                        ),
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black, fontSize: Dimensions.font20),
                        items: <String>[
                          'Select option',
                          'Cow',
                          'Chicken hard',
                          'Chicken soft',
                          'Mackerel',
                          'Kpanla',
                          'Red fish',
                          'Samosa',
                          'Spring roll',
                          'Potato chips',
                          'Tomato paste (tasty tom)',
                          'Tomato sauce (Tasty jollof)',
                          'Tomato sauce (kivo)',
                          'Tomato paste (others)',
                          'Frytol',
                          'Tomato ketchup',
                          'Vinegar',
                          'Mayonnaise',
                          'Salad cream',
                          'Baked beans',
                          'Soy sauce',
                          'Maggie sauce',
                          'Garden Peas',
                          'Sweet corn',
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
                          setState(() {
                            dropdownValueItem = newValue!;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: Dimensions.height20 * 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width30, right: Dimensions.width30),
                    child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                            labelText: 'Types',
                            labelStyle: TextStyle(
                                fontSize: Dimensions.font26 - 2,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(
                              Icons.type_specimen,
                              color: Colors.red,
                              size: Dimensions.iconSize24,
                            )),
                        validator: (value) {
                          if (value == 'Select option') {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        value: dropdownValueType,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: Dimensions.iconSize24,
                        ),
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black, fontSize: Dimensions.font20),
                        items: dropdownValueItem == "Cow"
                            ? cowData
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
                                  ),
                                );
                              }).toList()
                            : dropdownValueItem == "Chicken hard"
                                ? chickenhardData.map<DropdownMenuItem<String>>(
                                    (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontSize: Dimensions.font16),
                                      ),
                                    );
                                  }).toList()
                                : dropdownValueItem == "Chicken soft"
                                    ? softchickenData.map<DropdownMenuItem<String>>(
                                        (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                fontSize: Dimensions.font16),
                                          ),
                                        );
                                      }).toList()
                                    : dropdownValueItem == "Mackerel"
                                        ? mackerelData.map<DropdownMenuItem<String>>(
                                            (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontSize:
                                                        Dimensions.font16),
                                              ),
                                            );
                                          }).toList()
                                        : dropdownValueItem == "Kpanla"
                                            ? kpanlaData
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontSize:
                                                            Dimensions.font16),
                                                  ),
                                                );
                                              }).toList()
                                            : dropdownValueItem == "Red fish"
                                                ? redfishData
                                                    .map<DropdownMenuItem<String>>(
                                                        (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: Dimensions
                                                                .font16),
                                                      ),
                                                    );
                                                  }).toList()
                                                : dropdownValueItem == "Samosa"
                                                    ? samosaData
                                                        .map<DropdownMenuItem<String>>(
                                                            (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    Dimensions
                                                                        .font16),
                                                          ),
                                                        );
                                                      }).toList()
                                                    : dropdownValueItem ==
                                                            "Spring roll"
                                                        ? springrollData
                                                            .map<DropdownMenuItem<String>>(
                                                                (String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .font16),
                                                              ),
                                                            );
                                                          }).toList()
                                                        : dropdownValueItem == "Potato chips"
                                                            ? potatochipsData.map<DropdownMenuItem<String>>((String value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            Dimensions.font16),
                                                                  ),
                                                                );
                                                              }).toList()
                                                            : dropdownValueItem == "Tomato paste (tasty tom)"
                                                                ? tomatopastettData.map<DropdownMenuItem<String>>((String value) {
                                                                    return DropdownMenuItem<
                                                                        String>(
                                                                      value:
                                                                          value,
                                                                      child:
                                                                          Text(
                                                                        value,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                Dimensions.font16),
                                                                      ),
                                                                    );
                                                                  }).toList()
                                                                : dropdownValueItem == "Tomato sauce (Tasty jollof)"
                                                                    ? tomatosaucetjData.map<DropdownMenuItem<String>>((String value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(fontSize: Dimensions.font16),
                                                                          ),
                                                                        );
                                                                      }).toList()
                                                                    : dropdownValueItem == "Tomato sauce (kivo)"
                                                                        ? tomatosaucekData.map<DropdownMenuItem<String>>((String value) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: value,
                                                                              child: Text(
                                                                                value,
                                                                                style: TextStyle(fontSize: Dimensions.font16),
                                                                              ),
                                                                            );
                                                                          }).toList()
                                                                        : dropdownValueItem == "Tomato paste (others)"
                                                                            ? tomatopasteothersData.map<DropdownMenuItem<String>>((String value) {
                                                                                return DropdownMenuItem<String>(
                                                                                  value: value,
                                                                                  child: Text(
                                                                                    value,
                                                                                    style: TextStyle(fontSize: Dimensions.font16),
                                                                                  ),
                                                                                );
                                                                              }).toList()
                                                                            : dropdownValueItem == "Frytol"
                                                                                ? frytolData.map<DropdownMenuItem<String>>((String value) {
                                                                                    return DropdownMenuItem<String>(
                                                                                      value: value,
                                                                                      child: Text(
                                                                                        value,
                                                                                        style: TextStyle(fontSize: Dimensions.font16),
                                                                                      ),
                                                                                    );
                                                                                  }).toList()
                                                                                : dropdownValueItem == "Tomato ketchup"
                                                                                    ? tomatoketchupData.map<DropdownMenuItem<String>>((String value) {
                                                                                        return DropdownMenuItem<String>(
                                                                                          value: value,
                                                                                          child: Text(
                                                                                            value,
                                                                                            style: TextStyle(fontSize: Dimensions.font16),
                                                                                          ),
                                                                                        );
                                                                                      }).toList()
                                                                                    : dropdownValueItem == "Vinegar"
                                                                                        ? vinegarData.map<DropdownMenuItem<String>>((String value) {
                                                                                            return DropdownMenuItem<String>(
                                                                                              value: value,
                                                                                              child: Text(
                                                                                                value,
                                                                                                style: TextStyle(fontSize: Dimensions.font16),
                                                                                              ),
                                                                                            );
                                                                                          }).toList()
                                                                                        : dropdownValueItem == "Mayonnaise"
                                                                                            ? mayonnaiseData.map<DropdownMenuItem<String>>((String value) {
                                                                                                return DropdownMenuItem<String>(
                                                                                                  value: value,
                                                                                                  child: Text(
                                                                                                    value,
                                                                                                    style: TextStyle(fontSize: Dimensions.font16),
                                                                                                  ),
                                                                                                );
                                                                                              }).toList()
                                                                                            : dropdownValueItem == "Salad cream"
                                                                                                ? saladcreamData.map<DropdownMenuItem<String>>((String value) {
                                                                                                    return DropdownMenuItem<String>(
                                                                                                      value: value,
                                                                                                      child: Text(
                                                                                                        value,
                                                                                                        style: TextStyle(fontSize: Dimensions.font16),
                                                                                                      ),
                                                                                                    );
                                                                                                  }).toList()
                                                                                                : dropdownValueItem == "Baked beans"
                                                                                                    ? bakedbeansData.map<DropdownMenuItem<String>>((String value) {
                                                                                                        return DropdownMenuItem<String>(
                                                                                                          value: value,
                                                                                                          child: Text(
                                                                                                            value,
                                                                                                            style: TextStyle(fontSize: Dimensions.font16),
                                                                                                          ),
                                                                                                        );
                                                                                                      }).toList()
                                                                                                    : dropdownValueItem == "Soy sauce"
                                                                                                        ? soysauceData.map<DropdownMenuItem<String>>((String value) {
                                                                                                            return DropdownMenuItem<String>(
                                                                                                              value: value,
                                                                                                              child: Text(
                                                                                                                value,
                                                                                                                style: TextStyle(fontSize: Dimensions.font16),
                                                                                                              ),
                                                                                                            );
                                                                                                          }).toList()
                                                                                                        : dropdownValueItem == "Maggie sauce"
                                                                                                            ? maggiesauceData.map<DropdownMenuItem<String>>((String value) {
                                                                                                                return DropdownMenuItem<String>(
                                                                                                                  value: value,
                                                                                                                  child: Text(
                                                                                                                    value,
                                                                                                                    style: TextStyle(fontSize: Dimensions.font16),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }).toList()
                                                                                                            : dropdownValueItem == "Garden Peas"
                                                                                                                ? gardenpeasData.map<DropdownMenuItem<String>>((String value) {
                                                                                                                    return DropdownMenuItem<String>(
                                                                                                                      value: value,
                                                                                                                      child: Text(
                                                                                                                        value,
                                                                                                                        style: TextStyle(fontSize: Dimensions.font16),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }).toList()
                                                                                                                : dropdownValueItem == "Sweet corn"
                                                                                                                    ? sweetcornData.map<DropdownMenuItem<String>>((String value) {
                                                                                                                        return DropdownMenuItem<String>(
                                                                                                                          value: value,
                                                                                                                          child: Text(
                                                                                                                            value,
                                                                                                                            style: TextStyle(fontSize: Dimensions.font16),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }).toList()
                                                                                                                    : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueType = newValue!;
                          });
                        }),
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
                          Row(
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.green,
                                size: Dimensions.iconSize24,
                              )
                            ],
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
                                  prefix: Text('GHC    '),
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
                                      prefix: const Text('Kilogram(s) '),
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
                                value: dropdownValueUnit,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: Dimensions.iconSize24,
                                ),
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.font20),
                                items: <String>[
                                  'Select option',
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
                                  setState(() {
                                    dropdownValueUnit = newValue!;
                                  });
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
                                controller: _lowStockController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Low Stock',
                                    prefix: Text('Kilogram(s)    '),
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
                    Container(
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
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          addItem();
                        } else {
                          Fluttertoast.showToast(
                              msg: "All fields are required",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
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

  void addItem() async {
    bool isCreated = await _productManager.addProduct(ProductDTO(
        name: dropdownValueItem.toString(),
        type: dropdownValueType.toString(),
        price: double.parse(_priceController.text),
        quantity: double.parse(_quantityController.text),
        unit: dropdownValueUnit.toString(),
        lowOnStock: double.parse(_lowStockController.text)));

    if (isCreated) {
      Get.to(() => Dashboard());
      Fluttertoast.showToast(
          msg: "Product Added Successfully",
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
  }

  int generateProductId() {
    var random = Random();
    var randomNumber = random.nextInt(1000000);
    return randomNumber;
  }
}
