
import 'package:rice_weather/model/city_model_entry.dart';

enum WeatherType {

  sunny,
  cloundy,
  overcast,
  lightRainy,
  middleRainy,
  heavyRainy,
  thunder,
  hazy,
  foggy,
  lightSnow,
  middleSnow,
  heavySnow,
  dusty,
  sunnyNight,
  cloudyNight,
}

enum LifeIndexType { ultraviolet, carWashing, dressing, comfort, coldRisk, typhoon }

class WeatherUtil {
  
  static String getCityName(CityModel cityModel) {
    String cityName = "";
    if (cityModel.isLocated == true) {
      cityName = "${cityModel.district}  ${cityModel.street}";
    } else {
      String city = "";
      if (cityModel.city != null && cityModel.city.isNotEmpty) {
        city = "${cityModel.city}";
      }
      String district = "";
      if (cityModel.district != null && cityModel.district.isNotEmpty) {
        district = "${cityModel.district}";
      }
      String province = "";
      if (cityModel.province != null && cityModel.province.isNotEmpty) {
        province = "${cityModel.province}";
      }
      if (city != "") {
        cityName = "$city $district";
      } else {
        cityName = "$province";
      }
    }
    return cityName;
  }
}