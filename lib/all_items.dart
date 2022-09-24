import 'package:flutter/material.dart';
import 'package:inventory_1/item_specific.dart';
import 'package:inventory_1/widget/alertdialog.dart';

class AllItems extends StatelessWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: GestureDetector(
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ItemSpecific();
            }));
          }),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
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
                      color: Colors.black12),
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
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
                            Text(
                              '0 in Stock',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'GHC 390.00',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                                onTap: (() {
                                  showDialog(
                                      barrierColor: Colors.black45,
                                      context: context,
                                      builder: (context) {
                                        return alertdialog(
                                          text: 'Edit Item',
                                          text1: 'Delete Item',
                                          icon: Icons.edit_note_rounded,
                                          icon1: Icons.delete_outline_rounded,
                                        );
                                      });
                                }),
                                child: Icon(Icons.more_horiz))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      )),
    );
  }
}
