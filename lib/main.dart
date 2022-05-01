import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/views/home_screen.dart';
import 'package:online_shopping/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
