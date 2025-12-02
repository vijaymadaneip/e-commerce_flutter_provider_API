import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart' as cartserviceobj;
import 'package:flutter_api/apiservices/wishlistProvider.dart';
import 'package:flutter_api/utils/widgets/descriptionofProduct.dart';
import 'package:flutter_api/utils/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class Shopscreen extends StatefulWidget {
  const Shopscreen({super.key});

  @override
  State<Shopscreen> createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  @override
  Widget build(BuildContext context) {
    final apiserviceprovider = Provider.of<apiserviceProvder>(context);
    // final wishlistprovider = Provider.of<Wishlistprovider>(context);
    final cartproivderobj = Provider.of<Cartprovider>(context);

    // final drawerprovider = Provider.of<Drawerprovider>(context, listen: false);
    log("Inside Build");
    // log(${listofProduct.length});
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "API FETCH",
      //     style: TextStyle(color: Colors.white, fontSize: 18),
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Consumer<apiserviceProvder>(
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
                          builder: (context) =>
                              descriptionofProduct(productinfo: singleProduct),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 150,
                      decoration: BoxDecoration(
                        // color: Color.fromRGBO(8, 87, 160, 0.05),
                        color: Color.fromRGBO(231, 239, 246, 1),
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
                                      borderRadius: BorderRadius.circular(15),
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
                                                  padding: EdgeInsets.all(15),
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            4,
                                                          ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            singleProduct.image,
                                                        fit: BoxFit.contain,
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
                              //title
                              // Flexible(
                              //   child: Padding(
                              //     padding: EdgeInsets.only(
                              //       left: 10,
                              //       right: 10,
                              //       bottom: 10,
                              //     ),
                              //     child: Text(
                              //       singleProduct.title,
                              //       maxLines: 2,
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.w400,
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
                                cartproivderobj.addProductToCart(singleProduct);
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
          //     return GridView.builder(
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 10,
          //         mainAxisSpacing: 10,
          //         childAspectRatio: 0.75,
          //       ),
          //       itemCount: apiserviceproviderobj.listofallProdcut.length,
          //       itemBuilder: (context, index) {
          //         //Extract
          //         //     //single task
          //         //     //from the list of task
          //         //     // final singleProduct = listofProduct[index];
          //         final singleProduct =
          //             apiserviceprovider.listofallProdcut[index];
          //         //main card
          //         return GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (context) =>
          //                     descriptionofProduct(productinfo: singleProduct),
          //               ),
          //             );
          //           },
          //           child: Container(
          //             width: MediaQuery.of(context).size.width,
          //             // height: 150,
          //             decoration: BoxDecoration(
          //               color: Color.fromRGBO(8, 87, 160, 0.05),
          //               borderRadius: BorderRadius.circular(15),
          //               border: Border.all(width: 0.3),
          //             ),
          //             child: Stack(
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     //image of
          //                     //the product
          //                     Padding(
          //                       padding: EdgeInsets.all(10),
          //                       child: Center(
          //                         child: Container(
          //                           width: 145,
          //                           height: 140,
          //                           decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(15),
          //                             // border: Border.all(width: 2),
          //                             color: Colors.white,
          //                           ),
          //                           child: Stack(
          //                             children: [
          //                               Consumer<Wishlistprovider>(
          //                                 builder: (context, wishlistproviderobj, child) {
          //                                   bool isinthewishList =
          //                                       wishlistproviderobj
          //                                           .isitIntheWishList(
          //                                             singleProduct.id,
          //                                           );
          //                                   return Stack(
          //                                     children: [
          //                                       Padding(
          //                                         padding: EdgeInsets.all(15),
          //                                         child: AspectRatio(
          //                                           aspectRatio: 1,
          //                                           child: Padding(
          //                                             padding:
          //                                                 const EdgeInsets.all(4),
          //                                             child: CachedNetworkImage(
          //                                               imageUrl:
          //                                                   singleProduct.image,
          //                                               fit: BoxFit.contain,
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       ),
          //                                       Positioned(
          //                                         top: 6,
          //                                         right: 1,
          //                                         child: GestureDetector(
          //                                           onTap: () {
          //                                             wishlistproviderobj
          //                                                 .addToWishListProduct(
          //                                                   singleProduct,
          //                                                 );
          //                                             wishlistproviderobj
          //                                                 .notifyListeners();
          //                                             if (isinthewishList) {
          //                                               showCustomMessage(
          //                                                 context,
          //                                                 "Item Successfully Removed From Wishlist!",
          //                                               );
          //                                             } else {
          //                                               showCustomMessage(
          //                                                 context,
          //                                                 "Item Successfully Added to Wishlist!",
          //                                               );
          //                                             }

          //                                             log(
          //                                               "Fav icon in clicked in landing scree",
          //                                             );
          //                                           },
          //                                           child: Icon(
          //                                             isinthewishList
          //                                                 ? Icons.favorite
          //                                                 : Icons.favorite_border,
          //                                             color: isinthewishList
          //                                                 ? Colors.red
          //                                                 : Colors.black,
          //                                             size: 30,
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   );
          //                                 },
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     //title
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                         left: 10,
          //                         right: 10,
          //                         bottom: 10,
          //                       ),
          //                       child: Text(
          //                         singleProduct.title,
          //                         maxLines: 2,
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ),

          //                     // Padding(
          //                     //   padding: EdgeInsets.only(
          //                     //     left: 10,
          //                     //     bottom: 10,
          //                     //     top: 10,
          //                     //   ),
          //                     //   child: Text(
          //                     //     "${singleProduct.price} \$",
          //                     //     style: TextStyle(
          //                     //       fontWeight: FontWeight.w900,
          //                     //       fontSize: 18,
          //                     //     ),
          //                     //   ),
          //                     // ),

          //                     //decription
          //                     //price
          //                     // Text(
          //                     //   "${singleProduct.description}",
          //                     //   maxLines: 2,
          //                     //   overflow: TextOverflow.ellipsis,
          //                     //   style: TextStyle(
          //                     //     fontWeight: FontWeight.w900,
          //                     //     fontSize: 12,
          //                     //   ),
          //                     // ),
          //                     // const SizedBox(height: 10),
          //                     //price
          //                   ],
          //                 ),
          //                 Positioned(
          //                   bottom: 5,
          //                   left: 10,
          //                   child: Text(
          //                     // "Price : ₹${cartserviceobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
          //                     "Price: ₹${cartproivderobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                   // Text(
          //                   //   "${singleProduct.price} \$",
          //                   //   style: TextStyle(
          //                   //     fontWeight: FontWeight.w900,
          //                   //     fontSize: 18,
          //                   //   ),
          //                   // ),
          //                 ),
          //                 const SizedBox(height: 5,),
          //                 Positioned(
          //                   // top: 10,
          //                   bottom: 0,
          //                   right: 0,
          //                   child: GestureDetector(
          //                     onTap: () {
          //                       cartproivderobj.addProductToCart(singleProduct);
          //                       // ScaffoldMessenger.of(context).showSnackBar(
          //                       //   SnackBar(content: Text("Added to cart!")),
          //                       // );
          //                       showCustomMessage(
          //                         context,
          //                         "Item Successfully Added to Cart!",
          //                       );
          //                     },
          //                     child: Container(
          //                       width: 40,
          //                       height: 40,
          //                       decoration: BoxDecoration(
          //                         color: Colors.black87,
          //                         // color:  Color.fromRGBO(8, 87, 160, 1),
          //                         borderRadius: BorderRadius.only(
          //                           topLeft: Radius.circular(15),
          //                           bottomRight: Radius.circular(15),
          //                         ),
          //                       ),
          //                       child: Icon(
          //                         Icons.add,
          //                         color: Colors.white,
          //                         size: 30,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       },
          //     );

          //   },
          // ),
        ),
      ),
    );
  }
}


