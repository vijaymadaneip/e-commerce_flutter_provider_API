import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_api/apimodel/newProduct.dart';

class Orderprovider extends ChangeNotifier {
  final List<Product> _itemInTheOrderList = [];

  List<Product> get ItemInTheOrderList => _itemInTheOrderList;

  void checkproductinorderlist() {
  for (var pro in _itemInTheOrderList) {
    log("ID: ${pro.id}, Title: ${pro.title}, Price: ${pro.price}, Qty: ${pro.quantity}");
  }
}


  void addToOrderListfromCart(List<Product> cartItems) {
    for (var product in cartItems) {
      _itemInTheOrderList.add(
        Product(
          id: product.id,
          title: product.title,
          // price: product.price,
          price: product.price * 89 * product.quantity,

          description: product.description,
          category: product.category,
          image: product.image,
          rating: product.rating,
          quantity: product.quantity, 
        ),
      );
    }
    notifyListeners();

    log("Length of our Order List: ${_itemInTheOrderList.length}");
    
  }


  String shortenTitle(String title) {
    // Split the title into words
    List<String> words = title.split(' ');

    if (words.length > 3) {
      return '${words.sublist(0, 4).join(' ')}...';
    } else {
      return title;
    }
  }
}
