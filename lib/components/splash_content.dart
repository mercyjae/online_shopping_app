

import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.title,
    required this.image,
    required this.subtitle,
  }) : super(key: key);
  final String title, image, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image,height: 450,),
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),SizedBox(height: 10,),
        Text(subtitle,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),

      ],
    );
  }
}
