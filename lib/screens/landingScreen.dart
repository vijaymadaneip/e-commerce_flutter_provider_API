import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
// import 'package:flutter_api/apiservices/cartProvider.dart' as cartserviceobj;
import 'package:flutter_api/apiservices/wishlistProvider.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/shopScreen.dart';
import 'package:flutter_api/screens/category/categoryScreen.dart';
import 'package:flutter_api/utils/widgets/descriptionofProduct.dart';
import 'package:flutter_api/utils/widgets/snackbar.dart';
import 'package:provider/provider.dart';

class landingScreen extends StatefulWidget {
  const landingScreen({super.key});

  @override
  State<landingScreen> createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {
  @override
  Widget build(BuildContext context) {
    final cartproivderobj = Provider.of<Cartprovider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 87, 160, 0.01),
      // appBar: AppBar(
      //   title: Text(
      //     "Landing Screen",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 22,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: <Color>[
      //           Color.fromARGB(255, 83, 163, 173),
      //           Color.fromARGB(255, 28, 41, 54),
      //         ],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.person, color: Colors.white),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.shopping_cart, color: Colors.white),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  // Container(
                  //   clipBehavior: Clip.antiAlias,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/banner/banner_1.jpg"),
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/banner/banner_3.jpg",
                      fit: BoxFit.fill, // or BoxFit.fill / BoxFit.fitWidth
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/banner/banner_1.jpg",
                      fit: BoxFit.fill, // or BoxFit.fill / BoxFit.fitWidth
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/banner/banner_2.jpg",
                      fit: BoxFit.fill, // or BoxFit.fill / BoxFit.fitWidth
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/banner/banner_6.jpg",
                      fit: BoxFit.fill, // or BoxFit.fill / BoxFit.fitWidth
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.all(6),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/banner/banner_2.jpg"),
                  //       // image: AssetImage("assets/carousel/offer.jpg"),
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.all(6),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/banner/banner_3.jpg"),
                  //       // image: AssetImage("assets/carousel/bigsale.jpg"),
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.all(6),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/banner/banner_4.jpg"),
                  //       // image: AssetImage("assets/carousel/bigsale.jpg"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.all(6),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/banner/banner_5.jpg"),
                  //       // image: AssetImage("assets/carousel/bigsale.jpg"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.all(6),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/banner/banner_6.jpg"),
                  //       // image: AssetImage("assets/carousel/bigsale.jpg"),
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                ],
                options: CarouselOptions(
                  height: 190,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Row(
                  children: [
                    Text(
                      "Shop By Category",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container(
                  //   width: 60,
                  //   height: 60,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(width: 1),
                  //   ),
                  //   child: ClipRRect(
                  //     child: Image.asset(
                  //       "assets/category/cloths.png",
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              categoryScreen(categoryName: 'electronics'),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(8, 87, 160, 0.2),
                            shape: BoxShape.circle,
                            // border: Border.all(width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/category/gadgets.png",
                                fit: BoxFit.cover, // fills the circle perfectly
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Electronics",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              categoryScreen(categoryName: 'jewelery'),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(8, 87, 160, 0.2),
                            // border: Border.all(width: 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/category/jewellery.png",
                              fit: BoxFit.cover, // fills the circle perfectly
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Jewelery",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              categoryScreen(categoryName: "women's clothing"),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(8, 87, 160, 0.2),
                            // border: Border.all(width: 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/category/woman.png",
                              fit: BoxFit.cover, // fills the circle perfectly
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Womens",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              categoryScreen(categoryName: "men's clothing"),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Color.fromRGBO(8, 87, 160, 0.2),
                            // border: Border.all(width: 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/category/boy.png",
                              fit: BoxFit.cover, // fills the circle perfectly
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Mens",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       width: 70,
                  //       height: 70,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         // border: Border.all(width: 1),
                  //         color: Color.fromRGBO(8, 87, 160, 0.2),
                  //       ),
                  //       child: Padding(
                  //         padding: EdgeInsets.all(4),
                  //         child: ClipOval(
                  //           child: Image.asset(
                  //             "assets/category/spoarts.png",
                  //             fit: BoxFit.cover, // fills the circle perfectly
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(height: 5),
                  //     Text(
                  //       "Sports",
                  //       style: TextStyle(
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Column(
              //       children: [
              //         Container(
              //           width: 70,
              //           height: 70,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             // border: Border.all(width: 1),
              //             color: Color.fromRGBO(8, 87, 160, 0.2),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.all(4),
              //             child: ClipOval(
              //               child: Image.asset(
              //                 "assets/category/furniture.png",
              //                 fit: BoxFit.cover, // fills the circle perfectly
              //               ),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 5),
              //         Text(
              //           "Furniture",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Container(
              //           width: 70,
              //           height: 70,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             // border: Border.all(width: 1),
              //             color: Color.fromRGBO(8, 87, 160, 0.2),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.all(2),
              //             child: ClipOval(
              //               child: Image.asset(
              //                 "assets/category/gym.png",
              //                 fit: BoxFit.cover, // fills the circle perfectly
              //               ),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 5),
              //         Text(
              //           "Gym",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),

              //     Column(
              //       children: [
              //         Container(
              //           width: 70,
              //           height: 70,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             // border: Border.all(width: 1),
              //             color: Color.fromRGBO(8, 87, 160, 0.2),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.all(7),
              //             child: ClipOval(
              //               child: Image.asset(
              //                 "assets/category/electronics.png",
              //                 fit: BoxFit.cover, // fills the circle perfectly
              //               ),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 5),
              //         Text(
              //           "Electronics",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),

              //     Column(
              //       children: [
              //         Container(
              //           width: 70,
              //           height: 70,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             // border: Border.all(width: 1),
              //             color: Color.fromRGBO(8, 87, 160, 0.2),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.all(4),
              //             child: ClipOval(
              //               child: Image.asset(
              //                 "assets/category/mobile.png",
              //                 fit: BoxFit.cover, // fills the circle perfectly
              //               ),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 5),
              //         Text(
              //           "Mobile",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         GestureDetector(
              //           onTap: (){
              //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>categoryScreen()));
              //           },
              //           child: Container(
              //             width: 70,
              //             height: 70,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               // border: Border.all(width: 1),
              //               color: Color.fromRGBO(8, 87, 160, 0.2),
              //             ),
              //             child: Padding(
              //               padding: EdgeInsets.all(4),
              //               child: ClipOval(
              //                 child: Image.asset(
              //                   "assets/category/laptops.png",
              //                   fit: BoxFit.cover, // fills the circle perfectly
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 5),
              //         Text(
              //           "Laptop",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              //Festured Products
              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Row(
                  children: [
                    Text(
                      "Featured Products",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Shopscreen()),
                        );
                        /*onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            descriptionofProduct(productinfo: singleProduct),
                      ),
                    );
                  },* */
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Consumer<apiserviceProvder>(
                builder: (context, apiserviceproviderobj, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: apiserviceproviderobj.listofallProdcut.length,
                    itemBuilder: (context, index) {
                      //Extract
                      //     //single task
                      //     //from the list of task
                      //     // final singleProduct = listofProduct[index];
                      final singleProduct =
                          apiserviceproviderobj.listofallProdcut[index];
                      //main card
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => descriptionofProduct(
                                productinfo: singleProduct,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 150,
                          decoration: BoxDecoration(
                            // color: Color.fromRGBO(8, 87, 160, 0.05),
                            color: Color.fromRGBO(231,239,246,1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 0.3),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //image of
                                  //the product
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Container(
                                        width: 145,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          // border: Border.all(width: 2),
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          children: [
                                            Consumer<Wishlistprovider>(
                                              builder: (context, wishlistproviderobj, child) {
                                                bool isinthewishList =
                                                    wishlistproviderobj
                                                        .isitIntheWishList(
                                                          singleProduct.id,
                                                        );
                                                return Stack(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                        15,
                                                      ),
                                                      child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                4,
                                                              ),
                                                          child:
                                                              CachedNetworkImage(
                                                                imageUrl:
                                                                    singleProduct
                                                                        .image,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 6,
                                                      right: 1,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          wishlistproviderobj
                                                              .addToWishListProduct(
                                                                singleProduct,
                                                              );
                                                          wishlistproviderobj
                                                              .notifyListeners();
                                                          if (isinthewishList) {
                                                            showCustomMessage(
                                                              context,
                                                              "Item Successfully Removed From Wishlist!",
                                                            );
                                                          } else {
                                                            showCustomMessage(
                                                              context,
                                                              "Item Successfully Added to Wishlist!",
                                                            );
                                                          }
                                                          log(
                                                            "Fav icon in clicked in landing scree",
                                                          );
                                                        },
                                                        child: Icon(
                                                          isinthewishList
                                                              ? Icons.favorite
                                                              : Icons
                                                                    .favorite_border,
                                                          color: isinthewishList
                                                              ? Colors.red
                                                              : Colors.black,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //title
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      singleProduct.title,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 5,
                                left: 10,
                                child: Text(
                                  // "Price : ₹${cartserviceobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                  "Price: ₹${cartproivderobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // Text(
                                //   "${singleProduct.price} \$",
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.w900,
                                //     fontSize: 18,
                                //   ),
                                // ),
                              ),
                              Positioned(
                                // top: 10,
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    cartproivderobj.addProductToCart(
                                      singleProduct,
                                    );
                                    showCustomMessage(
                                      context,
                                      "Item Successfully Added to Cart!",
                                    );
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(content: Text("Added to cart!")),
                                    // );
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      // color:  Color.fromRGBO(8, 87, 160, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              // Consumer<apiserviceProvder>(
              //   builder: (context, apiserviceproviderobj, child) {
              //     return SizedBox(
              //       height: 210,
              //       child: ListView.separated(
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (context, index) {
              //           final singleproduct =
              //               apiserviceproviderobj.listofallProdcut[index];
              //           return GestureDetector(
              //             onTap: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                   builder: (context) => descriptionofProduct(
              //                     productinfo: singleproduct,
              //                   ),
              //                 ),
              //               );
              //             },
              //             child: Card(
              //               elevation: 8,
              //               clipBehavior: Clip.antiAlias,
              //               color: Colors.white,
              //               shadowColor: Colors.blueGrey,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Consumer<Wishlistprovider>(
              //                       builder: (context, wishlistproviderobj, child) {
              //                         bool isinthewishList = wishlistproviderobj
              //                             .isitIntheWishList(singleproduct.id);
              //                         return Stack(
              //                           children: [
              //                             SizedBox(
              //                               height: 140,
              //                               width: 200,
              //                               child: AspectRatio(
              //                                 aspectRatio: 1,
              //                                 child: Padding(
              //                                   padding: const EdgeInsets.all(
              //                                     4,
              //                                   ),
              //                                   child: CachedNetworkImage(
              //                                     imageUrl: singleproduct.image,
              //                                     fit: BoxFit.contain,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Positioned(
              //                               top: 8,
              //                               right: 2,
              //                               child: GestureDetector(
              //                                 onTap: () {
              //                                   wishlistproviderobj
              //                                       .addToWishListProduct(
              //                                         singleproduct,
              //                                       );
              //                                   wishlistproviderobj
              //                                       .notifyListeners();

              //                                   log(
              //                                     "Fav icon in clicked in landing scree",
              //                                   );
              //                                 },
              //                                 child: Icon(
              //                                   isinthewishList
              //                                       ? Icons.favorite
              //                                       : Icons.favorite_border,
              //                                   color: isinthewishList
              //                                       ? Colors.red
              //                                       : Colors.black,
              //                                   size: 30,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         );
              //                       },
              //                     ),

              //                     Text(
              //                       apiserviceproviderobj.shortenTitle(
              //                         singleproduct.title,
              //                       ),
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),

              //                     Text(
              //                       "Price : ${singleproduct.price}\$",
              //                       style: TextStyle(
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //         separatorBuilder: (context, index) {
              //           return const SizedBox(width: 10);
              //         },
              //         itemCount: apiserviceproviderobj.listofallProdcut.length,
              //       ),
              //     );
              //   },
              // ),
              // const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


 // ListView.separated(
              //   scrollDirection: Axis.horizontal,
              //   shrinkWrap: true,

              //   itemBuilder: (context,index){
              //   return Container(
              //     height: 50,
              //     width: 50,
              //     color: Colors.amber,
              //   );
              // }, separatorBuilder: (context,index){
              //   return const SizedBox(width: 10,);
              // }, itemCount: 10)

              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     return Container(height: 50, width: 100, color: Colors.amber);
              //   },
              //   itemCount: 5,
              // ),
              // Consumer<apiserviceProvder>(
              //   builder: (context, apiserviceproviderobj, child) {
              //     return SizedBox(
              //       height: 200,
              //       child: ListView.separated(
              //         scrollDirection: Axis.horizontal,
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemBuilder: (context, index) {

              //           final singleproduct =
              //               apiserviceproviderobj.listofallProdcut[index];

              //           return Container(
              //             width: 100,
              //             height: 100,
              //             color: Colors.red,
              //           );
              //           // return Card(
              //           //   elevation: 8,
              //           //   clipBehavior: Clip.antiAlias,
              //           //   color: Colors.white,
              //           //   shadowColor: Colors.blueGrey,
              //           //   child: Column(
              //           //     children: [
              //           //       Container(
              //           //         child: AspectRatio(
              //           //           aspectRatio: 1,
              //           //           child: CachedNetworkImage(
              //           //             imageUrl: singleproduct.image,
              //           //           ),
              //           //         ),
              //           //       ),
              //           //     ],
              //           //   ),
              //           // );
              //         },
              //         separatorBuilder: (context, index) {
              //           return const SizedBox(height: 50);
              //         },
              //         itemCount: apiserviceproviderobj.listofallProdcut.length,
              //       ),
              //     );
              //   },
              // ),



              /**
               *   Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            offset: Offset(4, 8),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/category/clothing.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),

                    // const SizedBox(width: 20,),
                    Spacer(),
                    Container(
                      height: 160,
                      width: 160,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            offset: Offset(4, 8),
                          ),
                        ],
                        // border: Border.all(
                        //   width: 2
                        // )
                      ),
                      child: Image.asset(
                        "assets/category/Electronics.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            offset: Offset(4, 8),
                          ),
                        ],
                        // border: Border.all(
                        //   width: 2
                        // )
                      ),
                      child: Image.asset(
                        "assets/category/homewood.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Spacer(),
                    // const SizedBox(width: 20,),
                    Container(
                      height: 160,
                      width: 160,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            offset: Offset(4, 8),
                          ),
                        ],
                        // border: Border.all(
                        //   width: 2
                        // )
                      ),
                      child: Image.asset(
                        "assets/category/sports.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
               */