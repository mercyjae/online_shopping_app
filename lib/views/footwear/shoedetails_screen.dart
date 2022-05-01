import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/controllers/shoes_controller.dart';import 'package:online_shopping/views_model/bag_product.dart';

import '../cart_screen.dart';

class ShoeDetailsScreen extends StatefulWidget {
  final cartController = Get.put(CartController());
  final Product shoesproduct;
  ShoeDetailsScreen({Key? key, required this.shoesproduct}) : super(key: key);

  @override
  State<ShoeDetailsScreen> createState() => _ShoeDetailsScreenState();
}

class _ShoeDetailsScreenState extends State<ShoeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.shoesproduct.color,
      appBar: AppBar(
        backgroundColor: widget.shoesproduct.color,
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
            ShoesDetails1(
              shoesproduct: widget.shoesproduct,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.shoesproduct.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(
                    widget.shoesproduct.description,
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
                            text: "\$${widget.shoesproduct.price}",
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
                bottom: 350,
                left: 80,
                right: 0,
                child: Image.asset(
                  widget.shoesproduct.image,
                  width: 200,
                )),
          ],
        ),
      ),
    );
  }
}

class ShoesDetails1 extends StatelessWidget {
  final cartController = Get.put(CartController());
  final Product shoesproduct;
  ShoesDetails1({Key? key, required this.shoesproduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ShoesController());
    Get.find<ShoesController>().initShoeProduct(shoesproduct, Get.find<CartController>());
    return GetBuilder<ShoesController>(
      builder: (shoesController) {
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
                  "Color",
                  style:
                      TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ColorDot(
                      colors: shoesproduct.color,
                      isSelected: true,
                    ),
                    SizedBox(
                      width: KDefaultPadding / 2,
                    ),
                    ColorDot(
                      colors: Colors.green,
                      isSelected: true,
                    ),
                    SizedBox(
                      width: KDefaultPadding / 2,
                    ),
                    ColorDot(
                      colors: Colors.blueGrey,
                      isSelected: true,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                                color: Colors.black45, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: KDefaultPadding / 2,
                          ),
                          Text(
                            "${shoesproduct.size}",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  shoesproduct.title,
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
                        shoesController.setQuantity(false);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${shoesController.retrieveShoeQuantityInCart}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconSign(
                      icon1: Icons.add,
                      press: () {shoesController.setQuantity(true);},
                    ),
                    Spacer(),
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
                          shoesController.addShoesItem(shoesproduct);
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
      }
    );
  }
}
