import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/controllers/glass_controller.dart';
import 'package:online_shopping/model/bag_product.dart';

import '../cart/cart_screen.dart';

class EyeDetails extends StatefulWidget {
  final Product glassproduct;
  const EyeDetails({Key? key, required this.glassproduct}) : super(key: key);

  @override
  State<EyeDetails> createState() => _EyeDetailsState();
}

class _EyeDetailsState extends State<EyeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.glassproduct.color,
      appBar: AppBar(
        backgroundColor: widget.glassproduct.color,
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
            onPressed: () { Navigator.push(context,
                MaterialPageRoute(builder: (context) => CartScreen()));},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            EyeDetails1(
              glassproduct: widget.glassproduct,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.glassproduct.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(
                    widget.glassproduct.description,
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
                            text: "\$${widget.glassproduct.price}",
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
                left: 50,
                right: 0,
                child: Image.asset(
                  widget.glassproduct.image,
                  width: 200,
                )),
          ],
        ),
      ),
    );
  }
}

class EyeDetails1 extends StatelessWidget {
  final cartController = Get.put(CartController());
  final Product glassproduct;
   EyeDetails1({Key? key, required this.glassproduct}) : super(key: key);
  @override

  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    Get.put(GlassController());
    Get.find<GlassController>().initGlassProduct(glassproduct, Get.find<CartController>());
    return GetBuilder<GlassController>(
      builder: (glassController) {
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
                Row(
                  children: [
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Colors",
                          style: TextStyle(
                              color: Colors.black45, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ColorDot(
                              colors: glassproduct.color,
                              isSelected: true,
                            ),
                            SizedBox(
                              width: KDefaultPadding / 2,
                            ),
                            ColorDot(
                              colors: Colors.black12,
                              isSelected: true,
                            ),
                            SizedBox(
                              width: KDefaultPadding / 2,
                            ),
                            ColorDot(
                              colors: Colors.grey,
                              isSelected: true,
                            ),
                            SizedBox(
                              width: 70,
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, left: 20),
                      child: Text(
                        "Size",
                        style: TextStyle(
                            color: Colors.black45, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text("${glassproduct.size}"),
                    ),
                  ],
                ),
                Text(
                  glassproduct.title,
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
                        glassController.setQuantity(false);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${glassController.retrieveGlassQuantityInCart}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconSign(
                      icon1: Icons.add,
                      press: () {glassController.setQuantity(true);},
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
                      child: ElevatedButton(
                        // color: Colors.grey,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                        glassController.addGlassItem(glassproduct);
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
