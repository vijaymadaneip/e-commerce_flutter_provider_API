import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apimodel/newProduct.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/apiservices/wishlistProvider.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/cartScreen.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/utils/widgets/descriptionofProduct.dart';
import 'package:provider/provider.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    //instacne of the provider
    final provider = Provider.of<apiserviceProvder>(context);
    final cartproivderobj = Provider.of<Cartprovider>(context);

    //list of the
    //particular categories
    final List<Product> products = provider.getProductsByCategory(
      widget.categoryName,
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10,),
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
                    "${widget.categoryName}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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

            products.isEmpty
                ? Center(child: Text("No products found"))
                : Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        //extract
                        //single product
                        //according to category
                        final singleProduct = products[index];
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
                              color: Color.fromRGBO(8, 87, 160, 0.05),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 0.3),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    //image of product
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                        child: Container(
                                          width: 145,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Consumer<Wishlistprovider>(
                                                builder:
                                                    (
                                                      context,
                                                      wishlistproviderobj,
                                                      child,
                                                    ) {
                                                      bool isinthewishList =
                                                          wishlistproviderobj
                                                              .isitIntheWishList(
                                                                singleProduct
                                                                    .id,
                                                              );
                                                      return Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                  15,
                                                                ),
                                                            child: AspectRatio(
                                                              aspectRatio: 1,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets.all(
                                                                      4,
                                                                    ),
                                                                child: CachedNetworkImage(
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

                                                                log(
                                                                  "Fav icon in clicked in landing scree",
                                                                );
                                                              },
                                                              child: Icon(
                                                                isinthewishList
                                                                    ? Icons
                                                                          .favorite
                                                                    : Icons
                                                                          .favorite_border,
                                                                color:
                                                                    isinthewishList
                                                                    ? Colors.red
                                                                    : Colors
                                                                          .black,
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
                                      padding: EdgeInsetsGeometry.only(
                                        right: 10,
                                        left: 10,
                                      ),
                                      child: Text(
                                        singleProduct.title,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //
                                //
                                //
                                //
                                //
                                Positioned(
                                  bottom: 5,
                                  left: 10,
                                  child: Text(
                                    // "Price : ₹${cartserviceobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                    "Price: ${cartproivderobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
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
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text("Added to cart!"),
                                        ),
                                      );
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
                      itemCount: products.length,
                    ),
                  ),
            // products.isEmpty
            //     ? Center(child: Text("No products found"))
            //     : Expanded(
            //         child: ListView.builder(
            //           itemCount: products.length,
            //           itemBuilder: (context, index) {
            //             final p = products[index];
            //             return ListTile(
            //               leading: Image.network(p.image, height: 50),
            //               title: Text(p.title),
            //               subtitle: Text("₹ ${p.price}"),
            //             );
            //           },
            //         ),
            //       ),
            // Consumer<apiserviceProvder>(
            //   builder: (context, apiserviceobj, child) {

            //     return ListView.separated(itemBuilder: (context,index){
            //       return Container(height: 100,width: 100,color: Colors.amber,);
            //     }, separatorBuilder: (context,index){
            //       return const SizedBox(height: 10,);
            //     }, itemCount: apiserviceobj.listofallProdcut.length);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}


/*


GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => categoryScreen(categoryName: "electronics"),
      ),
    );
  },
  child: Column(
    children: [
      CircleAvatar(
        radius: 35,
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Image.asset("assets/category/electronics.png"),
      ),
      SizedBox(height: 5),
      Text("Electronics"),
    ],
  ),
),

onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => categoryScreen(categoryName: "jewelery"),
    ),
  );
},

categoryScreen(categoryName: "women's clothing")
categoryScreen(categoryName: "men's clothing")

List<Product> getProductsByCategory(String categoryName) {
  return _listofProduct
      .where((product) => product.category == categoryName)
      .toList();
}

*/