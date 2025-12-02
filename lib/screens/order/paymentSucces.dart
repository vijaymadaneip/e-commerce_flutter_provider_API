import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/utils/widgets/orderProcessing.dart';
import 'package:flutter_api/utils/widgets/snackbar.dart';

class paymenSuccess extends StatefulWidget {
  const paymenSuccess({super.key});

  @override
  State<paymenSuccess> createState() => _paymenSuccessState();
}

class _paymenSuccessState extends State<paymenSuccess> {

  // @override
  // void initState() {
  //   super.initState();
  //   showCustomMessage(context, "Order Placed Successfully!");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Payment/paymentsucess.png"),
            // ClipRRect(
            //   // borderRadius: BorderRadius.circular(15),
            //   child: Image.asset(
            //     "assets/Payment/paymentsucess.png",
            //     fit: BoxFit.fill, // or BoxFit.fill / BoxFit.fitWidth
            //   ),
            // ),
            Text(
              "Payment Success!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text(
              "Your item will be shipped soon!",
              style: TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Homescreen()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(8, 87, 160, 1.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
