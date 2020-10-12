import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_weather/view/app/bloc_wrapper.dart';
import 'package:rice_weather/view/app/my_app.dart';

void main() {
  runApp(BlocWrapper(child: MyApp()));
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle style = SystemUiOverlayStyle(
  //       systemNavigationBarColor: Color(0xFF000000),
  //       systemNavigationBarDividerColor: null,
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark,
  //       statusBarBrightness: Brightness.dark,
  //       systemNavigationBarIconBrightness: Brightness.dark
  //       );
  //   SystemChrome.setSystemUIOverlayStyle(style);
  // }
}
