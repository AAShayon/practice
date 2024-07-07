import 'package:e_commerce_dummy_json/modules/view/products_screen.dart';
import 'package:e_commerce_dummy_json/modules/viewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp ,DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));
    return ScreenUtilInit(
      designSize: const Size(380, 800),
      minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child){
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context)=>ProductViewModel())
        ],child: StreamProvider<InternetConnectionStatus>(create: (_){
          return InternetConnectionChecker().onStatusChange;
        }, initialData: InternetConnectionStatus.connected),builder: (context ,child){
          return MaterialApp(
            title: 'E-Commerce DummyJson',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme:GoogleFonts.abelTextTheme(),
              appBarTheme: AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.grey.withOpacity(.8),
              ),
              scaffoldBackgroundColor: Colors.blue.withOpacity(.9),
              primaryTextTheme: GoogleFonts.abelTextTheme(),
            ),
            home:const ProductsScreen(),
          );
        },);
      },
    );
  }
}
