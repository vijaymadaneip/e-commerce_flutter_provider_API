import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/apiservices/wishlistProvider.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/cartScreen.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/utils/widgets/descriptionofProduct.dart';
import 'package:flutter_api/utils/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class wishListScreen extends StatefulWidget {
  const wishListScreen({super.key});

  @override
  State<wishListScreen> createState() => _wishListScreenState();
}

class _wishListScreenState extends State<wishListScreen> {
  @override
  Widget build(BuildContext context) {
    final cartproivderobj = Provider.of<Cartprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "WishList",
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
              // const SizedBox(height: 10),
              Consumer<Wishlistprovider>(
                builder: (context, wishlistobj, child) {
                  return wishlistobj.allwishlistList.isEmpty
                      ? Center(
                          child: Text(
                            "No item in the wish list",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.64,
                              ),
                          itemCount: wishlistobj.allwishlistList.length,
                          itemBuilder: (context, index) {
                            //Extract
                            //single product
                            //from list of the wishlist
                            final singlewishlistproduct =
                                wishlistobj.allwishlistList[index];

                            //bool check
                            bool isinthewishList = wishlistobj
                                .isitIntheWishList(singlewishlistproduct.id);

                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => descriptionofProduct(
                                      productinfo: singlewishlistproduct,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                // elevation: 8,
                                // clipBehavior: Clip.antiAlias,
                                // color: Colors.white,
                                // shadowColor: Colors.blueGrey,
                                clipBehavior: Clip.antiAlias,
                                surfaceTintColor: Colors.transparent,
                                // color: Color.fromRGBO(8, 87, 160, 0.05),
                                color: Color.fromRGBO(231, 239, 246, 1),
                                shadowColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15,
                                  ),
                                  // side: BorderSide(
                                  //   // color: Colors.black,
                                  //   color: Color.fromRGBO(8, 87, 160, 2),
                                  //   width: 0.8,
                                  // ),
                                ),
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 1,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      singlewishlistproduct
                                                          .image,
                                                  fit: BoxFit.contain,
                                                  width: double.infinity,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 6,
                                            right: 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                wishlistobj
                                                    .addToWishListProduct(
                                                      singlewishlistproduct,
                                                    );
                                                wishlistobj.notifyListeners();
                                              },
                                              child: Icon(
                                                isinthewishList
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: isinthewishList
                                                    ? Colors.red
                                                    : Colors.black,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // ReadMoreText(
                                      //   singlewishlistproduct.title,
                                      //   trimLines: 2,
                                      //   trimMode: TrimMode.Line,
                                      //   trimCollapsedText: " More",
                                      //   trimExpandedText: " Less",
                                      //   moreStyle: const TextStyle(
                                      //     fontSize: 12,
                                      //     fontWeight: FontWeight.bold,
                                      //     color: Colors.black,
                                      //   ),

                                      //   lessStyle: const TextStyle(
                                      //     fontSize: 12,
                                      //     fontWeight: FontWeight.bold,
                                      //     color: Colors.black,
                                      //   ),

                                      //   style: TextStyle(fontSize: 15, color: Colors.black),
                                      // ),
                                      // Text(
                                      //   singlewishlistproduct.title,
                                      //   style: TextStyle(
                                      //     fontSize: 16,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      //   maxLines: 2,
                                      //   overflow: TextOverflow.ellipsis,
                                      // ),
                                      // Expanded(
                                      //   child: Padding(
                                      //     padding: EdgeInsets.all(8),
                                      //     child: Text(
                                      //       singlewishlistproduct.title,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w600,
                                      //       ),
                                      //       maxLines: 2,
                                      //       // overflow: TextOverflow.ellipsis,
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(height: 5),
                                      Text(
                                        singlewishlistproduct.title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            // "Price : ₹${cartserviceobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                            "Price: ₹${cartproivderobj.convertUSDtoINR(singlewishlistproduct.price).toStringAsFixed(0)}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Icon(
                                          //       Icons.star,
                                          //       color: Colors.amber,
                                          //       size: 20,
                                          //     ),
                                          //     const SizedBox(width: 5),
                                          //     Text(
                                          //       "${singlewishlistproduct.rating}",
                                          //       style: TextStyle(
                                          //         fontSize: 12,
                                          //         fontWeight: FontWeight.w400,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),

                                      // const SizedBox(
                                      //   height: 5,
                                      // ),

                                      // ReadMoreText(
                                      //   singlewishlistproduct.title,
                                      //   trimLines: 2,
                                      //   trimMode: TrimMode.Line,
                                      //   trimCollapsedText: " More",
                                      //   trimExpandedText: " Less",
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     fontWeight: FontWeight.w600,
                                      //   ),
                                      // ),
                                      Consumer<Cartprovider>(
                                        builder: (context, cartproviderobj, child) {
                                          return GestureDetector(
                                            onTap: () {
                                              cartproviderobj.addProductToCart(
                                                singlewishlistproduct,
                                              );
                                              showCustomMessage(
                                                context,
                                                "Item Successfully Added to Cart!",
                                              );
                                              // ScaffoldMessenger.of(
                                              //   context,
                                              // ).showSnackBar(
                                              //   SnackBar(
                                              //     content: Text(
                                              //       "Added to cart!",
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                            child: Container(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width /
                                                  1,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                border: Border.all(width: 2),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Add to Cart",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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



                                          // Spacer(),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     wishlistobj.addToWishListProduct(
                                          //       singlewishlistproduct,
                                          //     );
                                          //     wishlistobj.notifyListeners();
                                          //   },
                                          //   child: Icon(
                                          //     isinthewishList
                                          //         ? Icons.favorite
                                          //         : Icons.favorite_border,
                                          //     color: isinthewishList
                                          //         ? Colors.red
                                          //         : Colors.black,
                                          //     size: 30,
                                          //   ),
                                          // ),



 // Row(
                                      //   children: [
                                      //     // - button
                                      //     // IconButton(
                                      //     //   icon: Icon(Icons.remove_circle_outline),
                                      //     //   onPressed: () {
                                      //     //     wishlistobj.decreseQuantity(index);
                                      //     //   },
                                      //     // ),
                                      //     GestureDetector(
                                      //       onTap: () {
                                      //         wishlistobj.decreseQuantity(index);
                                      //       },
                                      //       child: Container(
                                      //         height: 30,
                                      //         width: 30,
                                      //         decoration: BoxDecoration(
                                      //           color: Colors.white,
                                      //           borderRadius: BorderRadius.circular(10),
                                      //           border: Border.all(width: 2),
                                      //         ),
                                      //         child: Icon(Icons.remove),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width: 10),

                                      //     // quantity text
                                      //     Container(
                                      //       height: 30,
                                      //       width: 30,
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.white,
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         border: Border.all(width: 2),
                                      //       ),
                                      //       child: Center(
                                      //         child: Text(
                                      //           "${singlewishlistproduct.quantity}",
                                      //           style: TextStyle(
                                      //             fontSize: 20,
                                      //             fontWeight: FontWeight.bold,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width: 10),

                                      //     // + button
                                      //     GestureDetector(
                                      //       onTap: () {
                                      //         wishlistobj.increaseQuantity(index);
                                      //       },
                                      //       child: Container(
                                      //         height: 30,
                                      //         width: 30,
                                      //         decoration: BoxDecoration(
                                      //           color: Colors.white,
                                      //           borderRadius: BorderRadius.circular(10),
                                      //           border: Border.all(width: 2),
                                      //         ),
                                      //         child: Icon(Icons.add),
                                      //       ),
                                      //     ),
                                      //     // IconButton(
                                      //     //   icon: Icon(Icons.add_circle_outline),
                                      //     //   onPressed: () {
                                      //     //     wishlistobj.increaseQuantity(index);
                                      //     //   },
                                      //     // ),
                                      //   ],
                                      // ),
                                      // const SizedBox(height: 5),