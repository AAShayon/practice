import 'package:dio/dio.dart';

class ApiResponse{
  final Response? responseValue;
  final dynamic errorValue;
  ApiResponse(this.responseValue,this.errorValue);
  ApiResponse.withSuccess(Response response):responseValue=response,errorValue=null;
  ApiResponse.withError(dynamic error):responseValue=null,errorValue=error;


}