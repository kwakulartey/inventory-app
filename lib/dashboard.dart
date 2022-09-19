import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventory_1/more.dart';
import 'package:inventory_1/new_item.dart';
import 'package:inventory_1/widget/card_dash.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
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
                icon: Icon(Icons.more_vert),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'Stats',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CardDash(
                  icon: Icons.desk_rounded,
                  text: 'Total',
                ),
                CardDash(
                  icon: Icons.warning_amber_outlined,
                  color: Colors.red,
                  text: 'Out of Stock',
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CardDash(
                  icon: Icons.warning_amber_outlined,
                  text: 'Low Stock',
                  color: Colors.yellow,
                ),
                CardDash(
                  icon: Icons.warning_amber_rounded,
                  text: 'Reminders',
                  color: Color.fromARGB(255, 16, 79, 131),
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border:
                        const Border(bottom: BorderSide(color: Colors.black))),
                padding: EdgeInsets.all(10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.history,
                          color: Colors.blue,
                        ),
                        Text(
                          'Transaction History',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NewItem();
                      }));
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      width: 120,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          '+New Item',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(
                    parent: NeverScrollableScrollPhysics(),
                  ),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: 5,
                  itemBuilder: ((BuildContext context, int index) {
                    return Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Cow Meat',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('23:40;32'),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.red,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0 in Stock'),
                                Icon(Icons.more_vert)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }))
            ],
          ),
        ));
  }
}
