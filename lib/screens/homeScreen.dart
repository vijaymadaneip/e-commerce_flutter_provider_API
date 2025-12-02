import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_api/apimodel/newProduct.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/cartScreen.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/profileScreen.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/shopScreen.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/wishListScree.dart';
import 'package:flutter_api/screens/landingScreen.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // List Proucts = [];
  // List<Product> listofProduct = [];
  //fetch produt form api
  // Future<void> fetchProducts() async {
  //   log("Inside fetch...");
  //   final response = await http.get(
  //     // Uri.parse("https://api.restful-api.dev/objects"),
  //     Uri.parse("https://fakestoreapi.com/products"),
  //   );

  //   try {
  //     if (response.statusCode == 200) {
  //       List<dynamic> jsonData = json.decode(response.body);
  //       log("${jsonData}");
  //       setState(() {
  //         // Proucts = jsonData.map((data)=>Products.fromJSON(data)).toList();
  //         listofProduct = jsonData
  //             .map((data) => Product.fromJson(data))
  //             .toList();
  //       });
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    log("$index is tapped on the Navigation bar..");
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    // Homescreen(),
    landingScreen(),
    Shopscreen(),
    cartScreen(),
    wishListScreen(),
    profileScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   final apiserviceprovider = Provider.of<apiserviceProvder>(
  //     context,
  //     listen: false,
  //   );
  //   apiserviceprovider.fetchProducts();
    
  // }

  @override
  Widget build(BuildContext context) {
    // final apiserviceprovider = Provider.of<apiserviceProvder>(context);

    // final drawerprovider = Provider.of<Drawerprovider>(context, listen: false);
    log("Inside Build");
    // log(${listofProduct.length});
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue
        backgroundColor: Color.fromRGBO(8, 87, 160, 1),
        // backgroundColor: Color.fromARGB(8, 87, 160, 0.1 as int),

        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "ShopNow",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => wishListScreen()));
            },
            icon: Icon(Icons.favorite, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => cartScreen()));
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // fetchProducts();
      //     apiserviceprovider.fetchProducts();
      //   },
      //   child: Icon(Icons.get_app),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.blueAccent),
        // selectedItemColor: Colors.blueAccent,
        selectedItemColor: Color.fromRGBO(8, 87, 160, 1),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 15,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
