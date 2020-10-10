import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_weather/bloc/weather/weather_event.dart';
import 'package:rice_weather/net/weather_api.dart';

class WeatherBloc extends Bloc {
  final WeatherApi weatherApi;

  WeatherBloc(this.weatherApi) : super(FetchWeatherDataEvent(null));

  
  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
