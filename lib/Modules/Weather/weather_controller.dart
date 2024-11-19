import 'package:intl/intl.dart';
import 'package:state_extended/state_extended.dart';
import 'package:templete/Models/city_model.dart';
import 'package:templete/Modules/Weather/weather_data_handler.dart';
import 'package:templete/Utilities/shared_preferences.dart';
import 'package:templete/Utilities/toast_helper.dart';

import '../../Models/data_model.dart';
import '../../Models/weather_model.dart';
import '../../Utilities/format_date_helper.dart';

class WeatherController extends StateXController {
  factory WeatherController() => _this ??= WeatherController._();
  static WeatherController? _this;

  WeatherController._();

  bool loading = false;
  List<WeatherModel> weatherList = [];
  WeatherModel? specificWeatherDate;
  CityModel? city;
  DateTime? selectedDate;
  DataModel? weatherData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  init(DateTime date) async {
    selectedDate = date;
    (bool openDay, int differenceDate)? checkTodayOpen = await FormatDateHelper.checkTodayOpen();
    if (checkTodayOpen.$1) fetchLocalData(localDifferenceDate: checkTodayOpen.$2);
    if (!checkTodayOpen.$1) getWeatherData();
  }

  fetchLocalData({required int localDifferenceDate}) async {
    loading = true;
    setState(() {});
    weatherData = SharedPref.getWeatherData();
    city = weatherData?.city;
    specificWeatherDate = weatherData?.list.firstWhere((data) {
        return (selectedDate?.year == data.dtTxt?.year &&
            selectedDate?.month == data.dtTxt?.month &&
            selectedDate?.day == data.dtTxt?.day &&
            selectedDate?.hour == data.dtTxt?.hour);
      },
      orElse: () {
        return weatherData!.list.firstWhere(
          (data) => selectedDate!.isBefore(data.dtTxt!),
        );
      },
    );
    loading = false;
    setState(() {});
  }

  getWeatherData() async {
    setState(() {
      loading = true;
    });

    final result = await WeatherDataHandler.getWeather();
    result.fold((l) {
      ToastHelper.showError(message: l.message);
    }, (r) async {
      SharedPref.saveWeatherData(weatherData: r);
      SharedPref.saveTodayOpen(todayOpenDateTime: DateTime.now());
      DateTime openDate = DateTime.tryParse(await SharedPref.getTodayOpen() ?? '')!;
      final localDifferenceDate = FormatDateHelper.getDifferenceDate(date: openDate);
      fetchLocalData(localDifferenceDate: localDifferenceDate);
    });
    setState(() {
      loading = false;
    });
  }
}
