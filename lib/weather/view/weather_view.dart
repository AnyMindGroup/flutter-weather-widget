import 'package:flutter/material.dart';
import 'package:weather_widget/weather/data/data_set.dart';

import '../api_client.dart';
import '../widget/current_weather.dart';

Weather? currentTemp;
String lat = "35.6895";
String lon = "139.6917";
String city = "Tokyo";

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  getData() async {
    WeatherApiClient().fetchData(lat, lon, city).then((value) {
      currentTemp = value[0];
      setState(() {

      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00ffffff),
      body: currentTemp == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [CurrentWeather(getData)],
            ),
    );
  }
}
