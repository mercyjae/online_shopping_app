import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
         return  Scaffold(
          body:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("assets/images/sho.png"),
    SizedBox(height: 40,),
    Text("Welcome to Shox",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
            fontFamily: "Pacifico"),),
  SizedBox(height: 20,),
     Container(width: 200,height: 70,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.amberAccent),
       child: Center(
         child: Text("Let's improve your appearance",
           style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,),
           textAlign: TextAlign.center,),
       ),
     ),

          ],),
      );
  }
}
