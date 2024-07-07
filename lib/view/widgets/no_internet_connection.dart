
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidget extends StatelessWidget {
  final dynamic onPressed;
  const NoInternetWidget({super.key,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 30.h,),

                  Text("No internet !!!",style: TextStyle(color: Colors.greenAccent),),
                  SizedBox(height: 5.h,),
                  Text("Please Check your internet connection",style: TextStyle(color: Colors.greenAccent),),
                  SizedBox(height: 20.h,),

                  ElevatedButton(child:Text( 'Try Again'), onPressed: onPressed)

                ],
              ),
            ],
          ))),
    );
  }
}
