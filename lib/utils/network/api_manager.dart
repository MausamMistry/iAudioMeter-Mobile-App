import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:iaudiometer/services/auth_service.dart';
import 'package:iaudiometer/views/splash/splash_ctrl.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/common_utils.dart';
import 'package:iaudiometer/utils/network/api_config.dart';
import 'package:iaudiometer/utils/network/api_response.dart';
import 'package:iaudiometer/utils/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Dio dio = Dio();

enum ApiType { get, post, put, delete }

class ApiManager {
  Future get(String endpoint) async {
    try {
      log("Requesting to: $endpoint");
      dynamic response = await dio.get(endpoint);
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }

  ApiManager() {
    dio.options
      ..baseUrl = APIConfig.apiBaseURL
      ..validateStatus = (int? status) {
        return status! > 0;
      }
      ..headers = {'Accept': 'application/json', 'content-type': 'application/json'};
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        // ignore: deprecated_member_use
        onError: (DioError e, handler) {
          if (kDebugMode) {
            print("interceptors onError : ${e.toString()}");
          }
          _errorThrow(e);
          return handler.next(e);
        },
      ),
    );
  }

  // ignore: missing_return
  Future<APIResponse> call(String apiName, body, type) async {
    APIResponse apiData = APIResponse(message: 'Something went wrong!', data: 0, status: 0);
    try {
      bool isInternet = await commonUtil.isNetworkConnection();
      if (isInternet) {
        //set authorization to headers
        AuthService authService = Get.find();
        if (authService.token!.value != '') {
          dio.options.headers["Authorization"] = "Bearer ${authService.token!.value}";
        }
        dynamic response;
        log("Api Name :${APIConfig.apiBaseURL}$apiName");
        log("AuthToken :${dio.options.headers["Authorization"]}");
        log("Request :$body");
        switch (type) {
          case ApiType.post:
            response = await dio.post(apiName, data: body);
            break;
          case ApiType.delete:
            response = await dio.delete(apiName, data: body);
            break;
          case ApiType.put:
            response = await dio.put(apiName, data: body);
            break;
        }
        log("Response...$response");
        apiData = await _checkStatus(response, apiName);
      } else {
        commonUtil.goToNoInternetScreen();
      }
      return apiData;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      _errorThrow(e);
      return apiData;
    } on SocketException catch (e) {
      onSocketException(e);
      return apiData;
    } on Exception catch (e) {
      onException(e);
      return apiData;
    }
  }

  Future<APIResponse> _checkStatus(response, apiName) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return APIResponse.fromJson(response.data);
    } else if (response.statusCode == 422 || response.statusCode == 404) {
      _errorShow(response, apiName);
      return APIResponse.fromJson(response.data);
    } else if (response.statusCode == 401) {
      _errorShow(response, apiName);
      return APIResponse.fromJson(response.data);
    } else {
      _errorShow(response, apiName);
      return APIResponse.fromJson({"message": response.statusMessage, "data": 0, "status": response.statusCode});
    }
  }

  onSocketException(e) => log("API : SocketException - ${e.toString()}");

  onException(e) => log("API : Exception - ${e.toString()}");

  // ignore: deprecated_member_use
  _errorThrow(DioError err) async {
    var errorShow = {
      "StatusMessage": err.response!.statusMessage,
      "Status": err.response!.statusCode,
      "Api": err.response!.realUri,
    };
    throw Exception(errorShow);
  }

  _errorShow(response, apiName) async {
    var errorShow = {
      "StatusMessage": response.statusMessage,
      "Status": response.statusCode,
      "Api": "${APIConfig.apiBaseURL}$apiName",
    };
    if (response != null && errorShow["Status"] != null && errorShow["Status"] == 401) {
      await clearStorage();
      Get.offNamedUntil(AppRouteNames.splash, (Route<dynamic> route) => false);
      Get.put(SplashCtrl(), permanent: true).onReady();
    }
  }
}
