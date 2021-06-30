import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class DeliverAddressTableUtils extends StatelessWidget {
  final TextStyle defineTextSTyle;
  final double lineHight;
  DeliverAddressTableUtils({this.defineTextSTyle, this.lineHight});
  final TextStyle addressTextStyle =
      TextStyle(color: Pendu.color('90A0B2'), fontSize: 10);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: lineHight + 30,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Pendu.color('FFCE8A'),
                size: 20,
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: lineHight,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: defineTextSTyle.color,
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
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka,',
                  style: (defineTextSTyle != null)
                      ? defineTextSTyle
                      : addressTextStyle,
                ),
                Text(
                  '2103 N Main St, Highlands, TX 77562',
                  style: (defineTextSTyle != null)
                      ? defineTextSTyle
                      : addressTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
