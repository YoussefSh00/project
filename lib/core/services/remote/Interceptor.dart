
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:royal_home/core/services/remote/service_locator.dart';
import 'package:royal_home/core/utils/app_helper_functions.dart';
import 'package:royal_home/features/auth/UI/screens/login_screen.dart';
import 'package:royal_home/features/auth/data/auth_repository.dart';
import 'package:royal_home/features/auth/data/models/user_respones.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  Future? refreshFuture;
  final Dio dio;
  AuthInterceptor({required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("Request [${options.method}] => PATH: ${options.path}");

    if (options.extra["requiresAuth"] == false) {
      return handler.next(options);
    }

    var accessToken = await locator<AuthRepository>().getAccessToken();

    if (isTokenExpired(accessToken!)) {
      var refreshToken = await locator<AuthRepository>().getRefreshToken();

      if (isTokenExpired(refreshToken!)) {
        navigatorKeyAlice.currentState?.pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        return handler.next(options);
      }
      if (refreshFuture == null) {
        refreshFuture = _handleRefreshtoken(refreshToken);
        try {
          await refreshFuture;
        } finally {
          refreshFuture = null;
        }
      } else {
        await refreshFuture;
      }
      var newAccessToken = await locator<AuthRepository>().getAccessToken();
      options.headers["Authorization"] = "Bearer $newAccessToken";
    } else {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "Response [${response.statusCode}] => PATH: ${response.requestOptions.path}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
        "Error [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");

    super.onError(err, handler);
  }

  Future<void> _handleRefreshtoken(String refreshToken) async {
    var response = await dio.post(
      "users/user/auth/private-auth/refresh-token",
      options: Options(extra: {
        "requiresAuth": false
      }, headers: {
        "Authorization": 'Bearer $refreshToken',
        "x-api-version": "1"
      }),
    );

    final authResponse = UserResponse.fromJson(response.data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', authResponse.accessToken!);
    await prefs.setString('refreshToken', authResponse.refreshToken!);
  }
}
