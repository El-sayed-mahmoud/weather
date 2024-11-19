import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:templete/Modules/Weather/weather_controller.dart';
import 'package:templete/Utilities/theme_helper.dart';
import 'package:templete/Widgets/loading_screen.dart';

import '../../Utilities/enum.dart';
import '../../generated/assets.dart';
import 'Widget/cloud_widget.dart';
import 'Widget/raining_widget.dart';
import 'Widget/sunny_widget.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = "Weather";
  final DateTime selectedDate;

  const WeatherScreen({super.key, required this.selectedDate});

  @override
  createState() => _WeatherScreenState();
}

class _WeatherScreenState extends StateX<WeatherScreen> {
  _WeatherScreenState() : super(controller: WeatherController()) {
    con = WeatherController();
  }

  late WeatherController con;

  @override
  void initState() {
    con.init(widget.selectedDate);
    super.initState();
  }

  _getEntertainmentWidgets(WeatherType? weatherType) {
    Widget weatherWidget = switch (weatherType) {
      WeatherType.clear => SunnyWidget(
          specificWeatherDate: con.specificWeatherDate,
          city: con.city,
        ),
      WeatherType.clouds => CloudWidget(
          specificWeatherDate: con.specificWeatherDate,
          city: con.city,
        ),
      WeatherType.rain => RainingWidget(
          specificWeatherDate: con.specificWeatherDate,
          city: con.city,
        ),
      _ => const Center(child: SizedBox.shrink()),
    };
    return weatherWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingScreen(
        loading: con.loading,
        child: _getEntertainmentWidgets(
            con.specificWeatherDate?.weather.firstOrNull?.weatherType),
      ),
    );
  }
}
