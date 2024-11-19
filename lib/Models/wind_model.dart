class WindModel {
  final double? speed;
  final int? deg;
  final double? gust;

  WindModel({
    this.speed,
    this.deg,
    this.gust,
  });
  String get windDirection => getWindDirection(deg?.toDouble()??0) ;

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
  String getWindDirection(double degree) {
    if (degree >= 0 && degree < 45) return 'North';
    if (degree >= 45 && degree < 135) return 'East';
    if (degree >= 135 && degree < 225) return 'South';
    if (degree >= 225 && degree < 315) return 'West';
    return 'North';
  }
}