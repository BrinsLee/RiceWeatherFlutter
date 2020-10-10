import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_weather/view/pages/home/home_page.dart';

GlobalKey globalKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '米粒天气',
      color: Colors.blue,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          child: HomePage(
            key: globalKey,
          ),
          value: SystemUiOverlayStyle.light),
    );
  }
}
