import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProfileEarnings extends StatefulWidget {
  @override
  _ProfileEarningsState createState() => _ProfileEarningsState();
}

class _ProfileEarningsState extends State<ProfileEarnings> {
  Widget _buildCardSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Card
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                image: AssetImage('assets/images/card_back.png'),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your eearning',
                    style: PenduTextStyle().whiteTextStyle,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '\$1225.00',
                    style: TextStyle(
                        fontSize: 26, color: Theme.of(context).accentColor),
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/svg_icon/earnings2.svg',
                color: Colors.white,
                height: 45,
                width: 40,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAlertDialoge(context),
          );
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
        child: Text('Withdraw funds'),
      ),
    );
  }

  Widget _buildAlertDialoge(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Confirm withdraw funds to your added payment method.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 110,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Pendu.color('F97A7A'),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text('No'),
                  ),
                ),
                SizedBox(
                  width: 110,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildConfirmationDialoge(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Theme.of(context).accentColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text('Procceed'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationDialoge(BuildContext context) {
    return AlertDialog(
      title: SvgPicture.asset(
        'assets/svg_icon/proced_icon.svg',
        height: 50,
        width: 50,
      ),
      content: SingleChildScrollView(
        child: Text(
          'Your request has been received. Your funds will be disbursed soon.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'Profile info'),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                _buildCardSection(),
                _buildButton(),
              ],
            ),
          ),
        ));
  }
}
