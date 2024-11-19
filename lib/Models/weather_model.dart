
import 'package:templete/Models/sys_model.dart';
import 'package:templete/Models/weather_data_model.dart';
import 'package:templete/Models/wind_model.dart';

import 'clouds_model.dart';
import 'main_model.dart';

class WeatherModel {
  final int? dt;
  final MainModel? main;
  final List<WeatherDataModel> weather;
  final CloudsModel? clouds;
  final WindModel? wind;
  final int? visibility;
  final int? pop;
  final SysModel? sys;
  final DateTime? dtTxt;

  WeatherModel({
    this.dt,
    this.main,
    this.weather=const[],
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    dt: json["dt"],
    main: json["main"] == null ? null : MainModel.fromJson(json["main"]),
    weather: json["weather"] == null ? [] : List<WeatherDataModel>.from(json["weather"]!.map((x) => WeatherDataModel.fromJson(x))),
    clouds: json["clouds"] == null ? null : CloudsModel.fromJson(json["clouds"]),
    wind: json["wind"] == null ? null : WindModel.fromJson(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"],
    sys: json["sys"] == null ? null : SysModel.fromJson(json["sys"]),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main?.toJson(),
    "weather":  List<dynamic>.from(weather.map((x) => x.toJson())),
    "clouds": clouds?.toJson(),
    "wind": wind?.toJson(),
    "visibility": visibility,
    "pop": pop,
    "sys": sys?.toJson(),
    "dt_txt": dtTxt?.toIso8601String(),
  };
}



















