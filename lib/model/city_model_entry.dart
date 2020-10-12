import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model_entry.g.dart';

@JsonSerializable()
class CityModel extends Equatable {
  double latitude;
  double longitude;
  String country;
  String province;
  String city;
  String district;
  String poiName;
  String street;
  String streetNumber;
  bool isLocated = false;
  String displayedName;

  CityModel(
      {this.latitude,
      this.longitude,
      this.country,
      this.province,
      this.city,
      this.district,
      this.poiName,
      this.street,
      this.streetNumber,
      this.isLocated,
      this.displayedName});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [latitude, longitude];
}
