import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/Theme/theme_model.dart';
import '../core/Theme/theme_provider.dart';

class ThemeClass extends ThemeModel{

  static ThemeModel of(BuildContext context) => Provider.of<ThemeProvider>(context,listen: false).appTheme;


  ThemeClass.defaultTheme({
    super.isDark= false,
    super.backGroundColor=const Color(0xff181A20),
    super.primaryColor= const Color(0xffF89300),
    super.shadePrimaryColor= const Color(0xffFEF4E6),
    super.mainTextColor= const Color(0xffFFFFFF),
    super.bodyTextColor= const Color(0xffFAFAFA),

    super.darkGreyColor= const Color(0xff9E9E9E),

    super.hintColor= const Color(0xffE0E0E0),

    super.lightGreyColor= const Color(0xffaaaaaa),
    super.sunnyDayColor=const Color(0xffEEBC9A),
    super.rainingColor= const Color(0xffB4DBE2),
    super.cloudBackground= const Color(0xFFADE4CE),
  });
}