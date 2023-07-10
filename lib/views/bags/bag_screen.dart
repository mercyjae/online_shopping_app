import 'package:flutter/material.dart';
import 'package:online_shopping/utils/item_card1.dart';
import 'package:online_shopping/model/bag_model.dart';

import 'bag_details_screen.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);
  @override
  State<BagScreen> createState() => _BagScreenState();
}
class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.90),
                itemBuilder: (context, int index) => ItemCard1(
                      product: products[index],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(product: products[index])));
                      },
                    )))
      ],
    );
  }
}



