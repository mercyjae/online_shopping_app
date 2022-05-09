import 'package:flutter/material.dart';
import 'package:online_shopping/constants.dart';

import 'home_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController firstNameController =  TextEditingController();
  final TextEditingController lastNameController =  TextEditingController();
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController paswordController =  TextEditingController();
  final TextEditingController confirmPasswordController =  TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:
    AppBar(backgroundColor: Colors.white,elevation: 0,
      leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
        Navigator.pop(context);
      },),),
      body: SingleChildScrollView(
        child: Form(key: formKey,
          child: Column(children:[
            SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:KDefaultPadding),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Account",
                style: TextStyle(color: Colors.black,fontSize: 25,fontWeight:FontWeight.bold),),
                SizedBox(height: 30,),
                Card(
                  child: TextFormField(controller: firstNameController,
                    autofocus:true,style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.grey,
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.person,color: Colors.grey,),
                    labelText: "First Name",floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey,fontSize: 13),
                        labelStyle: TextStyle( color:  Colors.grey,fontSize: 13),
                        focusColor: Colors.black,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2,color: Colors.white)),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Colors.white),
                      ) ),),
                ),
                Card(
                  child: TextFormField( controller: lastNameController,
                    autofocus:true,style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.grey,
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.person,color: Colors.grey,),
                        labelText: "Last Name",floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey,fontSize: 13),
                        labelStyle: TextStyle( color:  Colors.grey,fontSize: 13),
                        focusColor: Colors.black,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2,color: Colors.white)),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Colors.white),
                        ) ),),
                ),
                Card(
                  child: TextFormField(controller: emailController,
                    autofocus:true,style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.grey,
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                     labelText: "Email", floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey,fontSize: 13),
                        labelStyle: TextStyle( color:  Colors.grey,fontSize: 13),
                        focusColor: Colors.black,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2,color: Colors.white)),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Colors.white),
                      ) ),),
                ),
                SizedBox(height: 10,),
                Card(
                  child: TextFormField( controller: paswordController,
                    autofocus:true,style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.grey,
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.vpn_key,color: Colors.grey,),
                      labelText: "Password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey,fontSize: 13),
                        labelStyle: TextStyle( color:  Colors.grey,fontSize: 13),
                        focusColor: Colors.black,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide
                            (width: 2,color: Colors.white)),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Colors.white),)
                  ), ),
                ),
                Card(
                  child: TextFormField(controller: confirmPasswordController,
                    autofocus:true,style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.grey,
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.vpn_key,color: Colors.grey,),
                 labelText: " Confirm Password",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey,fontSize: 13),
                      labelStyle: TextStyle( color:  Colors.grey,fontSize: 13),
                      focusColor: Colors.black,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2,color: Colors.white)),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Colors.white),)
                  ), ),
                ),SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 198.0),
                  child: Container(
                    height: 50,width: 120,
                    decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.lightBlue,Colors.blue]),
                        borderRadius: BorderRadius.circular(12)),
                    child: ElevatedButton(style:
                    ElevatedButton.styleFrom(primary: Colors.transparent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                      ),),
                        onPressed: (){},
                        child: Row(
                          children: [
                            Text("SIGNUP"),SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        )),
                  ),
                ),SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey)),
                    SizedBox(width: 3,),
                    InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));},
                        child: Text("Log in",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),))
                  ],)
              ],
            ),
          ),

    ],),
        ),
      ),);
  }
}
