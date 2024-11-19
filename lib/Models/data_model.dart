import 'package:templete/Models/weather_model.dart';

import 'city_model.dart';

class DataModel {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherModel> list;
  final CityModel? city;

  DataModel({
    this.cod,
    this.message,
    this.cnt,
    this.list=const[],
    this.city,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: json["list"] == null ? [] : List<WeatherModel>.from(json["list"]!.map((x) => WeatherModel.fromJson(x))),
    city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list":  List<dynamic>.from(list.map((x) => x.toJson())),
    "city": city?.toJson(),
  };
}