import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/components/item_delete.dart';
import 'package:online_shopping/controllers/cart_controller.dart';

import '../../constants.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  Color.fromRGBO(240, 218, 151, 1.0),
      leading: IconButton(icon: Icon(Icons.arrow_back,),
      onPressed: (){},color: Colors.black,),
        title: Text("Cart",style: TextStyle(color: Colors.black),
),),



      body: GetBuilder<CartController>(builder: (cartController) {
        var _cartList = cartController.getItems;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _cartList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key:UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {},
                    confirmDismiss: (direction) async {
                      return await showDialog(
                          context: context, builder: (_) => ItemDelete());
                    },
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: KDefaultPadding / 2),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: _cartList[index].color,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(_cartList[index].image),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _cartList[index].title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  IconSign(
                                    icon1: Icons.remove,
                                    press: () {
                                      cartController.addItem(
                                          _cartList[index].product!, -1);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_cartList[index].quantity}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconSign(
                                    icon1: Icons.add,
                                    press: () {
                                      cartController.addItem(
                                          _cartList[index].product!, 1);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: KDefaultPadding + 10),
                            child: Text(
                              "\$${_cartList[index].price * _cartList[index].quantity}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price : \$${cartController.totalAmount()} ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(240, 218, 151, 1.0),
                      child: MaterialButton(
                        minWidth: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOutScreen()));
                        },
                        child: Text(
                          "Check Out",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),


            ),
            //SizedBox(height: 100,),
          ],
        );
      }),
    );
  }
}
