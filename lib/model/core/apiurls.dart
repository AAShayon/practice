
class Apiurls{
   static String categoryName='';
   static String productId='';
   String baseUrl='https://dummyjson.com/';
   String login='auth/login';
   String products='products';
   String singleProducts='products/$productId';
   String searchProduct='products/search';

   String allCategory='/products/categories';
   String categoryProduct='products/${categoryName}';
}