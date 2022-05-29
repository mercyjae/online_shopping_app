import 'package:flutter/material.dart';

import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "title": "Purchase your order online",
      "image": "assets/images/onboard1.png",
      "subtitle": "Buy your products safely and easily ",
    },
    {
      "title": "Choose in-store pick-up",
      "image": "assets/images/onboard2.png",
      "subtitle": "Store your products for pick-up",
    },
    {
      "title": "Or, choose home delivery",
      "image": "assets/images/onboard3.png",
      "subtitle": "Your products are delivered\n home safely and securely",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    return SplashContent(
                        title: splashData[index]["title"] as String,
                        image: splashData[index]["image"] as String,
                        subtitle: splashData[index]["subtitle"] as String);
                  }),),
          Expanded(flex: 1,
            child: Column(
              children: [Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      splashData.length, (index) => buildDot(index: index)),
                ),Spacer(flex: 2,),
                Container(
                  height: 50,
                  width: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 223, 216, 156),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                      },
                      child: Text("LET'S GO SHOPPING")),
                ),
                Spacer(),
              ],
            ),
          )

        ],
      )),
    );
  }

  Container buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.all(3),
      width: currentPage == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Color.fromARGB(255, 223, 216, 156)
            : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

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
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),SizedBox(height: 10,),
        Text(subtitle,style: TextStyle(color: Colors.black,fontSize: 15),),
       
      ],
    );
  }
}
