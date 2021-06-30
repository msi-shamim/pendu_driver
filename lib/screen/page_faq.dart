import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  // bool isTapped = true;
  bool tOQ1 = true,
      tOQ2 = true,
      tOQ3 = true,
      tPQ1 = true,
      tPQ2 = true,
      tPQ3 = true,
      tWQ1 = true,
      tWQ2 = true,
      tWQ3 = true;

  Widget _buildDropDown(
      {bool isTapped = true, String headerText, String bodyText}) {
    Widget _buildUntapBox() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isTapped
                ? Icons.add_circle_outline
                : Icons.remove_circle_outline_rounded,
            color: Colors.black.withOpacity(0.7),
            size: 18,
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 260,
            child: Text(
              headerText,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
      height: isTapped ? 60 : 120,
      // width: isExpanded ? 385 : 390,
      //color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: isTapped
          ? _buildUntapBox()
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildUntapBox(),
                  Container(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0),
                    //  color: Colors.blue,
                    child: Text(
                      bodyText,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Pendu.color('90A0B2'),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildOrderFaq() {
    return Wrap(
      children: [
        Text(
          'Order',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
            onTap: () {
              setState(() {
                tOQ1 = !tOQ1;
              });
            },
            child: _buildDropDown(
                isTapped: tOQ1,
                headerText:
                    'Q1: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
                bodyText:
                    'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .')),
        InkWell(
          onTap: () {
            setState(() {
              tOQ2 = !tOQ2;
            });
          },
          child: _buildDropDown(
              isTapped: tOQ2,
              headerText:
                  'Q2: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
              bodyText:
                  'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .'),
        ),
        InkWell(
          onTap: () {
            setState(() {
              tOQ3 = !tOQ3;
            });
          },
          child: _buildDropDown(
              isTapped: tOQ3,
              headerText:
                  'Q3: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
              bodyText:
                  'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .'),
        ),
      ],
    );
  }

  Widget _buildPaymentFaq() {
    return Wrap(
      children: [
        Text(
          'Paymnet',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
            onTap: () {
              setState(() {
                tPQ1 = !tPQ1;
              });
            },
            child: _buildDropDown(
                isTapped: tPQ1,
                headerText:
                    'Q1: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
                bodyText:
                    'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .')),
        InkWell(
          onTap: () {
            setState(() {
              tPQ2 = !tPQ2;
            });
          },
          child: _buildDropDown(
              isTapped: tPQ2,
              headerText:
                  'Q2: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
              bodyText:
                  'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .'),
        ),
        InkWell(
          onTap: () {
            setState(() {
              tPQ3 = !tPQ3;
            });
          },
          child: _buildDropDown(
              isTapped: tPQ3,
              headerText:
                  'Q3: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
              bodyText:
                  'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .'),
        ),
      ],
    );
  }

  Widget _buildWithdrawFaq() {
    return Wrap(
      children: [
        Text(
          'Withdraw',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
            onTap: () {
              setState(() {
                tWQ1 = !tWQ1;
              });
            },
            child: _buildDropDown(
                isTapped: tWQ1,
                headerText:
                    'Q1: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
                bodyText:
                    'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .')),
        InkWell(
          onTap: () {
            setState(() {
              tWQ2 = !tWQ2;
            });
          },
          child: _buildDropDown(
              isTapped: tWQ2,
              headerText:
                  'Q2: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
              bodyText:
                  'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .'),
        ),
        InkWell(
          onTap: () {
            setState(() {
              tWQ3 = !tWQ3;
            });
          },
          child: _buildDropDown(
              isTapped: tWQ3,
              headerText:
                  'Q3: Lorem ipsum dolor sit amet, conse tetur sadipscing elitr? ',
              bodyText:
                  'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna .'),
        ),
      ],
    );
  }

  Widget _buildChatButton() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Still need help?',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .90,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PenduChatSupportPage()));
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
            child: Text('Chat support'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBarUtils(appBarTitle: 'FAQ'),
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
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        _buildOrderFaq(),
                        _buildPaymentFaq(),
                        _buildWithdrawFaq(),
                      ],
                    ),
                  ),
                  _buildChatButton(),
                ],
              ),
            )));
  }
}
