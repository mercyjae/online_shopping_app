import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/views/auth_screen/login.dart';
import 'package:online_shopping/views/screens/home_screen.dart';
import 'package:online_shopping/views/screens/onboarding.dart';
<<<<<<< HEAD
import 'package:online_shopping/views/screens/splash_screen.dart';
=======
import 'package:online_shopping/views/splash_screen.dart';
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD
 await Firebase.initializeApp();
=======
  await Firebase.initializeApp();
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
  // final prefs = await SharedPreferences.getInstance();
  // final showLogin = prefs.getBool("showLogin") ?? false;
  // Future<bool> checkEmail() async {
  //   return prefs.containsKey('email');
  // }
  // final validEmail = await checkEmail();
  // print (validEmail);
  runApp(MyApp(
<<<<<<< HEAD
  //  showLogin: showLogin, validEmail: validEmail,
    ));

=======
      // showLogin: showLogin, validEmail: validEmail,
      ));
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
}

class MyApp extends StatelessWidget {
  // final bool showLogin;
  // final bool validEmail;
<<<<<<< HEAD
  const MyApp({Key? key, 
  //required this.showLogin, required this.validEmail
=======
  const MyApp({
    Key? key,
    //required this.showLogin, required this.validEmail
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD
        home: 
        //showLogin ? HomeScreen(): validEmail ? Login()  :
        SplashScreen()
    );
=======
        home:
            //showLogin ? HomeScreen(): validEmail ? Login()  :
            SplashScreen());
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
  }
}
