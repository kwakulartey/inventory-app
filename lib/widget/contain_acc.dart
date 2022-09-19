import 'package:flutter/material.dart';

class ContainAcc extends StatelessWidget {
  String text1;
  String text2;
  ContainAcc({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: Row(
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
