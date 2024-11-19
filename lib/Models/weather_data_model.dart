import '../Utilities/api_end_point.dart';
import '../Utilities/enum.dart';

class WeatherDataModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDataModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  WeatherType get weatherType => WeatherType.values.byName(main??'');
  String get image =>APIEndPoint.image(icon);
  factory WeatherDataModel.fromJson(Map<String, dynamic> json) => WeatherDataModel(
    id: json["id"],
    main:json["main"].toLowerCase(),
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}