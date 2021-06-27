import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/home_screen/home_page.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/text_style.dart';

class OfferSent extends StatefulWidget {
  @override
  _OfferSentState createState() => _OfferSentState();
}

class _OfferSentState extends State<OfferSent> {
  String discription =
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.";

  @override
  Widget build(BuildContext context) {
    Widget _buildButton() {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => JobsView()));
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).accentColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            // side: BorderSide(
            //   color: Pendu.color('90A0B2'),
            // ),
          ),
          child: Text(
            'Jobs',
            style: PenduTextStyle().btnStyle,
          ),
        ),
      );
    }

    Widget _buildButton2() {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            // side: BorderSide(
            //   color: Pendu.color('90A0B2'),
            // ),
          ),
          child: Text(
            'Home',
            style: PenduTextStyle().btnStyle,
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            margin: EdgeInsets.only(top: 150),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                SvgPicture.asset('assets/svg_icon/offer_sent.svg'),
                SizedBox(height: 30),
                Text(
                  'Offer sent !',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  discription,
                  textAlign: TextAlign.center,
                  style: PenduTextStyle().discritionStyle,
                ),
                SizedBox(height: 40),
                _buildButton(),
                SizedBox(height: 10),
                _buildButton2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
