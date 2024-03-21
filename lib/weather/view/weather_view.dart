import 'package:flutter/material.dart';

import '../widget/current_weather.dart';


class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0x00ffffff),
      body: Column(
        children: [CurrentWeather()],
      ),
    );
  }
}