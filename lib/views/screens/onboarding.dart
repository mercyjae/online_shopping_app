import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/splash_content.dart';
import '../auth_screen/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            SplashContent(
                title: "Purchase your order online",
                image: "assets/images/onboard1.png",
                subtitle: "Buy your products safely and easily"),
            SplashContent(
              title: "Choose in-store pick-up",
              image: "assets/images/onboard2.png",
              subtitle: "Store your products for pick-up",
            ),
            SplashContent(
                title: "Or, choose home delivery",
                image: "assets/images/onboard3.png",
                subtitle:
                    "Your products are delivered\n home safely and securely"),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: TextButton(
                style: TextButton.styleFrom(
                    primary: Color.fromRGBO(240, 218, 151, 1.0),
                    backgroundColor: Color.fromRGBO(240, 218, 151, 1.0),
                    minimumSize: Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("showLogin", true);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) =>Login()));
                },
                child: Text(
                  "LET'S GO SHOPPING",
                  style: TextStyle(color: Colors.black,
                  fontSize: 15,
                          fontWeight: FontWeight.w600),
                )),
          )
          : Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)
                    ),
                    onPressed: () {
                      controller.jumpTo(2);
                    },
                  ),
                  Center(
                      child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.grey,
                        activeDotColor: Color.fromRGBO(240, 218, 151, 1.0)),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                  )),
                  TextButton(
                    child: Text("NEXT",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
