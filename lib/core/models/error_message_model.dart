import 'package:dio/dio.dart';

class ErrorMessageModel{
 String? message;
  ErrorMessageModel(DioException e){
      message = e.response?.data["localizedMessage"]["en"];
  }
}