
import 'package:flutter/material.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/products.dart';
import 'package:online_shopping/screens/detailsScreen1.dart';
class DetailsScreen extends StatefulWidget {
 final Product product;
  const DetailsScreen({Key? key,
    required this.product,
     }) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}
class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(backgroundColor:widget.product.color,
      appBar:
      AppBar(elevation: 0, backgroundColor:widget.product.color,
          leading:
          IconButton(icon: Icon(Icons.arrow_back_sharp, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },),
          actions: [
            IconButton(icon: Icon(Icons.search, color: Colors.white,),
              onPressed: () {},),
            IconButton(icon: Icon(
              Icons.add_shopping_cart_outlined, color: Colors.white,),
              onPressed: () {},),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
          Stack(
            children: [
              DetailsScreen1(product: widget.product),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Aristocratic Hand Bag",
                    style: TextStyle(color: Colors.white,fontSize: 15),),
                  Text("Office code", style: TextStyle(
                      fontSize: 35, color: Colors.white,fontWeight: FontWeight.bold
                  ),),SizedBox(height: 50,),
                  Row(children: [
                    RichText(text: TextSpan(children: [
                      TextSpan(
                          text: "Price\n", style: TextStyle(color: Colors.white)),
                      TextSpan(text: "\$234",style: TextStyle(color: Colors.white,fontSize: 20,
                          fontWeight:FontWeight.bold ))
                    ])),

                  ],)
                ],),
            ),  Positioned(bottom: 250,
                  top: 0 ,right: 0,left: 50,
                  child: Container(height: 50,width: 50,
                      child: Image.asset(widget.product.image)),),
          ],)
        ],),
      ),);
  }
}

