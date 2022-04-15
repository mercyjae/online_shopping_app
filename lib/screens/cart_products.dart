import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/controllers/bag_controller.dart';
import 'package:online_shopping/models/bag_product.dart';

class CartProducts extends StatelessWidget {
  final BagController controller = Get.put(BagController());
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.cartItems.length,
          itemBuilder: (BuildContext context, int index) => CartProductCard(
            controller: controller,
            product: controller.cartItems[index],
            //  quantity:  controller.cartItems[index].,
          ),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}

class CartProductCard extends StatefulWidget {
  final BagController controller;
  final Product product;
  // final int quantity;

  const CartProductCard({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: widget.product.color,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(widget.product.image),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: KDefaultPadding - 5),
              child: Text(
                widget.product.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //SizedBox(height: 10,),
            Row(
              children: [
                IconSign(
                  icon1: Icons.remove,
                  press: () {
                    // setState(() {
                    //   items++;
                    // });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "1",
                  //items.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                IconSign(
                  icon1: Icons.add,
                  press: () {
                    // setState(() {
                    //   items--;
                    // });
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: KDefaultPadding + 10),
          child: Text(
            "\$${widget.product.price}",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: KDefaultPadding + 10, left: KDefaultPadding + 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
