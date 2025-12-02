import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_api/screens/order/paymentSucces.dart';
import 'package:flutter_api/utils/widgets/snackbar.dart';
import 'package:lottie/lottie.dart';

class orderProcessing extends StatefulWidget {
  const orderProcessing({super.key});

  @override
  State<orderProcessing> createState() => _orderProcessingState();
}

class _orderProcessingState extends State<orderProcessing> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return paymenSuccess();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              // LottieBuilder.asset(
              //   "assets/Lottie/loading.json",
              //   width: MediaQuery.of(context).size.width,
              //   height: 280,
              // ),
              const SizedBox(height: 20),
              const Text(
                "Your order is processing.... ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
