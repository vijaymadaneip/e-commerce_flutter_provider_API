import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/orderProvider.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/cartScreen.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/utils/widgets/descriptionofProduct.dart';
import 'package:provider/provider.dart';

class Myorderscreen extends StatefulWidget {
  const Myorderscreen({super.key});

  @override
  State<Myorderscreen> createState() => _MyorderscreenState();
}

class _MyorderscreenState extends State<Myorderscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      "My Orders",
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
              const SizedBox(height: 20),
              Consumer<Orderprovider>(
                builder: (context, orderProvideobj, child) {
                  return orderProvideobj.ItemInTheOrderList.isEmpty
                      ? Center(
                          child: Text(
                            "No Orders",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            //Extract
                            //single Product
                            //from the order list scree
                            final singleProductfromOrderList =
                                orderProvideobj.ItemInTheOrderList[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => descriptionofProduct(
                                      productinfo: singleProductfromOrderList,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // color: Color.fromRGBO(8, 87, 160, 0.01),
                                  // color: Color.fromRGBO(8, 87, 160, 0.05),
                                  color: Color.fromRGBO(231, 239, 246, 1),
                                  
                                  // border: Border.all(
                                  //   width: 1,
                                  //   color: Color.fromRGBO(8, 87, 160, 2),
                                  // ),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     // color: Color.fromRGBO(8, 87, 160, 0.05),
                                  //     color: Color.fromRGBO(8, 87, 160, 1),
                                  //     offset:Offset(0, 4) ,
                                  //     blurRadius:16 ,
                                  //     spreadRadius: 2,
                                  //   )
                                  // ]
                                  boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            ),
                                  ]
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          // border: Border.all(width: 1)
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  singleProductfromOrderList
                                                      .image,
                                              fit: BoxFit.contain,
                                              width: double.infinity,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // singleProductfromOrderList.title,
                                            orderProvideobj.shortenTitle(
                                              singleProductfromOrderList.title,
                                            ),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "Total Price: ₹ ${singleProductfromOrderList.price.toStringAsFixed(0)}",
                                            // "Price:${cartproivderobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Text(
                                                "OrderId : #${singleProductfromOrderList.hashCode}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                "Quantity : ${singleProductfromOrderList.quantity}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Status : ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Processing",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.orange,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemCount: orderProvideobj.ItemInTheOrderList.length,
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
