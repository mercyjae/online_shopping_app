import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/controllers/bag_controller.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/screens/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  final cartController = Get.put(BagController());
  final Product product;
  //final int index;
  DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: widget.product.color,
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
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                DetailsScreen1(product: widget.product),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Office code",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
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
                                text: "\$234",
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
                  right: 0,
                  left: 50,
                  child: Image.asset(widget.product.image),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DetailsScreen1 extends StatelessWidget {
  final bagController = Get.put(BagController());
  final cartController = Get.put(CartController());
  final Product product;
  // final int index;
  DetailsScreen1({
    Key? key,
    required this.product,
  }) : super(key: key);

  // int items = 01;
  // void numOfItems1(){
  //   setState(() {
  //     items++;
  //   });
  // }
  // void numOfItems2(){
  //   setState(() {
  //     items--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      height: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  colors: Colors.green,
                  isSelected: true,
                ),
                SizedBox(
                  width: KDefaultPadding / 2,
                ),
                ColorDot(
                  colors: Colors.purple,
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
                        "${product.size}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text(
              product.title,
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
                    // numOfItems2();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                // Text(items.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(
                  width: 10,
                ),
                IconSign(
                  icon1: Icons.add,
                  press: () {
                    // setState(() {
                    //   numOfItems1();
                    // });
                  },
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
                      bagController.addToCart(product);
                      cartController.addBagItem(product);
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
}
