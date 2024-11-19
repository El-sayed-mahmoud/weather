import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../Utilities/shared_preferences.dart';
import '../error/exceptions.dart';
import '../network/error_message_model.dart';

 class RequestApi{
  final String url;
  final Uri? uri;
  final Map<String, String> body;
  final dynamic bodyJson;
  final List<http.MultipartFile> files;
  final Map<String, String>? headers;
  final bool disableDefaultHeaders;
  final String method;

  RequestApi.post({required this.url,required this.body,this.files = const[],this.headers,this.disableDefaultHeaders = false}): method = "POST",uri = null,bodyJson = {};
  RequestApi.postJson({required this.url,required this.bodyJson,this.files = const[],this.headers,this.disableDefaultHeaders = false}): method = "POST",uri = null,body = {};
  
  RequestApi.put({required this.url,required this.body,this.files = const[],this.headers,this.disableDefaultHeaders = false}): method = "PUT",uri = null,bodyJson = {};
  RequestApi.putJson({required this.url,required this.bodyJson,this.files = const[],this.headers,this.disableDefaultHeaders = false}): method = "PUT",uri = null,body = {};

  RequestApi.get({required this.url,this.headers,this.disableDefaultHeaders = false}): method = "GET",body = {},files = [],uri = null,bodyJson = {};
  RequestApi.getUri({required this.uri,this.headers,this.disableDefaultHeaders = false}): method = "GET",body = {},files = [],url = "",bodyJson = {};

  RequestApi.delete({required this.url,this.headers,this.disableDefaultHeaders = false}): method = "DELETE",body = {},files = [],uri = null,bodyJson = {};
  RequestApi.deleteUri({required this.uri,this.headers,this.disableDefaultHeaders = false}): method = "DELETE",body = {},files = [],url = "",bodyJson = {};

  RequestApi.customMethod({required this.method, this.bodyJson =const {},required this.url,this.headers,this.disableDefaultHeaders = false,this.files = const [],this.body = const {},}): uri = null;
  RequestApi.customMethodUri({required this.method,required this.uri,this.bodyJson = const {}, this.headers,this.disableDefaultHeaders = false,this.files = const [],this.body = const {},}): url="";


  Future<Map<String,dynamic>> request() async {
    debugPrint(url);
    debugPrint(body.toString());
    var request = MultipartRequest(method, uri??Uri.parse(url));
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }
    if(!disableDefaultHeaders) {
      request.headers.addAll({
        "Access-Control-Allow-Origin": "*",
        'Accept': 'application/json',
        'lang': SharedPref.getLanguage() ?? "en",
        // 'token': SharedPref.getCurrentUser()?.token??"",
      });
    }
    if (headers != null) request.headers.addAll(headers!);

    late http.StreamedResponse response;
    late Map<String,dynamic> resultBody;

    try {
      response = await request.send();
      log("status code: ${response.statusCode}");
      resultBody = json.decode(await response.stream.bytesToString()) as Map<String, dynamic>;
      log("Response Body: $resultBody");
      if(response.statusCode < 200 || response.statusCode >= 300 || resultBody["status"] == false){
        throw ServerException(
          errorMessageModel: ErrorMessageModel(
            statusCode: response.statusCode,
            statusMessage: resultBody["message"] ?? 'no message from server',
            success: resultBody["status"] ?? false,
          ),
        );
      }
    }catch(e){
      if(e is ServerException) rethrow;
      throw ServerException(
        errorMessageModel: const ErrorMessageModel(
          statusCode: 400,
          statusMessage: "something went wrong Exception",
          success: false,
        ),
      );
    }

    return resultBody;
  }

  Future<Map<String,dynamic>> requestJson() async {
    debugPrint(url);
    debugPrint(bodyJson.toString());
    var request = Request(method, uri??Uri.parse(url));
    request.body = json.encode(bodyJson);
    if(!disableDefaultHeaders) {
      request.headers.addAll({
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'lang': SharedPref.getLanguage() ?? "en",
        // "token": SharedPref.getCurrentUser()?.token??"",
      });
    }
    if (headers != null) request.headers.addAll(headers!);

    late http.StreamedResponse response;
    late Map<String,dynamic> resultBody;

    try {
      response = await request.send();
      log("status code: ${response.statusCode}");
      resultBody = json.decode(await response.stream.bytesToString()) as Map<String, dynamic>;
      log("Response Body: $resultBody");
      if(response.statusCode < 200 || response.statusCode >= 300 || resultBody["status"] == false){
        throw ServerException(
          errorMessageModel: ErrorMessageModel(
            statusCode: response.statusCode,
            statusMessage: resultBody["message"] ?? 'no message from server',
            success: resultBody["status"] ?? false,
          ),
        );
      }

    }catch(e){
      if(e is ServerException) rethrow;
      throw ServerException(
        errorMessageModel: const ErrorMessageModel(
          statusCode: 400,
          statusMessage: "something went wrong",
          success: false,
        ),
      );
    }

    return resultBody;
  }

 }
