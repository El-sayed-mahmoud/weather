class CloudsModel {
  final int? all;

  CloudsModel({
    this.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}