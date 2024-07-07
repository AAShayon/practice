
import 'package:e_commerce_dummy_json/modules/viewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: Consumer<ProductViewModel>(
          builder: (context, productViewModel, Widget? child) {
            final products = productViewModel.products;
            return ListView(
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
                    title: Text('${product.title}'),
                  );
                },
              )
                  : const Center(child: CircularProgressIndicator()),
              SizedBox(height: 30.h),
                productViewModel.isLoading ? const Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
              ]
            );
          },
        ),
      ),
    );
  }
}

