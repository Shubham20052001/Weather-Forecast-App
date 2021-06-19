import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/network/Network.dart';
import 'package:weather_forecast/ui/bottom_view.dart';
import 'package:weather_forecast/ui/mid_View.dart';


// Better way of doing Business!
class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Bhopal";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject =getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast",style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder(
                future: forecastObject,
                builder: (BuildContext context,AsyncSnapshot<WeatherForecastModel> snapshot){
              if(snapshot.hasData){
                  return Column(
                    children: [
                      MidView(snapshot: snapshot,),
                      // midView(snapshot),
                      BottomView(snapshot: snapshot,)
                      // bottomView(snapshot, context)
                    ],
                  );
              }else{
                return Container(
                  child: Center(child: CircularProgressIndicator(),),
                );
              }
            })
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) => new Network().getWeatherForecast(cityName: _cityName);
}
