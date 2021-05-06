import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/profile_update.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/graph.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:pendu_driver/auth_screen/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
      home: ProfileEarnings(),
    );
  }
}
