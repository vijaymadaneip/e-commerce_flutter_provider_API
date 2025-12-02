import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart' as cartserviceobj;
import 'package:flutter_api/apiservices/orderProvider.dart';
import 'package:flutter_api/screens/Address/addNewAddress.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/cartScreen.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/screens/order/paymentSucces.dart';
import 'package:flutter_api/utils/widgets/orderProcessing.dart';
import 'package:provider/provider.dart';

class orderReview extends StatefulWidget {
  const orderReview({super.key});

  @override
  State<orderReview> createState() => _orderReviewState();
}

class _orderReviewState extends State<orderReview> {
  //payment options
  //method
  //with showmodalsheet
  void show_PaymetnOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Payment Method
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          //Cash On Delivary
                          Row(
                            children: [
                              Image.asset("assets/Payment/CashOnDelivary.png"),
                              const SizedBox(width: 45),
                              Text(
                                "Cash on delivery",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //VISA
                          Row(
                            children: [
                              Image.asset("assets/Payment/VISA.png"),
                              const SizedBox(width: 40),
                              Text(
                                "VISA",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          //MASTERCARD
                          Row(
                            children: [
                              Image.asset("assets/Payment/MASTERCARD.png"),
                              const SizedBox(width: 42),
                              Text(
                                "Master Card",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //PAYPAL
                          Row(
                            children: [
                              Image.asset("assets/Payment/PAYPAL.png"),
                              const SizedBox(width: 55),
                              Text(
                                "Paypal",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //EASYPAISA
                          Row(
                            children: [
                              Image.asset("assets/Payment/EASYPAISA.png"),
                              const SizedBox(width: 50),
                              Text(
                                "Easypaisa",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
            ),
          ],
        );
      },
    );
  }

  //change address
  //method
  //with show modalSheet
  void show_addresOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        bool isselected = false;
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Payment Method
                    Text(
                      "Select Address",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Name
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name of user",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Checkbox(
                                      //   value: isselected,
                                      //   onChanged: (togglevalue) {
                                      //     togglevalue ?? true;
                                      //   },
                                      // ),
                                      Checkbox(
                                        value: isselected,
                                        onChanged: (togglevalue) {
                                          setState(() {
                                            isselected = togglevalue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  //Contact Number
                                  Row(
                                    children: [
                                      Icon(Icons.call),
                                      const SizedBox(width: 10),
                                      Text(
                                        "+91 1231231230",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          // color: Color.fromRGBO(8, 87, 160, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  //Address of user
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      const SizedBox(width: 10),
                                      Text(
                                        "House no, City, State, Country, PinCode",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          // color: Color.fromRGBO(8, 87, 160, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => addNewAddress(),
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
                            "Add new address",
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = context.read<Orderprovider>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => Homescreen(),
                          //   ),
                          // );
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, size: 25),
                      ),

                      Text(
                        "Order Review",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => cartScreen(),
                            ),
                          );
                        },
                        child: Icon(Icons.shopping_cart, size: 30),
                      ),
                    ],
                  ),
                ),
                //list of finalized product
                Consumer<Cartprovider>(
                  builder: (context, cartproviderobj, child) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final singleproduct =
                            cartproviderobj.itemInCarts[index];
                        return Container(
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                            // color: Color.fromRGBO(8, 87, 160, 0.05),
                            color: Color.fromRGBO(231, 239, 246, 1),
                            borderRadius: BorderRadius.circular(20),
                            // border: Border.all(
                            //   width: 1,
                            //   color: Color.fromRGBO(8, 87, 160, 1),
                            // ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    // color: Color.fromRGBO(231,239,246,1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
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
                                      padding: const EdgeInsets.all(10),
                                      child: CachedNetworkImage(
                                        imageUrl: singleproduct.image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Consumer<apiserviceProvder>(
                                      builder:
                                          (
                                            context,
                                            apiserviceproviderobj,
                                            child,
                                          ) {
                                            return Text(
                                              apiserviceproviderobj
                                                  .shortenTitle(
                                                    singleproduct.title,
                                                  ),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            );
                                          },
                                    ),
                                    // Text(
                                    //   "Price : ₹${cartserviceobj.convertUSDtoINR(singleproduct.price).toStringAsFixed(0)}",
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   "Price: ${singleproduct.price} \$",
                                    //   style: TextStyle(
                                    //     fontSize: 17,
                                    //     fontWeight: FontWeight.w600,
                                    //   ),
                                    // ),
                                    Text(
                                      "Quantity: ${singleproduct.quantity}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      // "Price : ₹${cartserviceobj.convertUSDtoINR(singleProduct.price).toStringAsFixed(0)}",
                                      "Price: ₹ ${cartproviderobj.convertUSDtoINR(singleproduct.price).toStringAsFixed(0)}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: cartproviderobj.itemInCarts.length,
                    );
                  },
                ),

                const SizedBox(height: 10),
                //box for the payment
                //calcuation, tax, shipping, etc etc
                Consumer<Cartprovider>(
                  builder: (context, cartobj, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Subtotal
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "${cartobj.cartSubtotalINR.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                /*
                             Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("₹${cartproviderobj.cartSubtotalINR.toStringAsFixed(0)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
                            */
                                // Text(
                                //   "Amount",
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //shipping fee
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping Fee",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                // Text(
                                //   "Amount",
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                                Text(
                                  "${cartobj.shippingFeeINR.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //Tax Fee
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tax Fee",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                // Text(
                                //   "Amount",
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                                Text(
                                  "${cartobj.taxFeeINR.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //order Total
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order Total",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                // Text(
                                //   "Amount",
                                //   style: TextStyle(
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                                Text(
                                  "${cartobj.orderTotalINR.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(thickness: 1.5),
                            //Payment Method
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                //on tap of change
                                //we have to show modal bottom sheet
                                //to choose options
                                GestureDetector(
                                  onTap: () {
                                    show_PaymetnOptions();
                                  },
                                  child: Text(
                                    "Change",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(8, 87, 160, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  size: 30,
                                  color: Color.fromRGBO(8, 87, 160, 1),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "MasterCard",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    // color: Color.fromRGBO(8, 87, 160, 1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //Shipping Address
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                //on tap of change
                                //we have to show modal bottom sheet
                                //to choose options
                                GestureDetector(
                                  onTap: () {
                                    show_addresOptions();
                                  },
                                  child: Text(
                                    "Change",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(8, 87, 160, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //Name
                            Text(
                              "Name of user",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            //Contact Number
                            Row(
                              children: [
                                Icon(Icons.call),
                                const SizedBox(width: 10),
                                Text(
                                  "+91 1231231230",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    // color: Color.fromRGBO(8, 87, 160, 1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //Address of user
                            Row(
                              children: [
                                Icon(Icons.person),
                                const SizedBox(width: 10),
                                Text(
                                  "House no, City, State, Country, PinCode",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    // color: Color.fromRGBO(8, 87, 160, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Consumer<Cartprovider>(
                  builder: (context, cartserviceproviderobj, child) {
                    return GestureDetector(
                      onTap: () {
                        //Add all cart items to order list
                        orderProvider.addToOrderListfromCart(
                          cartserviceproviderobj.itemInCarts,
                        );

                        //Clear the cart
                        cartserviceproviderobj.itemInCarts.clear();
                        cartserviceproviderobj.notifyListeners();

                        //check and print in log
                        //list of produc in order list
                        orderProvider.checkproductinorderlist();

                        //Navigate to success page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => orderProcessing(),
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
                            // "Pay Now : Total \$",
                            "Pay Now : ₹${cartserviceproviderobj.orderTotalINR.toStringAsFixed(0)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
