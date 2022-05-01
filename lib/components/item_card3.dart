import 'package:flutter/material.dart';
import 'package:online_shopping/views_model/bag_product.dart';

import '../constants.dart';

class ItemCard3 extends StatelessWidget {
  final Product shoesproduct;
  final Function() press;
  const ItemCard3({
    Key? key,
    required this.shoesproduct,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
             EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: shoesproduct.color),
              child: Image.asset(shoesproduct.image),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text(
              shoesproduct.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text("\$${shoesproduct.price}",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          )
        ],
      ),
    );
  }
}
