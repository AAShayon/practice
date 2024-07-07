
import 'package:e_commerce_dummy_json/modules/viewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productsViewModel = Provider.of<ProductViewModel>(context, listen: false);
      productsViewModel.resetLimit();
      productsViewModel.clearList();
      _loadData(context, isRefresh: true, isLoadMore: false);
      scrollController.addListener(_scrollListener);
    });
  }

  Future<void> _loadData(BuildContext context, {required bool isRefresh, required bool isLoadMore}) async {
    final productsViewModel = Provider.of<ProductViewModel>(context, listen: false);
    await productsViewModel.getProductList(context, isLoadMore: isLoadMore);
  }

  void _scrollListener() {
    final productsViewModel = Provider.of<ProductViewModel>(context, listen: false);
    final isLoading = productsViewModel.isLoading;
    if (!isLoading && scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      productsViewModel.incrementPage();
      _loadData(context, isRefresh: false, isLoadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce Dummy', style: Theme.of(context).textTheme.labelMedium),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, productViewModel, Widget? child) {
          final products = productViewModel.products;
          return Container(
            color: Colors.white,
            child: products.isNotEmpty
                ? ListView.builder(
              controller: scrollController,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text('${product.title}'),
                );
              },
            )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

// import 'package:e_commerce_dummy_json/modules/viewModel/product_view_model.dart';
// import 'package:e_commerce_dummy_json/view/widgets/no_internet_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:provider/provider.dart';
// class ProductsScreen extends StatefulWidget {
//   const ProductsScreen({super.key});
//
//   @override
//   State<ProductsScreen> createState() => _ProductsScreenState();
// }
//
// class _ProductsScreenState extends State<ProductsScreen> {
//   final ScrollController scrollController=ScrollController();
//   @override
//   void initState() {
//     super.initState();
//     final productViewModel=Provider.of<ProductViewModel>(context,listen: false);
//     productViewModel.resetLimit();
//     productViewModel.clearList();
//     _loadData(context,isLoadMore: false,isRefresh: true);
//     scrollController.addListener(_scrollController);
//   }
//   Future<void> _loadData(BuildContext context,{required bool isLoadMore,required bool isRefresh})async{
//     final productViewModel=Provider.of<ProductViewModel>(context,listen: false);
//     await productViewModel.getAllProducts(context, isLoadMore: isLoadMore);
//   }
//   void _scrollController(){
//     final productViewModel=Provider.of<ProductViewModel>(context,listen: false);
//     if(!productViewModel.isLoading && scrollController.position.pixels == scrollController.position.maxScrollExtent){
//       productViewModel.incrementPage();
//       _loadData(context,isLoadMore: true, isRefresh: false);
//     }
//     print('Scrolling');
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductViewModel>(builder: (context,productViewModel,child){
//       return  Scaffold(
//         appBar: AppBar(
//           title: const Text('Ecommerce DummyJson'),
//         ),
//         body: Padding(
//           padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
//           child: Container(
//             height: 800.h,
//             width: 380.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: Colors.black,width: 1.w
//               ),
//               color: Colors.transparent,
//             ),
//             child: ListView(
//               controller: scrollController,
//               children: [
//                 SizedBox(height: 20.h,),
//                 productViewModel.products.isNotEmpty ?
//                 ListView.builder(
//                   itemCount: productViewModel.products.length,
//                     itemBuilder:(context ,index){
//                     final product=productViewModel.products[index];
//                       return ListTile(
//                         leading: Text('${index +1 }',style: TextStyle(color: Colors.black),),
//                         title: Text("${product.title}"),
//                       );
//                     } ):const Center(child: CircularProgressIndicator(),),
//
//               productViewModel.isLoading ? const Center(child: CircularProgressIndicator(),):const SizedBox.shrink(),
//                 SizedBox(height: 30.h,)
//               ],
//             ),
//           ),
//         )
//       );
//
//     });
//   }
// }
