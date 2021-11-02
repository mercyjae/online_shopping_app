import 'package:flutter/material.dart';
import 'package:online_shopping/components/category.dart';
import 'package:online_shopping/components/item_card.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/products.dart';

import 'details_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(elevation: 0,backgroundColor: Colors.white,
      leading:
      IconButton(icon:Icon(Icons.arrow_back_sharp,color: Colors.black,),
        onPressed: (){},),actions: [
        IconButton(icon:Icon(Icons.search,color: Colors.black,),
          onPressed: (){},),
        IconButton(icon:Icon(Icons.add_shopping_cart_outlined,color: Colors.black,),
          onPressed: (){},),
      ],
    ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding,vertical: KDefaultPadding/2),
           child: Text("Women",
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
         ),
          Category(),
       Expanded(child:
       GridView.builder(itemCount: products.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.75),
           itemBuilder: (context, int index)=>
               ItemCard(product: products[index],
             press: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>
                 DetailsScreen(product:products[index])));
             },)
       )
       )

    ],),);
  }
}
