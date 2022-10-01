import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/utils/dimmension.dart';
import 'package:inventory_1/views/more.dart';

import 'add_more.dart';

class DashboardSales extends StatefulWidget {
  const DashboardSales({Key? key}) : super(key: key);

  @override
  State<DashboardSales> createState() => _DashboardSalesState();
}

class _DashboardSalesState extends State<DashboardSales> {
  String dropdownValueItem = 'Select option';
  String dropdownValueType = 'Select option';
  final TextEditingController _quantitysaleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final ProductManager _productManager = ProductManager();

  bool isLoading = false;
  int _count = 0;

  void _incrementCount() {
    setState(() {
      var news = _count++;
      _quantitysaleController.text = news.toString();
    });
  }

  void _decrementCount() {
    setState(() {
      var news = _count--;
      _quantitysaleController.text = news.toString();
    });
  }

  List<String> chickenData = [
    'Select option',
    'Legs',
    'wings',
    'Gizzard',
  ];
  List<String> fishData = [
    'Select option',
    'Salmon',
    'Kpanla',
    'Tuna',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Dashboard',
            style: TextStyle(color: Colors.black),
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
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            )
          ],
          centerTitle: true,
        ),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                    stream: _productManager.getAllProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          snapshot.data == null) {
                        const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      var name = snapshot.data!.docs;
                      return ListView(
                          padding:
                              EdgeInsets.only(top: 20, left: 10, right: 10),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 80,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Items',
                                        labelStyle: TextStyle(
                                            fontSize: Dimensions.font20),
                                        prefixIcon: const Icon(
                                            Icons.type_specimen,
                                            color: Colors.red)),
                                    dropdownColor: Colors.white,
                                    validator: (value) {
                                      if (value == 'Select option') {
                                        return 'Please select an option';
                                      }
                                      return null;
                                    },
                                    value: dropdownValueItem,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    items: name.map((doc) {
                                      dropdownValueItem = doc.data()!['name'];
                                      return DropdownMenuItem<String>(
                                        value: doc.data()!['name'] +
                                            doc.data()!['type'],
                                        child: Text(
                                          doc.data()!['name'] +
                                              doc.data()!['name'],
                                          style: TextStyle(fontSize: 16),
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
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 80,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: DropdownButtonFormField(
                                    dropdownColor: Colors.white,
                                    decoration: InputDecoration(
                                        labelText: 'Types',
                                        labelStyle: TextStyle(fontSize: 20),
                                        prefixIcon: Icon(Icons.type_specimen,
                                            color: Colors.red)),
                                    validator: (value) {
                                      if (value == 'Select option') {
                                        return 'Please select an option';
                                      }
                                      return null;
                                    },
                                    value: dropdownValueType,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    items: dropdownValueItem == "Fish"
                                        ? fishData
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            );
                                          }).toList()
                                        : dropdownValueItem == "chicken"
                                            ? chickenData
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style:
                                                        TextStyle(fontSize: 16),
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
                              height: 20,
                            ),
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on_rounded,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          'Price',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'GHC 30',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 10, color: Colors.black))),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20, bottom: 2),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 150,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    labelText: 'Quantity',
                                                    prefix: Text('kilos    '),
                                                    labelStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    hintStyle:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  controller:
                                                      _quantitysaleController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                  color: Colors.black12,
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed:
                                                              _decrementCount,
                                                          icon: Icon(Icons
                                                              .chevron_left)),
                                                      IconButton(
                                                          onPressed:
                                                              _incrementCount,
                                                          icon: Icon(
                                                            Icons.chevron_right,
                                                          )),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ]))),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: addmore(),
                            )
                          ]);
                    }))));
  }
}
