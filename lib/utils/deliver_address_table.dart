import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class DeliverAddressTable extends StatelessWidget {
  TextStyle addressTextStyle =
      TextStyle(color: Pendu.color('90A0B2'), fontSize: 10);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.orange,
                size: 20,
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 20.0,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.grey,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              Icon(
                Icons.circle,
                color: Colors.green,
                size: 10,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka,',
                  style: addressTextStyle,
                ),
                Text(
                  '2103 N Main St, Highlands, TX 77562',
                  style: addressTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
