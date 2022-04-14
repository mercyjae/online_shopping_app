import 'package:flutter/material.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/glasses_products.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/screens/eyeglass/eyedetails_screen.dart';

class EyeglassScreen extends StatefulWidget {
  const EyeglassScreen({Key? key}) : super(key: key);

  @override
  State<EyeglassScreen> createState() => _EyeglassScreenState();
}

class _EyeglassScreenState extends State<EyeglassScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: eyeglass.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.90, crossAxisCount: 2),
              itemBuilder: (context, int index) => ItemCard4(
                    glassProduct: eyeglass[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EyeDetails(
                                    glassproduct: eyeglass[index],
                                  )));
                    },
                  )),
        )
      ],
    );
  }
}

class ItemCard4 extends StatelessWidget {
  final GlassProduct glassProduct;
  final Function() press;
  const ItemCard4({
    Key? key,
    required this.glassProduct,
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
                  color: glassProduct.color),
              child: Image.asset(glassProduct.image),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text(
              glassProduct.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text("\$${glassProduct.price}",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          )
        ],
      ),
    );
  }
}
