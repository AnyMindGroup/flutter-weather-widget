import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import '../view/weather_view.dart';


class CurrentWeather extends StatefulWidget {
  const CurrentWeather(Function() getData, {super.key});

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      color: Colors.blue[900],
      margin: const EdgeInsets.all(2),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 54, right: 24, left: 24, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.pin_drop_outlined, color: Colors.white70),
                    Text(
                      "   ${currentTemp!.location!}",
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white70),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    "Updating",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 8, left: 8, right: 24, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(currentTemp!.image!))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Now",
                      style: TextStyle(
                          fontSize: 20, height: 0.1, color: Colors.white),
                    ),
                    SizedBox(
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            "${currentTemp!.current}\u00B0",
                            style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "High: ${currentTemp!.max}\u00B0 \u2022 Low: ${currentTemp!.min}\u00B0",
                      style:
                      const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentTemp!.name!,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}