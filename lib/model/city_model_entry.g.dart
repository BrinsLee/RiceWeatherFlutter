// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return CityModel(
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble(),
      country: json['country'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      poiName: json['poiName'] as String,
      street: json['street'] as String,
      streetNumber: json['streetNumber'] as String,
      isLocated: json['isLocated'] as bool,
      displayedName: json['displayedName'] as String);
}

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'poiName': instance.poiName,
      'street': instance.street,
      'streetNumber': instance.streetNumber,
      'isLocated': instance.isLocated,
      'displayedName': instance.displayedName
    };
