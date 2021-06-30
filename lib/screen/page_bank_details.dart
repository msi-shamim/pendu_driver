import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class BankDatailsPage extends StatefulWidget {
  @override
  _BankDatailsPageState createState() => _BankDatailsPageState();
}

class _BankDatailsPageState extends State<BankDatailsPage> {
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
        child: Text('Update Banking Information'),
      ),
    );
  }

  Widget _buildTextForm({String title, hintText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 40.0,
      // width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Pendu.color('F8F8F8')),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Container(
            alignment: Alignment.centerRight,
            width: 180,
            child: TextFormField(
              textAlign: TextAlign.end,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(color: Pendu.color('90A0B2'), fontSize: 16),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBarUtils(appBarTitle: 'Bank Details'),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Banking details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildTextForm(
                        title: 'ABN', hintText: '*** *** *** *** 826'),
                    _buildTextForm(title: 'BSB', hintText: '*** *** 695'),
                    _buildTextForm(
                        title: 'Account number',
                        hintText: '*** *** 5852 5525 666'),
                    SizedBox(height: 300.0),
                    _buildButton()
                  ],
                ),
              )),
        ));
  }
}
