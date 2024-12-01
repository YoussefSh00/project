import 'dart:developer';
// import 'package:alice/alice.dart';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:royal_home/core/services/remote/Interceptor.dart';
import 'package:royal_home/core/services/remote/service_locator.dart';
import 'package:royal_home/core/utils/app_helper_functions.dart';
import 'package:royal_home/features/auth/data/auth_repository.dart';
import 'package:royal_home/flavors.dart';

class ApiService {
  final Dio _dio = Dio();
  final _baseUrl = 'https://api.royalhomedev.online/royal-home/';
  final String appVersion = '1';
  Alice alice = Alice(navigatorKey: navigatorKeyAlice);

  ApiService() {
    _dio.options.baseUrl = _baseUrl;
    if (F.appFlavor == Flavor.dev) {
      _dio.interceptors.add(alice.getDioInterceptor());
    }

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (Object? object) => log(object.toString(), name: 'HTTP'),
        ),
      );
    }
    _dio.interceptors.add(AuthInterceptor(dio: _dio));
  }
  Future<Response> get(String url,
      {Map<String, dynamic>? params, bool requiresAuth = true}) async {
    var s = await locator<AuthRepository>().getAccessToken();
    return await _dio.get(url,
        queryParameters: params,
        options: Options(extra: {
          "requiresAuth": requiresAuth
        }, headers: {
          "x-api-version": appVersion,
        }));
  }

  Future<Response> post(String url, dynamic data,
      {bool requiresAuth = true}) async {
    return await _dio.post(url,
        data: data,
        options: Options(
            extra: {"requiresAuth": requiresAuth},
            headers: {"x-api-version": appVersion}));
  }

  Future<Response> put(String url, dynamic data,
      {bool requiresAuth = true}) async {
    return await _dio.put(url,
        data: data,
        options: Options(
            extra: {"requiresAuth": requiresAuth},
            headers: {"x-api-version": appVersion}));
  }

  Future<Response> delete(String url,
      {dynamic data, bool requiresAuth = true}) async {
    return await _dio.delete(url,
        data: data,
        options: Options(
            extra: {"requiresAuth": requiresAuth},
            headers: {"x-api-version": appVersion}));
  }

  Future<Response> patch(String url, dynamic data,
      {bool requiresAuth = true}) async {
    return await _dio.patch(url,
        data: data,
        options: Options(
            extra: {"requiresAuth": requiresAuth},
            headers: {"x-api-version": appVersion}));
  }

  Future<Response> refreshToken(String refreshToken) async {
    log('----------refresh Token called -------------');
    var response = await _dio.post("users/user/auth/private-auth/refresh-token",
        options: Options(extra: {
          "requiresAuth": false
        }, headers: {
          "Authorization": 'Bearer $refreshToken',
          "x-api-version": appVersion
        }));

    return response;
  }
}
