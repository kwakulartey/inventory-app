import 'package:flutter/material.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final num value;
  final void Function()? onTap;

  const StatCard({
    Key? key,
    required this.icon,
    required this.label,
    this.color,
    required this.value,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: Dimensions.height20 * 5,
        width: Dimensions.width20 * 9,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: Dimensions.iconSize24 + 6,
                  color: color,
                ),
                Text(
                  '$value',
                  style: TextStyle(
                      fontSize: Dimensions.font20 + 5,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: Dimensions.font16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
