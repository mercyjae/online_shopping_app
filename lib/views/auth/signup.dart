import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shopping/utils/custom_button.dart';
import 'package:online_shopping/utils/custon_textfield.dart';
import 'package:online_shopping/utils/constants.dart';
import 'package:online_shopping/views/auth/login.dart';
import '../starter/home_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  RegExp regPass = RegExp(r"^.{6,}$");
  RegExp regEmail = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: KDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ("Field is required");
                            }
                            if (!regPass.hasMatch(value)) {
                              return ("Enter 6 characters");
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          labelText: "First Name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ("Field is required");
                            }
                            if (!regPass.hasMatch(value)) {
                              return ("Enter 6 characters");
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          labelText: 'Last Name',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
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
                          labelText: "Email",
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
                          textInputAction: TextInputAction.next,
                          labelText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.numberWithOptions(),
                          validate: (value) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return "Password doesn't match";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.done,
                          labelText: " Confirm Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(buttonText: 'SINGUP', onPressed: (){}),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Align(alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Already have an account?",
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
                                            builder: (context) => HomeScreen()));
                                  },
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(240, 218, 151, 1.0)),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) {
        Fluttertoast.showToast(msg: "Account created successfully");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    } else {
      Fluttertoast.showToast(msg: "Incorrect Details");
    }
  }
}
