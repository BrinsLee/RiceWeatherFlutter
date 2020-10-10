import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:rice_weather/bloc/city/city_event.dart';
import 'package:rice_weather/bloc/city/city_state.dart';
import 'package:rice_weather/net/weather_api.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final WeatherApi weatherApi;

  CityBloc(this.weatherApi) : super(CityInit());

  @override
  Stream<CityState> mapEventToState(CityEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
