import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/controllers/dress_controller.dart';
import 'package:online_shopping/views_model/bag_product.dart';
import '../cart_screen.dart';

class DressDetails extends StatefulWidget {
  final Product dressproduct;
  DressDetails({Key? key, required this.dressproduct}) : super(key: key);
  @override
  State<DressDetails> createState() => _DressDetailsState();
}

class _DressDetailsState extends State<DressDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.dressproduct.color,
      appBar: AppBar(
        backgroundColor: widget.dressproduct.color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DressDetails1(
              dressproduct: widget.dressproduct,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.dressproduct.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(
                    widget.dressproduct.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Price\n",
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: "\$${widget.dressproduct.price}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ])),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 250,
                left: 100,
                right: 0,
                child: Container(
                    child: Image.asset(
                  widget.dressproduct.image,
                ))),
          ],
        ),
      ),
    );
  }
}

class DressDetails1 extends StatelessWidget {
  final cartController = Get.put(CartController());
  final Product dressproduct;
  DressDetails1({Key? key, required this.dressproduct}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(DressController());
    Get.find<DressController>()
        .initDressProduct(dressproduct, Get.find<CartController>());
    return GetBuilder<DressController>(builder: (dressController) {
      return Container(
        margin: EdgeInsets.only(top: size.height * 0.3),
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                "Colors",
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  ColorDot(
                    colors: dressproduct.color,
                    isSelected: false,
                  ),
                  SizedBox(
                    width: KDefaultPadding / 2,
                  ),
                  ColorDot(
                    colors: Colors.pinkAccent,
                    isSelected: false,
                  ),
                  SizedBox(
                    width: KDefaultPadding / 2,
                  ),
                  ColorDot(
                    colors: Colors.purple,
                    isSelected: false,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: KDefaultPadding / 2,
                        ),
                        Text(
                          "${dressproduct.size}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                dressproduct.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconSign(
                    icon1: Icons.remove,
                    press: () {
                      dressController.setQuantity(false);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${dressController.retrieveDressQuantityInCart}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconSign(
                    icon1: Icons.add,
                    press: () {dressController.setQuantity(true);},
                  ),Spacer(),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 13,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        border: Border.all(width: 1, color: Colors.blue)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.blue,
                          size: 20,
                        )),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        dressController.addDressItem(dressproduct);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                      },
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
