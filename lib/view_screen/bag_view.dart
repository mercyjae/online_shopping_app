import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/controllers/bag_controller.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/screens/cart_products.dart';
import '../constants.dart';

class BagView extends StatelessWidget {
  final CartController controller = Get.put(CartController());
   BagView({Key? key}) : super(key: key);

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



class BagCard extends StatefulWidget {
  final CartController controller;
  final Product product;
  const BagCard({Key? key, required this.controller, required this.product}) : super(key: key);

  @override
  State<BagCard> createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
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
        ),SizedBox(width: 15,),
        Padding(
          padding: const EdgeInsets.only(top: KDefaultPadding + 10),
          child: Text(
            "\$${widget.product.price}",
            style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: KDefaultPadding + 10,left: KDefaultPadding + 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete,size: 25,),
          ),
        )
      ],
    );
  }
}
