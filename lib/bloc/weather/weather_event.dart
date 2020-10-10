import 'package:equatable/equatable.dart';
import 'package:rice_weather/model/city_model_entry.dart';

abstract class WeatherEvent extends Equatable{
  const WeatherEvent();
}


class FetchWeatherDataEvent extends WeatherEvent{

  final CityModel cityModel;

  const FetchWeatherDataEvent(this.cityModel);
  @override
  // TODO: implement props
  List<Object> get props => [cityModel];

}