// return ListView.separated(
            //   itemBuilder: (context, index) {
            //     //Extract
            //     //single task
            //     //from the list of task
            //     // final singleProduct = listofProduct[index];
            //     final singleProduct =
            //         apiserviceprovider.listofallProdcut[index];

            //     return Card(
            //       elevation: 8,
            //       clipBehavior: Clip.antiAlias,
            //       color: Colors.white,
            //       shadowColor: Colors.blueGrey,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.of(context).push(
            //                 MaterialPageRoute(
            //                   builder: (context) => descriptionofProduct(
            //                     productinfo: singleProduct,
            //                   ),
            //                 ),
            //               );
            //             },
            //             child: Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: MediaQuery.of(context).size.height / 3,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 // borderRadius: BorderRadius.circular(40),
            //                 // border: Border.all(color: Colors.black, width: 0.5),
            //               ),
            //               child: Padding(
            //                 padding: EdgeInsetsGeometry.all(16),
            //                 child: CachedNetworkImage(
            //                   imageUrl: singleProduct.image,
            //                   fit: BoxFit.contain,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: EdgeInsetsGeometry.all(8),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   singleProduct.title,
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 ReadMoreText(
            //                   "${singleProduct.description}",
            //                   trimLines: 2,
            //                   trimMode: TrimMode.Line,
            //                   trimCollapsedText: " More",
            //                   trimExpandedText: " Less",
            //                   moreStyle: const TextStyle(
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                   ),

            //                   lessStyle: const TextStyle(
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                   ),

            //                   style: TextStyle(
            //                     fontSize: 15,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //                 const SizedBox(height: 10),

            //                 Row(
            //                   children: [
            //                     Text(
            //                       "Price : ${singleProduct.price}\$",
            //                       style: TextStyle(
            //                         fontSize: 25,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                     Spacer(),
            //                     Row(
            //                       children: [
            //                         Icon(Icons.star, color: Colors.amber),
            //                         const SizedBox(width: 5),
            //                         Text(
            //                           "${singleProduct.rating}",
            //                           style: TextStyle(
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                         const SizedBox(width: 10),
            //                         Consumer<Wishlistprovider>(
            //                           builder:
            //                               (
            //                                 context,
            //                                 wishlistproviderobj,
            //                                 child,
            //                               ) {
            //                                 //bool check fav or not
            //                                 bool isinthewishList =
            //                                     wishlistproviderobj
            //                                         .isitIntheWishList(
            //                                           singleProduct.id,
            //                                         );
            //                                 return GestureDetector(
            //                                   onTap: () {
            //                                     wishlistproviderobj
            //                                         .addToWishListProduct(
            //                                           singleProduct,
            //                                         );
            //                                     wishlistproviderobj
            //                                         .notifyListeners();

            //                                     // wishlistprovider.onfavIconClicked(singleProduct);
            //                                   },
            //                                   child: Icon(
            //                                     isinthewishList
            //                                         ? Icons.favorite
            //                                         : Icons.favorite_border,
            //                                     color: isinthewishList
            //                                         ? Colors.red
            //                                         : Colors.black,
            //                                     size: 30,
            //                                   ),
            //                                 );
            //                               },
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //                 Row(
            //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () {
            //                         cartproivderobj.addProductToCart(
            //                           singleProduct,
            //                         );
            //                         ScaffoldMessenger.of(context).showSnackBar(
            //                           SnackBar(content: Text("Added to cart!")),
            //                         );
            //                       },
            //                       child: Container(
            //                         width:
            //                             MediaQuery.of(context).size.width / 2.4,
            //                         height: 40,
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                           borderRadius: BorderRadius.circular(15),
            //                           border: Border.all(width: 1.5),
            //                         ),
            //                         child: Center(
            //                           child: Text(
            //                             "Add to Cart",
            //                             style: TextStyle(
            //                               fontSize: 18,
            //                               fontWeight: FontWeight.bold,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Spacer(),
            //                     Container(
            //                       width:
            //                           MediaQuery.of(context).size.width / 2.4,
            //                       height: 40,
            //                       decoration: BoxDecoration(
            //                         color: Colors.amberAccent,
            //                         borderRadius: BorderRadius.circular(15),
            //                         border: Border.all(width: 1.5),
            //                       ),
            //                       child: Center(
            //                         child: Text(
            //                           "Buy Now",
            //                           style: TextStyle(
            //                             fontSize: 18,
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     // ElevatedButton(
            //                     //   onPressed: () {},
            //                     //   style: ElevatedButton.styleFrom(
            //                     //     backgroundColor: Colors.white,
            //                     //     foregroundColor: Colors.black,
            //                     //   ),
            //                     //   child: const Text(
            //                     //     "Add to Cart",
            //                     //     style: TextStyle(
            //                     //       fontSize: 20,
            //                     //       fontWeight: FontWeight.bold,
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // ElevatedButton(
            //                     //   onPressed: () {},
            //                     //   style: ElevatedButton.styleFrom(
            //                     //     backgroundColor: Colors.amberAccent,
            //                     //     foregroundColor: Colors.black,
            //                     //   ),
            //                     //   child: Text(
            //                     //     "Buy Now",
            //                     //     style: TextStyle(
            //                     //       fontSize: 20,
            //                     //       fontWeight: FontWeight.bold,
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            //   separatorBuilder: (context, index) {
            //     return const SizedBox(height: 10);
            //   },
            //   itemCount: apiserviceproviderobj.listofallProdcut.length,
            // );