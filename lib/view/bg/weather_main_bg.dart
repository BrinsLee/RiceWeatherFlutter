import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rice_weather/app/res/weather_type.dart';
import 'package:rice_weather/view/app/my_app.dart';
import 'package:rice_weather/view/event/change_index_envent.dart';

class WeatherMainBg extends StatefulWidget {
  @override
  _WeatherMainBgState createState() => _WeatherMainBgState();
}

class _WeatherMainBgState extends State<WeatherMainBg>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  int _lastIndex = -1;
  StreamSubscription _subscription;
  List<WeatherType> _weatherTypes;
  AnimationController _controller;
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(microseconds: 300), vsync: this)
    CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _controller.addListener(() { 
      setState(() {
        _value = _controller.value;
      });
    });
    _subscription = eventBus.on().listen((event) {
      if(event is ChangeMainAppBarIndexEvent){
        
      }
    });
    super.initState();
  }
}
