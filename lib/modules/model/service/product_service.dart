import 'package:dio/dio.dart';
import 'package:e_commerce_dummy_json/model/core/apiurls.dart';
import 'package:e_commerce_dummy_json/model/service/remote/api_response.dart';
import 'package:e_commerce_dummy_json/model/service/remote/dio_service.dart';

abstract class ProductService{
  Future<ApiResponse> getAllProducts(dynamic limit, dynamic skip);

}
class ProductServiceRemoteDataSource extends ProductService{
  static final ProductServiceRemoteDataSource _singleton=ProductServiceRemoteDataSource._internal();
  late final DioService? _dioService;

  factory ProductServiceRemoteDataSource(){
    return _singleton;
  }

  ProductServiceRemoteDataSource._internal(){
    _dioService=DioService();
  }

  @override
  Future<ApiResponse> getAllProducts(dynamic limit,dynamic skip) async{
    try{
      Response? response= await _dioService!.get(Apiurls().products,queryParameter: {
        'limit':limit,
        'skip':skip
      });
      return ApiResponse.withSuccess(response!);
    }catch(e){
     return ApiResponse.withError(e);
    }
  }

}