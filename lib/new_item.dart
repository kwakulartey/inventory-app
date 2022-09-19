import 'package:flutter/material.dart';

class NewItem extends StatelessWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
