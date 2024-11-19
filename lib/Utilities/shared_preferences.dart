import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:templete/core/Font/font_provider.dart';
import '../Models/data_model.dart';
import '../Models/weather_model.dart';
import '../core/Theme/theme_model.dart';
import '../Models/user_model.dart';

class SharedPref {
  static SharedPreferences get prefs => GetIt.instance.get<SharedPreferences>();
  static const String _language = "language_code";
  static const String _currentUserKey = "currentUser";
  static const String _themeKey = "theme";
  static const String _fontSizeKey = "font";
  static const String _fontFamilyKey = "font";
  static const String _weatherList = "weatherList";
  static const String _todayOpen = "_todayOpen";

  static UserModel? getCurrentUser() {
    if (prefs.getString(_currentUserKey) == null) return null;
    return UserModel.fromJson(json.decode(prefs.getString(_currentUserKey)!));
  }

  static Future<bool> saveCurrentUser({required UserModel user}) async {
    return await prefs.setString(_currentUserKey, json.encode(user.toJson()));
  }

  static bool isLogin() => prefs.getString(_currentUserKey) != null;

  static Future<void> logout() async => await prefs.remove(_currentUserKey);

  static ThemeModel? getTheme() {
    if (prefs.getString(_themeKey) == null) return null;
    return ThemeModel.fromJson(json.decode(prefs.getString(_themeKey)!));
  }

  static Future<void> setTheme({required ThemeModel theme}) async {
    await prefs.setString(_themeKey, json.encode(theme.toJson()));
  }

  static double? getFontSizeScale() {
    return prefs.getDouble(_fontSizeKey);
  }

  static Future<void> setFontSizeScale({required double fontSizeScale}) async {
    await prefs.setDouble(_fontSizeKey, fontSizeScale);
  }

  static Future setFontFamily({required FontFamilyTypes fontFamily}) async =>
      await prefs.setInt(_fontFamilyKey, fontFamily.index);

  static FontFamilyTypes? getFontFamily() =>
      prefs.getInt(_fontFamilyKey) == null
          ? null
          : FontFamilyTypes.values[prefs.getInt(_fontFamilyKey)!];

  static String? getLanguage() => prefs.getString(_language);

  static Future<void> setLanguage({required String lang}) async =>
      await prefs.setString(_language, lang);

  static Future<bool> saveWeatherData({required DataModel weatherData}) async {
    return await prefs.setString(
        _weatherList, json.encode(weatherData.toJson()));
  }

  static DataModel? getWeatherData() {
    if (prefs.getString(_weatherList) == null) return null;
    return DataModel.fromJson(json.decode(prefs.getString(_weatherList)!));
  }

  static Future<void> saveTodayOpen(
          {required DateTime todayOpenDateTime}) async =>
      await prefs.setString(_todayOpen, todayOpenDateTime.toIso8601String());

  static Future<String?> getTodayOpen() async => prefs.getString(_todayOpen);
}