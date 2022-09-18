import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            const Center(
                child: Text(
              'Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.toc_sharp,
                            size: 40,
                            color: Color.fromARGB(255, 10, 6, 100),
                          ),
                          const Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 50),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.shop,
                            size: 40,
                            color: Color.fromARGB(255, 10, 6, 100),
                          ),
                          Text(
                            'Out of Stock',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const Text(
                            '0',
                            style: TextStyle(fontSize: 50),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.shop,
                            size: 40,
                            color: Color.fromARGB(255, 10, 6, 100),
                          ),
                          const Text(
                            'Low Stock',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 50),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.shop,
                            size: 40,
                            color: Color.fromARGB(255, 10, 6, 100),
                          ),
                          Text(
                            'Reminders',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 50),
                          )
                        ],
                      ),
                    ),
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Row(
                children: [
                  Icon(
                    Icons.history,
                    size: 40,
                    color: Color.fromARGB(255, 10, 6, 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Transaction History',
                      style: TextStyle(
                          color: Color.fromARGB(255, 10, 6, 100), fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 30,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 10, 6, 100),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '+ New Item',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Color.fromARGB(31, 136, 134, 134),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
