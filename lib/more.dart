import 'package:flutter/material.dart';
import 'package:inventory_1/Colla.dart';
import 'package:inventory_1/widget/contain_acc.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
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
            Container(
              color: Colors.white,
              height: 200,
              width: double.infinity,
              child: Stack(
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 100,
                      right: 20,
                      child: Icon(
                        Icons.photo_camera,
                        size: 35,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  ContainAcc(
                    icon4: Icons.person,
                    text1: 'Name:',
                    text2: 'Nathaniel Asamoah',
                  ),
                  ContainAcc(
                      icon4: Icons.email,
                      text1: 'E-mail:',
                      text2: 'nathanielasamoah@gmail.com'),
                  ContainAcc(
                      icon4: Icons.numbers,
                      text1: 'Number:',
                      text2: '0246089849'),
                  ContainAcc(
                      icon4: Icons.work,
                      text1: 'Company Name:',
                      text2: 'Ghana Company'),
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
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 4, 36, 61),
                    ),
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
