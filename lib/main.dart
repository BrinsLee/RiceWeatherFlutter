import 'package:flutter/material.dart';
import 'package:rice_weather/view/app/bloc_wrapper.dart';
import 'package:rice_weather/view/app/my_app.dart';

void main() {
  runApp(BlocWrapper(child: MyApp()));
}
