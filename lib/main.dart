import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/views/starter/splash_screen.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  
  // final prefs = await SharedPreferences.getInstance();
  // final showLogin = prefs.getBool("showLogin") ?? false;
  // Future<bool> checkEmail() async {
  //   return prefs.containsKey('email');
  // }
  // final validEmail = await checkEmail();
  // print (validEmail);
  runApp(MyApp());

  //  showLogin: showLogin, validEmail: validEmail,


}
    

   class MyApp extends StatelessWidget {
 // final bool showLogin;
  // final bool validEmail;
  const MyApp({Key? key
    //required this.showLogin, required this.validEmail
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: 
        //showLogin ? HomeScreen(): validEmail ? Login()  :
        SplashScreen()
    );
        
  }
}
 
  
  