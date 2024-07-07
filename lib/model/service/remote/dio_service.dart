import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_dummy_json/model/core/apiurls.dart';

class DioService {
  static final DioService _singleton = DioService._internal();
  late final Dio? _dio;

  factory DioService(){
    return _singleton;
  }

  DioService._internal(){
    setup();
  }

  Future<void> setup() async {
    try {
      _dio = Dio(
          BaseOptions(
            baseUrl: Apiurls().baseUrl,
          )
      );
      _dio!.interceptors.add(LogInterceptor(responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true));
    } catch (e) {
      log('$e');
    }
  }
 Future<Response?> get(String path,{Map<String ,dynamic>? queryParameter}) async{
    try{
      final response=await _dio!.get(path,queryParameters: queryParameter);
      return response;
    }on FormatException catch(_){
      throw const FormatException('Unable to Process');
    }catch(e){
      throw e;
    }

 }


}