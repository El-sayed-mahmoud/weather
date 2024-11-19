import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:templete/Utilities/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
class FormatDateHelper {

  static  final formatDate= DateFormat('d/M/yyyy',SharedPref.getLanguage());
  static  final formatDateMyOrder= DateFormat("d MMMM، hh:mm a",SharedPref.getLanguage());
  static  final formatDayAndDate= DateFormat('EEEE d MMMM',SharedPref.getLanguage());

  static String getTimeAgo(DateTime? time, {bool short = false,required BuildContext context}) {
    if (time == null) return "";
    String currentLng = Localizations.localeOf(context).languageCode;
    bool isAr = currentLng == "ar";
    timeago.setLocaleMessages(
      "$currentLng${short ? "_short" : ""}",
      (short && isAr)
          ? timeago.ArShortMessages()
          : (short && !isAr)
          ? timeago.EnShortMessages()
          : (isAr)
          ? timeago.ArMessages()
          : timeago.EnMessages(),
    );
    return timeago.format(time, locale: "$currentLng${short ? "_short" : ""}");
  }
  static getDifferenceDate({required DateTime? date}) {
    return DateTime.now().difference(date!).inDays;
  }
  static Future <(bool,int)> checkTodayOpen() async {
    if (await SharedPref.getTodayOpen() != null && SharedPref.getWeatherData() != null) {
      String? today = await SharedPref.getTodayOpen();
      DateTime openDate = DateTime.tryParse(today!)!;
      int localDifferenceDate = getDifferenceDate(date: openDate);
      if (localDifferenceDate == 0) {
        return (true,localDifferenceDate);
      }
    }
    return (false,1);
  }
}