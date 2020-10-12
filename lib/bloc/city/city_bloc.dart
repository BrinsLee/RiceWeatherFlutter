import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:rice_weather/app/utils/print_utils.dart';
import 'package:rice_weather/bloc/city/city_event.dart';
import 'package:rice_weather/bloc/city/city_state.dart';
import 'package:rice_weather/bloc/weather/weather_event.dart';
import 'package:rice_weather/net/weather_api.dart';
import 'package:rice_weather/view/app/my_app.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final WeatherApi weatherApi;

  CityBloc(this.weatherApi) : super(CityInit());

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    weatherPrint('cityBloc || mapEventToState evet: ${event.runtimeType}');
    if (event is FetchWeatherDataEvent) {
    } else if (event is RequestLocationEvent) {
      showAppDialog();
    }
  }
}
