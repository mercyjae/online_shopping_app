
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/views/home_screen.dart';
import 'package:online_shopping/views/signup.dart';

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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
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
                        if (value!.isEmpty) return "pls enter a valid email";
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
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
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
                      controller: paswordController,
                      validator: (value) {
                        if (value!.isEmpty) return "password cannot be empty";
                      },
                      autofocus: true,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          suffixText: "Forgot",
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
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 210.0),
                    child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.lightBlue]),
                          borderRadius: BorderRadius.circular(12)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () {
                            logIn();
                          },
                          child: Row(
                            children: [
                              Text("LOGIN"),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.arrow_forward_rounded)
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                                color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void logIn() async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(), password: paswordController.text.trim())
          .then((value) {
            Fluttertoast.showToast(msg: "Login successfully");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));});
      
    } else {
      Fluttertoast.showToast(msg: "Incorrect Details");
    }
  }
}
