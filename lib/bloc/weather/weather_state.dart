import 'package:equatable/equatable.dart';
import 'package:rice_weather/model/city_model_entry.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherLoading extends WeatherState {
  final CityModel cityModel;

  const WeatherLoading(this.cityModel);

  @override
  List<Object> get props => [cityModel];
}