import 'package:flutter/material.dart';
import 'package:online_shopping/utils/item_card3.dart';
import 'package:online_shopping/views/footwear/shoedetails_screen.dart';
import 'package:online_shopping/model/shoes_model.dart';


class ShoeScreen extends StatefulWidget {
  const ShoeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoeScreen> createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Expanded(
          child: GridView.builder(
              itemCount: shoe.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.90, crossAxisCount: 2),
              itemBuilder: (context, int index) => ItemCard3(
                    shoesproduct: shoe[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoeDetailsScreen(
                                  shoesproduct: shoe[index])));
                    },
                  ))),
    ]);
  }
}


