import 'package:flutter/material.dart';
import 'package:pendu_driver/api/api_call.dart';
import 'package:pendu_driver/model/model.dart';
import 'package:pendu_driver/utils/utils.dart';

import 'active_job.dart';
import 'driver_rating.dart';
import 'invite_friend.dart';
import 'notice_board.dart';

class HomePage extends StatefulWidget {
  final Dropper dropper;
  final String token;
  HomePage({this.dropper, this.token});
  @override
  _HomePageState createState() => _HomePageState(dropper, token);
}

class _HomePageState extends State<HomePage> {
  final Dropper dropper;
  final String token;
  _HomePageState(this.dropper, this.token);

  String discription =
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavigation(initValue: "Home"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 40),
                //todo upper section
                Image.asset('assets/images/pendu_home_logo.png'),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      CallApi(context).callDropperLogout(token, context);
                    },
                    child: Text('Logout')),
                Text(
                  discription,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                //Todo Active job section
                ActiveJob(),
                Divider(height: 20),
                //todo Rating section
                DriverRatings(),
                Divider(height: 40),
                //Todo Notice board section
                NoticeBoard(),
                Divider(height: 40),
                //Todo Invite friend section
                Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: InviteFriend(
                      dropper: dropper,
                      token: token,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
