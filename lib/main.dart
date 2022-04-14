import 'package:flutter/material.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/screens/cart_screen.dart';
import 'package:online_shopping/screens/home_screen.dart';
import 'package:online_shopping/screens/login.dart';
import 'package:online_shopping/screens/signup.dart';
import 'package:online_shopping/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
