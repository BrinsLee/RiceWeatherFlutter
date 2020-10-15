import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:rice_weather/app/res/weather_type.dart';
import 'package:rice_weather/app/utils/print_utils.dart';
import 'package:rice_weather/app/utils/shared_preference_util.dart';
import 'package:rice_weather/bloc/city/city_event.dart';
import 'package:rice_weather/bloc/city/city_state.dart';
import 'package:rice_weather/bloc/weather/weather_event.dart';
import 'package:rice_weather/model/city_model_entry.dart';
import 'package:rice_weather/net/weather_api.dart';
import 'package:rice_weather/view/app/my_app.dart';
import 'dart:async';

class CityBloc extends Bloc<CityEvent, CityState> {
  final WeatherApi weatherApi;

  CityBloc(this.weatherApi) : super(CityInit());

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    weatherPrint('cityBloc || mapEventToState evet: ${event.runtimeType}');
    if (event is FetchWeatherDataEvent) {
    } else if (event is RequestLocationEvent) {
      showAppDialog();
      print("开始定位");
      Location location = await AmapLocation.instance.fetchLocation();
      print("定位结束: $location");
      CityModel cityModel = convert(location);
      cityModel.displayedName = WeatherUtil.getCityName(cityModel);
      List<CityModel> cityModels = [];
      if (cityModel.latitude != 0.0 && cityModel.longitude != 0.0) {
        cityModels = await insertCityModel(cityModel);
  
      }
      
    }
  }

  CityModel convert(Location location) {
    return CityModel(
        latitude: location.latLng.latitude,
        longitude: location.latLng.longitude,
        country: location.country,
        province: location.province,
        city: location.city,
        district: location.district,
        poiName: location.poiName,
        street: location.street,
        streetNumber: location.streetNumber,
        isLocated: true);
  }

  Future<List<CityModel>> insertCityModel(CityModel cityModel) async {
    List<CityModel> cityModels = await SPUtil.getCityModels();
    if (cityModels == null) {
      cityModels = [];
    }
    if (cityModels.isNotEmpty) {
      CityModel needRemoveModel;
      cityModels.forEach((element) {
        if (cityModel.isLocated == true) {
          needRemoveModel = element;
          return;
        }
      });
      if (needRemoveModel != null) {
        weatherPrint("定位城市需要先从 CityModels 中移除");
        cityModels.remove(needRemoveModel);
      }
    }
    if (cityModel.isLocated == true) {
      cityModels.insert(0, cityModel);
    } else {
      cityModels.add(cityModel);
    }
    await SPUtil.saveCityModels(cityModels);
    weatherPrint("插入成功后 size: ${cityModels?.length}");
    return cityModels;
  }
}
