
import 'package:e_commerce_dummy_json/modules/viewModel/product_view_model.dart';
import 'package:e_commerce_dummy_json/view/widgets/no_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
    await productsViewModel.getAllProducts(context, isLoadMore: isLoadMore);
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
    return Consumer<ProductViewModel>(
      builder: (context,productViewModel,child) {
        final products=productViewModel.products;
        return RefreshIndicator(
          onRefresh: ()async{
            final product=Provider.of<ProductViewModel>(context,listen: false);
            setState(() {
         product.clearList();
         product.resetLimit();
            });
            await  _loadData(context, isRefresh: true, isLoadMore: false);
            Future<void>.delayed(const Duration(seconds: 2));

          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('E-commerce Dummy', style: Theme.of(context).textTheme.labelMedium),
            ),
            body:Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected?  NoInternetWidget(
              onPressed: ()async{
                _loadData(context, isRefresh: true, isLoadMore: false);
              },
            ):ListView(
                    controller: scrollController,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children:[ products.isNotEmpty
                      ? ListView.builder(
                    physics:  NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        leading: Text('${index + 1}'),
                        title: productViewModel.getTotalItem(index) > 0 ?Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: (){
                              productViewModel.decrementItemCounts(index);
                            }, icon: Icon(Icons.remove)),
                            Text('${productViewModel.getTotalItem(index)}'),
                            IconButton(onPressed: productViewModel.getTotalItem(index) <5?
                            ()async{
                              productViewModel.incrementItemCounts(index);
                              if(productViewModel.getTotalItem(index)==5){
                                return showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text("Exceed"),
                                  );
                                });
                              }
                            }:null
                                , icon: Icon(Icons.add))
                          ],
                        ) : InkWell(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 8.w),
                              child: const Text('Add To Cart'),
                            ),
                          onTap: (){
                              productViewModel.incrementItemCounts(index);
                          },
                        ),

                      );
                    },
                  )
                      : const Center(child: CircularProgressIndicator()),
                  SizedBox(height: 30.h),
                    productViewModel.isLoading ? const Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
                  ]
                )
          ),
        );
      }
    );
  }
}

