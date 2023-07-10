import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shopping/utils/custon_textfield.dart';
import 'package:online_shopping/utils/constants.dart';
import 'package:online_shopping/views/auth_screen/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../starter/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RegExp regPass = RegExp(r"^.{6,}$");
  RegExp regEmail = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
  @override
  Widget build(BuildContext context) {
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
                      CustomTextField(
                        controller: emailController,
                        labelText: "EMAIL",
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ("Field cannot be empty");
                          }
                          if (!regEmail.hasMatch(value)) {
                            return ("Please Enter a valid email");
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        controller: passwordController,
                        keyboardType: TextInputType.numberWithOptions(),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ("Password is required for login");
                          }
                          if (!regPass.hasMatch(value)) {
                            return ("Enter Valid Password(Min.6 Character)");
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        labelText: "PASSWORD",
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
                                backgroundColor: Color.fromRGBO(240, 218, 151, 1.0),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                logIn();
                              },
                              child: Row(
                                children: [
                                  Text("LOGIN",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.black,
                                  )
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
              password: passwordController.text.trim())
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
