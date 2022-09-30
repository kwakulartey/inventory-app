import 'package:flutter/material.dart';
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
            style: TextStyle(color: Colors.black, fontSize: Dimensions.font20),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Dimensions.width10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return More();
                  }));
                },
                icon: Icon(
                  Icons.more_vert,
                  size: Dimensions.iconSize24,
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
                child: ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height20),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15 - 5)),
                        height: Dimensions.height20 * 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width30),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  labelText: 'Items',
                                  labelStyle:
                                      TextStyle(fontSize: Dimensions.font20),
                                  prefixIcon: Icon(Icons.type_specimen,
                                      size: Dimensions.iconSize24,
                                      color: Colors.red)),
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
                                  color: Colors.black,
                                  fontSize: Dimensions.font16),
                              items: <String>[
                                'Select option',
                                'Meat',
                                'Fish',
                                'Chicken',
                                'Sausage',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
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
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        height: Dimensions.height20 * 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width30),
                          child: DropdownButtonFormField(
                              dropdownColor: Colors.white,
                              decoration: InputDecoration(
                                  labelText: 'Types',
                                  labelStyle:
                                      TextStyle(fontSize: Dimensions.font20),
                                  prefixIcon: Icon(Icons.type_specimen,
                                      size: Dimensions.iconSize24,
                                      color: Colors.red)),
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
                                  color: Colors.black,
                                  fontSize: Dimensions.font16),
                              items: dropdownValueItem == "Fish"
                                  ? fishData.map<DropdownMenuItem<String>>(
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
                                  : dropdownValueItem == "Chicken"
                                      ? chickenData
                                          .map<DropdownMenuItem<String>>(
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
                      Container(
                        height: Dimensions.height20 * 4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15 - 5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20 * 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on_rounded,
                                    size: Dimensions.iconSize24,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Text(
                                    'Price',
                                    style:
                                        TextStyle(fontSize: Dimensions.font16),
                                  ),
                                ],
                              ),
                              Text(
                                'GHC 30',
                                style: TextStyle(fontSize: Dimensions.font16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Container(
                          height: Dimensions.height20 * 5,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: Dimensions.height30 * 2,
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
                                                  fontSize: Dimensions.font16),
                                            ),
                                            controller: _quantitysaleController,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                            color: Colors.black12,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: _decrementCount,
                                                    icon: Icon(
                                                      Icons.chevron_left,
                                                      size:
                                                          Dimensions.iconSize24,
                                                    )),
                                                IconButton(
                                                    onPressed: _incrementCount,
                                                    icon: Icon(
                                                      Icons.chevron_right,
                                                      size:
                                                          Dimensions.iconSize24,
                                                    )),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ]))),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Center(
                        child: addmore(),
                      )
                    ]))));
  }
}
