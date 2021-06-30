import 'package:flutter/material.dart';

class CommonAppBarUtils extends StatelessWidget {
  final String appBarTitle;
  CommonAppBarUtils({this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
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
