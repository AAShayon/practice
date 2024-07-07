import 'dart:developer';

import 'package:dio/dio.dart';

class ApiErrorHandler{
  static dynamic getErrorMessage(error){
    dynamic errorDescription='';
    if(error is Exception){
      log('Error Is Exception');
      try{
        if(error is DioException){
          log('Error is DioException');
          log('Check error : ${error.type}');
          switch(error.type){
            case DioExceptionType.cancel:
              errorDescription = "Request to server was cancelled";
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "bad certificate";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with server";
              break;
            case DioExceptionType.unknown:
              errorDescription = "Connection to server failed due to internet connection ";//${DioExceptionType.other.name}
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "Receive timeout in connection with server";
              break;
            case DioExceptionType.badResponse:
              errorDescription = "bad response";
              break;
            case DioExceptionType.connectionError:
              errorDescription = "connection error";
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "sendTimeout";
              break;
          }
        }else{
          errorDescription='Unexpected Error Come';
        }

      }on FormatException catch(e){
        errorDescription="$e Format Exception";
      }
    }
    else{
      errorDescription='Not a Subtype of error';
    }
      return errorDescription;
  }


}