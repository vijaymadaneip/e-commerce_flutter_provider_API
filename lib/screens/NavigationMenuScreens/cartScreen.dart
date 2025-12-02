import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart' as cartserviceobj;
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/screens/landingScreen.dart';
import 'package:flutter_api/screens/order/orderreview.dart';
import 'package:flutter_api/utils/widgets/descriptionofProduct.dart';
import 'package:provider/provider.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Homescreen()),
                        );
                      },
                      child: Icon(Icons.arrow_back, size: 25),
                    ),

                    Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => cartScreen()),
                        );
                      },
                      child: Icon(Icons.shopping_cart, size: 30),
                    ),
                  ],
                ),
              ),
              Consumer<Cartprovider>(
                builder: (context, cartlistObj, child) {
                  return cartlistObj.itemInCarts.isEmpty
                      ? Center(
                          child: Text(
                            "Cart is empty",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                //extrac
                                //single
                                //add to cart product
                                final singleproductfromcart =
                                    cartlistObj.itemInCarts[index];
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  surfaceTintColor: Colors.transparent,
                                  // color: Color.fromRGBO(8, 87, 160, 0.05),
                                  color: Color.fromRGBO(231, 239, 246, 1),
                                  shadowColor: Colors.blueGrey,
                                  elevation: 0,
                                  // // elevation: 8,
                                  // clipBehavior: Clip.antiAlias,
                                  //  surfaceTintColor: Colors.transparent,
                                  // // color: Colors.white,
                                  // color: Color.fromRGBO(8, 87, 160, 0.0001),
                                  // shadowColor: Colors.blueGrey,
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.all(8),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    descriptionofProduct(
                                                      productinfo:
                                                          singleproductfromcart,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            height: 80,
                                            child: AspectRatio(
                                              aspectRatio: 1.5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 1,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        singleproductfromcart
                                                            .image,
                                                    fit: BoxFit.contain,
                                                    // width: double.infinity,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,

                                            children: [
                                              // Text(
                                              //   singleproductfromcart.title,
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.w600,
                                              //     fontSize: 18,
                                              //   ),

                                              //   maxLines: 2,
                                              //   overflow: TextOverflow.ellipsis,
                                              // ),
                                              Text(
                                                singleproductfromcart.title,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                // "Price : ₹${cartserviceobj.convertUSDtoINR(singleproductfromcart.price).toStringAsFixed(0)}",
                                                "Price: ₹${cartlistObj.convertUSDtoINR(singleproductfromcart.price).toStringAsFixed(0)}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              // Text(
                                              //   "Price : ${singleproductfromcart.price} \$",
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.bold,
                                              //     fontSize: 18,
                                              //   ),
                                              // ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartlistObj
                                                              .decreaseQuantityById(
                                                                singleproductfromcart
                                                                    .id,
                                                              );
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                            border: Border.all(
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Icon(
                                                            Icons.remove,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      // quantity text
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                          border: Border.all(
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "${singleproductfromcart.quantity}",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),

                                                      // + button
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartlistObj
                                                              .increaseQuantityById(
                                                                singleproductfromcart
                                                                    .id,
                                                              );
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                            border: Border.all(
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Icon(
                                                            Icons.add,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartlistObj
                                                          .directremovefromCart(
                                                            index,
                                                          );
                                                    },
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Colors.redAccent,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: cartlistObj.itemInCarts.length,
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => orderReview(),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(8, 87, 160, 1.0),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Checkout",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
    );
  }
}


/*

Column(
            children: [
              // Padding(
              //   padding: EdgeInsetsGeometry.all(5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           Navigator.of(context).push(
              //             MaterialPageRoute(builder: (context) => Homescreen()),
              //           );
              //         },
              //         child: Icon(Icons.arrow_back, size: 25),
              //       ),

              //       Text(
              //         "Cart",
              //         style: TextStyle(
              //           fontSize: 25,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           Navigator.of(context).push(
              //             MaterialPageRoute(builder: (context) => Homescreen()),
              //           );
              //         },
              //         child: Icon(Icons.home, size: 25),
              //       ),
              //       // GestureDetector(
              //       //   onTap: () {
              //       //     Navigator.of(context).push(
              //       //       MaterialPageRoute(builder: (context) => cartScreen()),
              //       //     );
              //       //   },
              //       //   child: Icon(Icons.shopping_cart, size: 30),
              //       // ),
              //     ],
              //   ),
              // ),
          
              
            ],
          ), */
        
        /*
        (ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shadowColor: Colors.blueGrey,
              child: Padding(padding: EdgeInsetsGeometry.all(8),
              child: Row(
                children: [
                  
                ],
              ),),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: 5,
        ),
      ),*/