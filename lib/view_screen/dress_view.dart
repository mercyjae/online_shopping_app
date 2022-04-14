import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/controllers/dress_controller.dart';
import 'package:online_shopping/models/dress_products.dart';

import '../constants.dart';

class DressView extends StatelessWidget {
  final DressController c = Get.put(DressController());
  DressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Obx(
            () => ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: c.cartItems1.length,
          itemBuilder: (BuildContext context, int index) => DressCard(
            c:c,
            dressProduct: c.cartItems1[index],
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


class DressCard extends StatefulWidget {
  final DressController c;
  final DressProduct dressProduct;
  const DressCard({Key? key, required this.c, required this.dressProduct}) : super(key: key);

  @override
  State<DressCard> createState() => _DressCardState();
}

class _DressCardState extends State<DressCard> {
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
                color: widget.dressProduct.color,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(widget.dressProduct.image),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: KDefaultPadding - 5),
              child: Text(
                widget.dressProduct.title,
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
            "\$${widget.dressProduct.price}",
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
