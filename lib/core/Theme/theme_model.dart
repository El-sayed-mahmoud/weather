
import 'package:flutter/material.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/theme_helper.dart';


class ThemeModel extends ThemeExtension<ThemeModel>{

  static ThemeModel defaultTheme = ThemeClass.defaultTheme();

  final bool isDark;
  final Color primaryColor;
  final Color shadePrimaryColor;
  final Color backGroundColor;
  final Color mainTextColor;
  final Color bodyTextColor;
  final Color rainingColor;
  final Color darkGreyColor;
  final Color lightGreyColor;
  final Color sunnyDayColor;
  final Color hintColor;
  final Color cloudBackground;


  ThemeModel({
    this.isDark = false,
    required this.primaryColor,
    required this.rainingColor,
    required this.shadePrimaryColor,
    required this.backGroundColor,
    required this.mainTextColor,
    required this.bodyTextColor,
    required this.darkGreyColor,
    required this.lightGreyColor,
    required this.sunnyDayColor,
    required this.hintColor,
    required this.cloudBackground,
  });

  @override
  ThemeModel copyWith({
    bool? isDark,
    Color? primaryColor,
    Color? successColor,
    Color? backGroundColor,
    Color? mainTextColor,
    Color? bodyTextColor,
    Color? darkGreyColor,
    Color? lightGreyColor,
    Color? shadePrimaryColor,
    Color? warningColor,
    Color? hintColor,
    Color? conBackground,

  }) {
    return ThemeModel(
      isDark: isDark??this.isDark,
      primaryColor: primaryColor??this.primaryColor,
      shadePrimaryColor: shadePrimaryColor??this.shadePrimaryColor,
      rainingColor: successColor??this.rainingColor,
      backGroundColor: backGroundColor??this.backGroundColor,
      darkGreyColor: darkGreyColor??this.darkGreyColor,
      lightGreyColor: lightGreyColor??this.lightGreyColor,
      sunnyDayColor: warningColor??this.sunnyDayColor,
      mainTextColor: mainTextColor??this.mainTextColor,
      bodyTextColor: bodyTextColor??this.bodyTextColor,
      hintColor: bodyTextColor??this.hintColor,
      cloudBackground: bodyTextColor??this.cloudBackground,
    );
  }

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
      isDark: json["isDark"],
      primaryColor: Color(json["primaryColor"]),
      rainingColor: Color(json["successColor"]),
      backGroundColor: Color(json["backGroundColor"]),
      darkGreyColor: Color(json["darkGreyColor"]),
      lightGreyColor: Color(json["lightGreyColor"]),
      sunnyDayColor: Color(json["warningColor"]),
      mainTextColor: Color(json["mainTextColor"]),
      bodyTextColor: Color(json["bodyTextColor"]),
      shadePrimaryColor: Color(json["shadePrimaryColor"]),
      hintColor: Color(json["hintColor"]),
      cloudBackground: Color(json["conBackground"])
  );

  Map<String, dynamic> toJson() => {
    "isDark": isDark,
    "primaryColor": primaryColor.value,
    "successColor": rainingColor.value,
    "backGroundColor": backGroundColor.value,
    "darkGreyColor": darkGreyColor.value,
    "lightGreyColor": lightGreyColor.value,
    "shadePrimaryColor": shadePrimaryColor.value,
    "warningColor": sunnyDayColor.value,
    "mainTextColor": mainTextColor.value,
    "bodyTextColor": bodyTextColor.value,
  };


  @override
  ThemeModel lerp(ThemeExtension<ThemeModel>? other, double t) {
    if (other is! ThemeModel) {
      return this;
    }
    return SharedPref.getTheme()??defaultTheme;
  }
}