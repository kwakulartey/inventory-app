import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_1/managers/product_manager.dart';
import 'package:inventory_1/models/product.dart';

class ItemSpecific extends StatefulWidget {
  final String docId;
  const ItemSpecific({Key? key, required this.docId}) : super(key: key);

  @override
  State<ItemSpecific> createState() => _ItemSpecificState();
}

class _ItemSpecificState extends State<ItemSpecific> {
  final TextEditingController _quantityController = TextEditingController();
  final ProductManager _productManager = ProductManager();
  int _count = 0;

  void _incrementCount() {
    setState(() {
      var news = _count++;
      _quantityController.text = news.toString();
    });
  }

  void _decrementCount() {
    setState(() {
      var news = _count--;
      _quantityController.text = news.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Spec'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>?>>(
              stream: _productManager.getProduct(docID: widget.docId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data == null) {
                  return const Center(
                    child: Text("No data"),
                  );
                }
                var name = snapshot.data!.data()!['name'];
                var type = snapshot.data!.data()!['type'];
                var quantity = snapshot.data!.data()!['quantity'];
                var price = snapshot.data!.data()!['price'];
                return Column(
                  children: [
                    Center(
                      child: Text(
                        'Stock',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Quantity:',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            )),
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Total Value:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'GHC ${quantity * price}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 80, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Product Name:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '$name $type',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 80, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Quantity in Stock:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 10, color: Colors.black))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, bottom: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Adjust',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
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
                                                FloatingLabelBehavior.never,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Quantity',
                                            prefix: Text('kilos    '),
                                            labelStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            hintStyle: TextStyle(fontSize: 16),
                                          ),
                                          controller: _quantityController,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                          color: Colors.black12,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: _decrementCount,
                                                  icon:
                                                      Icon(Icons.chevron_left)),
                                              IconButton(
                                                  onPressed: _incrementCount,
                                                  icon: Icon(
                                                    Icons.chevron_right,
                                                  )),
                                            ],
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: (() async{
                                      // _productManager.updateProduct(docID: docID, product: Product(name: name, type: type, price: price, quantity: quantity, lowOnStock: lowOnStock, productId: productId))
                                    }),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 16, 81, 133),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      child:const Center(
                                          child: Text(
                                        'Save Changes',
                                        style: TextStyle(
                                            fontSize: 16,
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
                );
              }),
        ),
      ),
    );
  }
}
