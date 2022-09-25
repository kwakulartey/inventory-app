import 'package:flutter/material.dart';

class TransHistory extends StatelessWidget {
  const TransHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        centerTitle: true,
      ),
    );
  }
}
