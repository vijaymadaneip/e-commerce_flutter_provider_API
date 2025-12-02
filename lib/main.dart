import 'package:flutter/material.dart';
import 'package:flutter_api/apiservices/apiservicesProvider.dart';
import 'package:flutter_api/apiservices/cartProvider.dart';
import 'package:flutter_api/apiservices/orderProvider.dart';
import 'package:flutter_api/apiservices/wishlistProvider.dart';
import 'package:flutter_api/screens/homeScreen.dart';
import 'package:flutter_api/screens/landingScreen.dart';
import 'package:flutter_api/screens/order/orderreview.dart';
import 'package:flutter_api/utils/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => apiserviceProvder()),
        ChangeNotifierProvider(create: (context) => Wishlistprovider()),
        ChangeNotifierProvider(create: (context)=>Cartprovider()),
        ChangeNotifierProvider(create: (context)=>Orderprovider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home :splashScreen(),
        // home: Homescreen(),
        // home: orderReview(),
        // home:  landingScreen(),
      ),
    );
  }
}
