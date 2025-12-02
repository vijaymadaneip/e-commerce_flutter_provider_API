import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apimodel/newProduct.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/screens/order/orderreview.dart';
import 'package:flutter_api/utils/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class descriptionofProduct extends StatefulWidget {
  const descriptionofProduct({super.key, required this.productinfo});

  final Product productinfo;

  @override
  State<descriptionofProduct> createState() => _descriptionofProductState();
}

class _descriptionofProductState extends State<descriptionofProduct> {
  @override
  Widget build(BuildContext context) {
    final cartproivderobj = Provider.of<Cartprovider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<apiserviceProvder>(
          builder: (context, apiserviceproviderobj, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Consumer<Cartprovider>(
                  builder: (context, cartserviceobj, child) {
                    //quantity of
                    //product
                    int quantityofproduct = cartserviceobj.getQuantityofProduct(
                      widget.productinfo.id,
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),

                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black38,
                            //     blurRadius: 4,
                            //     offset: Offset(4, 8),
                            //   ),
                            // ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.productinfo.image,
                            ),
                          ),
                        ),
                        // const SizedBox(height: 5),
                        Text(
                          // "Price : ${widget.productinfo.price}\$",
                          "Price: ₹${cartproivderobj.convertUSDtoINR(widget.productinfo.price).toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${widget.productinfo.title}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Description",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 30),
                                const SizedBox(width: 5),
                                Text(
                                  "${widget.productinfo.rating}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ReadMoreText(
                          "${widget.productinfo.description}",
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: " More",
                          trimExpandedText: " Less",
                          moreStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),

                          lessStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),

                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 5),
                            //-
                            GestureDetector(
                              onTap: () {
                                // cartserviceobj.decreseQuantity(widget.productinfo.)
                                // cartserviceobj.decreaseQuantityById(
                                //   widget.productinfo.id,
                                // );
                                if (quantityofproduct > 0) {
                                  cartserviceobj.decreaseQuantityById(
                                    widget.productinfo.id,
                                  );
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // quantity text
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  "${quantityofproduct}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // +
                            GestureDetector(
                              onTap: () {
                                // cartserviceobj.increaseQuantityById(
                                //   widget.productinfo.id,
                                // );
                                if (quantityofproduct == 0) {
                                  cartserviceobj.addProductToCart(
                                    widget.productinfo,
                                  );
                                } else {
                                  cartserviceobj.increaseQuantityById(
                                    widget.productinfo.id,
                                  );
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),

                            // -
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            cartproivderobj.addProductToCart(
                              widget.productinfo,
                            );
                            showCustomMessage(
                              context,
                              "Item Successfully Added to Cart!",
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => orderReview(),
                              ),
                            );
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text("Added to cart!")),
                            // );
                          },
                          // onTap: () {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => orderReview(),
                          //     ),
                          //   );
                          // },
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
              ),
            );
          },
        ),
      ),
    );
  }
}
