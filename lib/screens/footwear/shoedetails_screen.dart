import 'package:flutter/material.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/dress_products.dart';
import 'package:online_shopping/models/shoes_product.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/screens/dresses/dress_details.dart';

class ShoeDetailsScreen extends StatefulWidget {
  final ShoesProduct shoesproduct;
  const ShoeDetailsScreen({Key? key, required this.shoesproduct})
      : super(key: key);

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
            onPressed: () {},
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

class ShoesDetails1 extends StatefulWidget {
  final ShoesProduct shoesproduct;
  const ShoesDetails1({Key? key, required this.shoesproduct}) : super(key: key);

  @override
  State<ShoesDetails1> createState() => _ShoesDetails1State();
}

class _ShoesDetails1State extends State<ShoesDetails1> {
  int items = 01;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  colors: widget.shoesproduct.color,
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
                        "${widget.shoesproduct.size}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text(
              widget.shoesproduct.title,
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
                    setState(() {
                      items++;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  items.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                IconSign(
                  icon1: Icons.add,
                  press: () {
                    setState(() {
                      items--;
                    });
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
                    onPressed: () {},
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
