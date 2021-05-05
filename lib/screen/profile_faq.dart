import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProfileFAQ extends StatefulWidget {
  @override
  _ProfileFAQState createState() => _ProfileFAQState();
}

class _ProfileFAQState extends State<ProfileFAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'FAQ'),
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Order',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
