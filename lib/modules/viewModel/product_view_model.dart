// import 'dart:developer';
//
// import 'package:e_commerce_dummy_json/model/service/remote/api_response.dart';
// import 'package:e_commerce_dummy_json/modules/model/core/response_body/product_list_respponse_model.dart';
// import 'package:e_commerce_dummy_json/modules/model/service/product_service.dart';
// import 'package:flutter/material.dart';
//
// class ProductViewModel extends ChangeNotifier {
//   final ProductService _productService = ProductServiceRemoteDataSource();
//
//   bool _isLoading = false;
//   ProductListRespponseModel? _productListRespponseModel;
//   List<Products> _product = [];
//   List<Products>? _newProducts;
//   int _limit = 30;
//   int _page = 0; // Page counter for pagination
//
//   void resetLimit() {
//     _limit = 30;
//     _page = 0;
//     notifyListeners();
//   }
//
//   void incrementPage() {
//     _page += 1;
//     notifyListeners();
//   }
//
//   void clearList() {
//     _product.clear();
//     notifyListeners();
//   }
//
//   bool get isLoading => _isLoading;
//   ProductListRespponseModel? get productListResponseModel => _productListRespponseModel;
//   List<Products> get products => _product;
//   List<Products>? get newProducts => _newProducts;
//   int get limit => _limit;
//   int get page => _page;
//
//   Future<bool> getProductList(BuildContext context, {required bool isLoadMore}) async {
//     _isLoading = true;
//     bool isDone = false;
//     _productListRespponseModel = null;
//
//     if (isLoadMore) {
//       _isLoading = true;
//     } else {
//       _product = [];
//     }
//
//     notifyListeners();
//
//     try {
//       final skip = _page * _limit;
//       final limit = _limit;
//       ApiResponse apiResponse = await _productService.getAllProducts(limit, skip);
//       if (apiResponse.responseValue != null) {
//         if (apiResponse.responseValue!.statusCode == 200) {
//           _productListRespponseModel = ProductListRespponseModel.fromJson(apiResponse.responseValue!.data);
//           _newProducts = _productListRespponseModel!.products;
//           _product = _product + _newProducts!;
//           log('$products');
//           isDone = true;
//           _isLoading = false;
//           notifyListeners();
//           if (context.mounted) {
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Center(child: Text('SuccessFull'))),
//             );
//           }
//         } else {
//           _isLoading = false;
//           isDone = false;
//           if (context.mounted) {
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Center(child: Text('${apiResponse.responseValue!.statusCode}')),
//             ));
//           }
//         }
//       } else {
//         _isLoading = false;
//         isDone = false;
//         notifyListeners();
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).removeCurrentSnackBar();
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Center(child: Text('${apiResponse.errorValue}')),
//           ));
//         }
//       }
//     } catch (e) {
//       _isLoading = false;
//       isDone = false;
//       notifyListeners();
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).removeCurrentSnackBar();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('$e'))));
//       }
//     }
//
//     notifyListeners();
//     return isDone;
//   }
// }

import 'package:e_commerce_dummy_json/model/service/remote/api_response.dart';
import 'package:e_commerce_dummy_json/modules/model/core/response_body/product_list_respponse_model.dart';
import 'package:e_commerce_dummy_json/modules/model/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _productService = ProductServiceRemoteDataSource();

  bool _isLoading = false;
  ProductListRespponseModel? _productListRespponseModel;
  List<Products> _products = [];
  List<Products>? _newProduct;
  int _limit = 30;
  int _page = 0;
  Map<int, int> _itemCounts = {};

  ///For pagination
  void resetLimit() {
    //if the apis have page then name resetPage
    _limit = 30;
    _page = 0;
    notifyListeners();
  }

  void incrementPage() {
    _page += 1; //and page will be ++_page
    notifyListeners();
  }

  void clearList() {
    _products.clear();
    notifyListeners();
  }

  ///getter

  bool get isLoading => _isLoading;

  List<Products> get products => _products;

  List<Products>? get newProducts => _newProduct;

  int get limit => _limit;

  int get page => _page;

  Map<int, int> get itemCounts => _itemCounts;

  Future<bool> getAllProducts(BuildContext context,
      {required bool isLoadMore}) async {
    _isLoading = true;
    bool isDone = false;
    _productListRespponseModel = null;
    if (isLoadMore) {
      _isLoading = true;
    } else {
      _products = [];
    }
    try {
      final skip = _limit * _page;
      final limit = _limit;

      ApiResponse apiResponse =
          await _productService.getAllProducts(limit, skip);
      if (apiResponse.responseValue != null) {
        if (apiResponse.responseValue!.statusCode == 200) {
          _productListRespponseModel = ProductListRespponseModel.fromJson(
              apiResponse.responseValue!.data);
          _newProduct = _productListRespponseModel!.products;
          _products = _products + _newProduct!;
          isDone = true;
          _isLoading = false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 3), content: Text('Successfull')));
          }
        } else {
          _isLoading = false;
          isDone = false;
          notifyListeners();
        }
      } else {
        _isLoading = false;
        isDone = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      isDone = false;
      notifyListeners();
    }
    notifyListeners();
    return isDone;
  }

  void incrementItemCounts(int index) {
    if (_itemCounts.containsKey(index)) {
      _itemCounts[index] = (_itemCounts[index] ?? 0) + 1;
    } else {
      _itemCounts[index] = 1;
    }
    notifyListeners();
  }

  void decrementItemCounts(int index) {
    if (_itemCounts.containsKey(index) && _itemCounts[index]! > 0) {
      _itemCounts[index] = (_itemCounts[index] ?? 0) - 1;
      if(_itemCounts[index]==0){
        _itemCounts.remove(index);
      }
    }
    notifyListeners();
  }

  int getTotalItem(int index) {
    return _itemCounts[index] ?? 0;
  }

  double getSubtotal() {
    double subtotal = 0.0;
    _itemCounts.forEach((count, index) {
      subtotal += (count * _products[index].price);
    });
    return subtotal;
  }
  double getVat(){
    double subtotal=getSubtotal();
    return subtotal*.05;
  }
  double getTotal(){
    double subtotal=getSubtotal();
    double vat=getVat();
    return subtotal + vat ;
  }
}
