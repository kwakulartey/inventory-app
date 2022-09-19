import 'package:flutter/material.dart';
import 'package:inventory_1/Colla.dart';
import 'package:inventory_1/widget/contain_acc.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Accounts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
                child: CircleAvatar(
              radius: 80,
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  ContainAcc(text1: 'Name:', text2: 'Nathaniel Asamoah'),
                  ContainAcc(
                      text1: 'E-mail:', text2: 'nathanielasamoah@gmail.com'),
                  ContainAcc(text1: 'Number:', text2: '0246089849'),
                  ContainAcc(text1: 'Company Name:', text2: 'Ghana Company'),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Colla();
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(Icons.people),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Manage Collabrators',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
