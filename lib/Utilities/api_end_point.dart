
import '../Models/server_model.dart';

class APIEndPoint{
  static final ServerModel _apiServer = ServerModel(serverIsSecured: false, host: "api.openweathermap.org", apiPrefix: "data");
  // static const String baseServerURL = "https://********.com";
  // static const String _baseURL = "$baseServerURL/api/v1/";

  static String get _baseURL => _apiServer.baseUrl;

  //=========================== api User ====================================
  static String get weather => "$_baseURL/2.5/forecast?id=292223&appid=bf63a2cdc2a49930ff54aaa0aaa48be8";
  static String  image(String? icon) => "https://openweathermap.org/img/wn/$icon.png";
  static String get test => "$_baseURL/todos";
}



