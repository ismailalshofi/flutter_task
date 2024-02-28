import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:mobile_test_task/database/local_data/shared_pref.dart';
import 'package:mobile_test_task/database/network/response_model.dart';
import 'package:mobile_test_task/database/network/server_config.dart';
import 'package:mobile_test_task/core/extensions/int_extensions.dart';
import 'Enumerations/body_type.dart';
import 'Enumerations/http_method.dart';

class NetworkService {
  Dio dio = Dio();

  Future sendRequest(
    String endPoint, {
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? body,
    BodyType bodyType = BodyType.formData,
    Map<String, String>? queryParameters,
  }) async {
    //
    // Set connection base url or host.
    dio.options.baseUrl = ServerConfig.baseUrl;
    //
    // Handle and replace query params.
    if (queryParameters != null) {
      dio.options.queryParameters = queryParameters;
    }
    //
    // Set send & receive timeout.
    dio.options.receiveTimeout = 30.seconds;
    dio.options.sendTimeout = 30.seconds;
    //
    // Content-Type header config.
    dio.options.headers.addAll(bodyType == BodyType.formData
        ? {HttpHeaders.contentTypeHeader: "multipart/form-data"}
        : {HttpHeaders.contentTypeHeader: "application/json"});
    //
    // Authorization header config.
    dio.options.headers.addAll( {'Authorization' : 'Bearer ${getStringAsync('token')}'});

    try {
      Response response;
      switch (method) {
        case HttpMethod.post:
          response = await dio.post(
            endPoint,
            data: getBody(body!, bodyType),
          );
          break;
        case HttpMethod.get:
          response = await dio.get(endPoint);
          break;
        case HttpMethod.delete:
          response = await dio.delete(endPoint);
          break;
        case HttpMethod.put:
          response = await dio.put(
            endPoint,
            data: getBody(body!, bodyType),
          );
          break;
        default:
          response = await dio.get(endPoint);
      }

      print('Response (${method.name.toString()}) ${response.statusCode.toString()}: ==> ${response.data.toString()}');

      //
      // Convert the response to a ResponseModel object 
      return ResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      //
      // Handle network exceptions
      String error = await handleResponse(e.response!);
      throw error;
    }
  }

  getBody(Map<String, dynamic> body, BodyType bodyType) {
    if (bodyType == BodyType.json) {
      return jsonEncode(body);
    } else {
      return FormData.fromMap(body);
    }
  }

  Future<String> handleResponse(Response response) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return 'No Internt Connection';
    }
    if (response.statusCode! >= 400 && response.statusCode! < 500) {
      ResponseModel res = ResponseModel.fromJson(response.data);
      return res.message;
    } else if (response.statusCode! >= 500) {
      return 'Server Error: ${response.statusCode}';
    } else {
      return 'Unknown Error: ${response.statusCode}';
    }
  }
}
