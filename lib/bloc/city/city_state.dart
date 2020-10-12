import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rice_weather/model/city_model_entry.dart';

abstract class CityState extends Equatable {
  const CityState();
}

@immutable
class CityInit extends CityState {
  CityInit();

  @override
  List<Object> get props => [];
}

@immutable
class CitySucess extends CityState {
  final List<CityModel> cityModels;

  CitySucess(this.cityModels);

  @override
  // TODO: implement props
  List<Object> get props => [cityModels];
}

@immutable
class LocationSuccessState extends CityState {

  LocationSuccessState();

  @override
  List<Object> get props => [];
}