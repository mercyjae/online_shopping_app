
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String labelText;
  final int? maxlines;
  final Widget prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validate;
  final TextInputAction textInputAction;

  const CustomTextField({Key? key, this.maxlines,required this.prefixIcon, 
    required this.controller, required this.keyboardType, required this.validate,
     required this.textInputAction, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
                 child: TextFormField(
                  textInputAction: textInputAction,
                          controller: controller,
                          validator: validate,
                          autofocus: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          cursorColor: Colors.grey,
                          keyboardType: keyboardType,
                          decoration: InputDecoration(
                              prefixIcon:prefixIcon,
                              labelText: labelText,
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
    ],);
  }
}