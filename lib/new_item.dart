import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  String dropdownValueItem = 'Select option';
  String dropdownValueType = 'Select option';
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _lowStockController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

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
        title: const Text('Add New Item'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          labelText: 'Items',
                          labelStyle: TextStyle(fontSize: 20),
                          prefixIcon:
                              Icon(Icons.type_specimen, color: Colors.red)),
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
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      items: <String>[
                        'Select option',
                        'Meat',
                        'Fish',
                        'chicken',
                        'Sausage',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
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
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: 'Types',
                          labelStyle: TextStyle(fontSize: 20),
                          prefixIcon:
                              Icon(Icons.type_specimen, color: Colors.red)),
                      validator: (value) {
                        if (value == 'Select option') {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      value: dropdownValueType,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      items: dropdownValueItem == "Fish"
                          ? fishData
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList()
                          : dropdownValueItem == "chicken"
                              ? chickenData.map<DropdownMenuItem<String>>(
                                  (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 16),
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
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.green,
                          )
                        ],
                      ),
                      Expanded(
                        child: TextFormField(
                            controller: _priceController,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Price',
                                prefix: Text('GHS    '),
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: 'Enter price of product')),
                      ),
                    ],
                  ),
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
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.monitor_weight_rounded,
                            color: Color.fromARGB(255, 12, 4, 154),
                          )
                        ],
                      ),
                      Expanded(
                        child: TextFormField(
                            controller: _quantityController,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Quantity',
                                prefix: Text('Kilogram(s)    '),
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: '10')),
                      ),
                    ],
                  ),
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
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.red,
                          )
                        ],
                      ),
                      Expanded(
                        child: TextFormField(
                            controller: _lowStockController,
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
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: '20')),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 9, 82, 142)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
