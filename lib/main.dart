import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_llp/Screens/InitScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: 'Roboto', // Replace with your custom font
          ),
          home: Initscreen(),
        );
      },
    );
  }
}
