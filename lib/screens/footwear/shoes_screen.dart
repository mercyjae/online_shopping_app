import 'package:flutter/material.dart';
import 'package:online_shopping/models/shoes_product.dart';
import 'package:online_shopping/screens/footwear/shoedetails_screen.dart';
import '../../constants.dart';

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


class ItemCard3 extends StatelessWidget {
  final ShoesProduct shoesproduct;
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
            const EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
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
