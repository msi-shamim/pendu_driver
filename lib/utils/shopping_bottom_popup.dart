import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ShoppingBottomPopup extends StatefulWidget {
  @override
  _ShoppingBottomPopupState createState() => _ShoppingBottomPopupState();
}

class _ShoppingBottomPopupState extends State<ShoppingBottomPopup> {
  Widget _buildConfirmButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).accentColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Confirm total',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  Widget _buildDebitCardButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Pendu.color('E8EEF5'),
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Tap & Pay using your digital debit card',
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildPaymentButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Payment complete',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Container(
      height: mHeight * 0.66,
      width: mWidth,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Confirm total', style: PenduTextStyle().headerStyle)),
          Text('\$150.00',
              style: TextStyle(fontSize: 26, color: Pendu.color('707070'))),
          _buildConfirmButton(),
          Divider(),
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Payment method', style: PenduTextStyle().headerStyle)),
          _buildDebitCardButton(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upload receipt', style: PenduTextStyle().headerStyle),
              Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Pendu.color('E8EEF5')),
                child: Icon(
                  Icons.arrow_upward_rounded,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Receipt added',
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).accentColor)),
              Wrap(
                children: [
                  SvgPicture.asset('assets/svg_icon/file_icon.svg'),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        'DSC 651654.jpeg',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      )),
                ],
              ),
            ],
          ),
          _buildPaymentButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flag_outlined, color: Pendu.color('90A0B2')),
              SizedBox(width: 10),
              Text('Report a problem',
                  style: TextStyle(color: Pendu.color('90A0B2'), fontSize: 13))
            ],
          )
        ],
      ),
    );
  }
}
