import 'package:flutter/material.dart';

class NewItem extends StatelessWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black12),
              child: Column(children: [
                Row(
                  children: [
                    Icon(Icons.category),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Items',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
