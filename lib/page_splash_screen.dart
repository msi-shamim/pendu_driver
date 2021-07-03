import 'package:flutter/material.dart';
import 'package:pendu_driver/api/api_manipulation.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    ApiManipulation(context).validateDroper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Center(child: Image.asset('assets/images/ic_launcher.png')),
    ));
  }
}
