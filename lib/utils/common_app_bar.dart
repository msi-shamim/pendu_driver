import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String appBarTitle;
  CommonAppBar({this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).accentColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        appBarTitle,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
    );
  }
}
