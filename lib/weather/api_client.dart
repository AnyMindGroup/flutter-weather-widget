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
          image: "assets/sunny.png"
          // image: findIcon(current["weather"][0]["main"].toString(), true)
          );
      return [currentTemp];
    }
    return [null];
  }
}
