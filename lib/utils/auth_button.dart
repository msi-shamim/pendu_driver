import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key key,
    this.width,
    this.hight,
    this.primaryColor,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double hight;
  final Color primaryColor;
  final String text;
  final Function onPressed;
  // AuthButton({this.width, this.hight, this.primaryColor, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: width,
      height: hight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // side: BorderSide(
          //   color: Pendu.color('90A0B2'),
          // ),
        ),
        child: Text(
          text,
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }
}
