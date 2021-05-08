import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProfilePaymentCard extends StatefulWidget {
  @override
  _ProfilePaymentCardState createState() => _ProfilePaymentCardState();
}

class _ProfilePaymentCardState extends State<ProfilePaymentCard> {
  Widget _buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          // side: BorderSide(
          //   color: Pendu.color('90A0B2'),
          // ),
        ),
        child: Text('Update card'),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.only(left: 20.0, bottom: 20.0, right: 10.0),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Pendu.color('BAC5D2'),
            Pendu.color('90A0B2'),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              SvgPicture.asset('assets/svg_icon/visa.svg'),
              SizedBox(height: 20.0),
              Text(
                "*** *** *** 0817",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Jonathan Doe",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Expire Date 10/19",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          Icon(
            Icons.more_horiz,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'Payment card'),
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        _buildCard(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildButton(),
                ],
              ),
            )));
  }
}
