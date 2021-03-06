import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("$city , $country",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
            Text("${Util.getFormattedDate(formattedDate)}",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,color: Colors.pinkAccent,size: 198),
            ),
            //Icon(FontAwesomeIcons.cloud,size: 195,color: Colors.pinkAccent,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${forecastList[0].temp.day.toStringAsFixed(0)}°C",style: TextStyle(fontSize: 34),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecastList[0].weather[0].description.toUpperCase()}",style: TextStyle(fontSize: 16),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecastList[0].speed.toStringAsFixed(1)} m/s"),
                        // Icon(Icons.arrow_forward_rounded,size: 20,color: Colors.brown,)
                        Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecastList[0].humidity.toStringAsFixed(0)}%"),
                        Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown),
                        // Icon(Icons.hot_tub,size: 20,color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecastList[0].temp.max.toStringAsFixed(0)}°C"),
                        Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.brown),
                        // Icon(Icons.wb_sunny,size: 20,color: Colors.brown,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Not so good way...
// Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
//
//   Container midView =
//   return midView;
// }
