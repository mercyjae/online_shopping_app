import 'package:flutter/material.dart';
import 'package:online_shopping/views/dresses/dress_screen.dart';
import 'package:online_shopping/views/eyeglass/eyeglass_screen.dart';
import 'package:online_shopping/views/footwear/shoes_screen.dart';
import 'package:online_shopping/views/bags/bag_screen.dart';

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Anuoluwapo"),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 218, 151, 1.0),
                  ),
                  accountEmail: Text("mercyjae20@email.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/anu.jpg")),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.shopping_cart),
                  title: Text("Cart"),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.info),
                  title: Text("About"),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.phone),
                  title: Text("Contact Us"),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
              ),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: [
                Text("Dresses"),
                Text("Bags"),
                Text("Footwears"),
                Text("Eyeglasses")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DressScreen(),
              BagScreen(),
              ShoeScreen(),
              EyeglassScreen(),
            ],
          )),
    );
  }
}
