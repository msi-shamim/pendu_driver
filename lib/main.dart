import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';

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
      home: Shopping(),
    );
  }
}
