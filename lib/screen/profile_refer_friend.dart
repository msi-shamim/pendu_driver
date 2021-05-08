import 'package:flutter/material.dart';
import 'package:pendu_driver/home_screen/invite_friend.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProfileReferFriend extends StatefulWidget {
  @override
  _ProfileReferFriendState createState() => _ProfileReferFriendState();
}

class _ProfileReferFriendState extends State<ProfileReferFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'Refer a friend'),
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 110,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: InviteFriend(),
              ),
            )));
  }
}
