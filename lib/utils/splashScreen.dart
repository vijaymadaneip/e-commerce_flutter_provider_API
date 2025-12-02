import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    //fetch products
    log("Inside the splash Screen -- we are Fetching the Products...");

    final apiserviceprovider = Provider.of<apiserviceProvder>(
      context,
      listen: false,
    );
    apiserviceprovider.fetchProducts();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
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
              Container(
                // height: MediaQuery.of(context).size.height/1.5,
                // height: 300,
                child: LottieBuilder.asset(
                  "assets/Lottie/welcome.json",
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                ),
              ),
              Center(
                child: const Text(
                  "Welcome to ShopNow ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Your one-stop destination for effortless and ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.blueGrey),
                ),
              ),
              Center(
                child: Text(
                  "enjoyable shopping",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
