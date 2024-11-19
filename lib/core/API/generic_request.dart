
import '../API/request_method.dart';

class GenericRequest<T>{
  T Function(Map<String, dynamic> json) fromMap;
  RequestApi method;

  GenericRequest({required this.fromMap,required this.method});

  Future<T> getObject() async {
    Map<String,dynamic> response;
    if(method.body.isNotEmpty){
      response = await method.request();
    }else{
      response = await method.requestJson();
    }
    if(_isPrimitive(response["data"])){
      return fromMap({});
    }
    return fromMap(response["data"]);
  }

  Future<List<T>> getList() async {
    Map<String,dynamic> response;
    if(method.body.isNotEmpty){
      response = await method.request();
    }else{
      response = await method.requestJson();
    }
    if(_isPrimitive(response["list"])){
      return [];
    }
    if(response["list"] is List) return List<T>.from(response["list"].map((e)=> fromMap(e)));
    return List<T>.from(response["list"]["list"].map((e)=> fromMap(e)));
  }

  Future<T> getResponse() async {
    Map<String,dynamic> response;
    if(method.body.isNotEmpty){
      response = await method.request();
    }else{
      response = await method.requestJson();
    }
    return fromMap(response);
  }

  bool _isPrimitive(dynamic response){
    return (response == null || [String,num,bool].contains(response.runtimeType));
  }
}
