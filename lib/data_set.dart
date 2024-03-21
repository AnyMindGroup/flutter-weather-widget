class Weather {
  final int? max;
  final int? min;
  final int? current;
  final String? name;
  final String? day;
  final int? wind;
  final int? humidity;
  final int? chanceRain;
  final String? image;
  final String? time;
  final String? location;

  Weather(
      {this.max,
      this.min,
      this.name,
      this.day,
      this.wind,
      this.humidity,
      this.chanceRain,
      this.image,
      this.current,
      this.time,
      this.location});
}

Weather currentTemp = Weather(
    current: 21,
    max: 20,
    min: 17,
    image: "assets/sunny.png",
    name: "Sunny",
    day: "Monday, 17 May",
    wind: 13,
    humidity: 24,
    location: "Tokyo, Japan");
