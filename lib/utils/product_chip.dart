import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProductChip extends StatelessWidget {
  final String label;
  final Color backColor;
  ProductChip({this.label, this.backColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (backColor != null) ? backColor : Pendu.color('FFEBCF'),
      ),
      child: Text(
        label,
        style: PenduTextStyle().fadedTextStyle,
      ),
    );
  }
}
