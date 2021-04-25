import 'package:flutter/material.dart';

import 'active_job.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String discription =
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.";

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //todo upper section
                Image.asset('assets/images/pendu_home_logo.png'),
                Text(
                  discription,
                  textAlign: TextAlign.center,
                ),

                //Todo Active job section
                ActiveJob(),
                //todo Rating section
                //Todo Notice board section
                //Todo Invite friend section
                //Todo more ways to invite
              ],
            ),
          ),
        ),
      ),
    );
  }
}
