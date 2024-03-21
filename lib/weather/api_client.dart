import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'data/data_set.dart';

// https://openweathermap.org/
String apiKey = "your_api_key";

class WeatherApiClient {
  Future<List> fetchData(String lat, String lon, String city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?units=metric&lat=$lat&lon=$lon&appid=$apiKey";

    var response = await http.get(Uri.parse(url));
    DateTime date = DateTime.now();

    if (response.statusCode == 200) {
      var res = json.decode(response.body);

      var main = res["main"];
      Weather currentTemp = Weather(
          current: main["temp"]?.round() ?? 0,
          max: main["temp_max"]?.round() ?? 0,
          min: main["temp_min"]?.round() ?? 0,
          name: res["weather"][0]["main"].toString(),
          day: DateFormat("EEEE dd MMMM").format(date),
          wind: res["wind"]["speed"]?.round() ?? 0,
          humidity: main["humidity"]?.round() ?? 0,
          chanceRain: 0,
          location: city,
          image: findIcon(res["weather"][0]["main"].toString(), true)
          );
      return [currentTemp];
    }
    return [null];
  }

  String findIcon(String name, bool type) {
    if (type) {
      switch (name) {
        case "Clouds":
          return "assets/sunny.png";
        case "Rain":
          return "assets/rainy.png";
        case "Drizzle":
          return "assets/rainy.png";
        case "Thunderstorm":
          return "assets/thunder.png";
        case "Snow":
          return "assets/snow.png";
        default:
          return "assets/sunny.png";
      }
    } else {
      switch (name) {
        case "Clouds":
          return "assets/sunny_2d.png";
        case "Rain":
          return "assets/rainy_2d.png";
        case "Drizzle":
          return "assets/rainy_2d.png";
        case "Thunderstorm":
          return "assets/thunder_2d.png";
        case "Snow":
          return "assets/snow_2d.png";
        default:
          return "assets/sunny_2d.png";
      }
    }
  }
}
