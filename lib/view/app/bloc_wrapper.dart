import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_weather/bloc/city/city_bloc.dart';
import 'package:rice_weather/bloc/weather/weather_bloc.dart';
import 'package:rice_weather/net/weather_api.dart';

class BlocWrapper extends StatelessWidget {
  final Widget child;
  final WeatherApi weatherApi = WeatherApi();

  BlocWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CityBloc>(create: (context) => CityBloc(weatherApi)),
      BlocProvider<WeatherBloc>(create: (context) => WeatherBloc(weatherApi))
    ], child: child);
  }
}
