class SysModel {
  final String? pod;

  SysModel({
    this.pod,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
    pod:json["pod"],
  );

  Map<String, dynamic> toJson() => {
    "pod":pod,
  };
}