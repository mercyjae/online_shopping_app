import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/views/auth_screen/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final emailField =
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: KDefaultPadding, vertical: KDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Please sign in to continue",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15)),
                      SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) return "Enter a valid email";
                          },
                          autofocus: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                              ),
                              labelText: "EMAIL",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 13),
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              focusColor: Colors.black,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: TextFormField(
                          obscureText: true,
                          controller: paswordController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Password cannot be empty";
                          },
                          autofocus: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.grey,
                              ),
                              labelText: "PASSWORD",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 13),
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              focusColor: Colors.black,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                            activeColor: Color.fromRGBO(240, 218, 151, 1.0),
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text("Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 210.0),
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(240, 218, 151, 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(240, 218, 151, 1.0),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                logIn();
                              },
                              child: Row(
                                children: [
<<<<<<< HEAD
                                  Text("LOGIN",                                      style: TextStyle(
=======
                                  Text("LOGIN",
                                      style: TextStyle(
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 5,
                                  ),
<<<<<<< HEAD
                                  Icon(Icons.arrow_forward_rounded, color: Colors.black,)
=======
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.black,
                                  )
>>>>>>> 16f7b452829527a2c96893f8db6b564edc8b3ab3
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Don't have an account?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              SizedBox(
                                width: 3,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()));
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 218, 151, 1.0),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Or, Log in with",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 218, 151, 1.0)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/facebook.png",
                      width: 50,
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      "assets/images/twitter.png",
                      width: 50,
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      "assets/images/google.png",
                      width: 50,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logIn() async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: paswordController.text.trim())
          .then((value) async {
        Fluttertoast.showToast(msg: "Login successfully");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("email", emailController.text);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      Fluttertoast.showToast(msg: "Incorrect Details");
    }
  }
}
