import 'package:flutter/material.dart';
import 'package:pendu_driver/main_landing_page.dart';
import 'package:pendu_driver/page_splash_screen.dart';
import 'package:pendu_driver/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
      home: SplashScreenPage(),
    );
  }
}
