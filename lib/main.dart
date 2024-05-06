import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/views/entrypoint.dart';

void main() {
  runApp(const MyApp());
}

Widget defaultHome = MainScreen();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Winter Foodly',
          theme: ThemeData(
              scaffoldBackgroundColor: kOffWhite,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: kOffWhite,
              ),
              iconTheme: const IconThemeData(color: kDark),
              primarySwatch: Colors.grey),
          home: child,
        );
      },
      child: defaultHome,
    );
  }
}
