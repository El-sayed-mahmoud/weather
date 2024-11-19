import 'package:dartz/dartz.dart';
import '../../Models/data_model.dart';
import '../../Models/user_model.dart';
import '../../Models/weather_model.dart';
import '../../Utilities/api_end_point.dart';
import '../../core/API/generic_request.dart';
import '../../core/API/request_method.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';

class WeatherDataHandler{
  static Future<Either<Failure,DataModel>> getWeather()async{
    try {
      DataModel response = await GenericRequest<DataModel>(
        method: RequestApi.get(url: APIEndPoint.weather),
        fromMap:(_)=> DataModel.fromJson(_),
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}