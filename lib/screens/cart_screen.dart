import 'package:flutter/material.dart';
import 'package:online_shopping/screens/cart_products.dart';
import 'package:online_shopping/view_screen/dress_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CartProducts(),SizedBox(height: 10,),
            DressView(),
            // CartTotal()
          ],
        ),
      ),
    );
  }
}
