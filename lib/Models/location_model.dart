class LocationModel {
  final double? lat;
  final double? lon;

  LocationModel({
    this.lat,
    this.lon,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}