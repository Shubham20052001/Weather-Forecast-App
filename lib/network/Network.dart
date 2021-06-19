import 'dart:convert';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=metric";// Change units to imperial or metric.
    Uri finalUri = Uri.parse(finalUrl);
    final response = await get(finalUri);
    print(finalUri);
    
    if(response.statusCode == 200){
      // we get actual mapped model (Dart object).
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error getting Weather Forecast");
    }
  }
}
