import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/apimodel/newProduct.dart';

class Cartprovider extends ChangeNotifier {
 

  final List<Product> _itemInCarts = [];

  List<Product> get itemInCarts => _itemInCarts;

  void addProductToCart(Product product) {
    bool isAlereadyInCart = _itemInCarts.any((item) => item.id == product.id);

    if (isAlereadyInCart) {
      int indexofItemwhichisalreaiinCart = _itemInCarts.indexWhere(
        (item) => item.id == product.id,
      );

      _itemInCarts[indexofItemwhichisalreaiinCart].quantity++;
    } else {
      _itemInCarts.add(
        Product(
          id: product.id,
          title: product.title,
          price: product.price,
          description: product.description,
          category: product.category,
          image: product.image,
          rating: product.rating,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  //increment
  // void increaseQuantity(int index) {
  //   itemInCarts[index].quantity++;
  //   notifyListeners();
  // }

  void increaseQuantityById(int productId) {
    int index = _itemInCarts.indexWhere((item) => item.id == productId);
    if (index != -1) {
      _itemInCarts[index].quantity++;
      notifyListeners();
    }
  }

  //decrement
  // void decreseQuantity(int index) {
  //   if (itemInCarts[index].quantity > 1) {
  //     itemInCarts[index].quantity--;
  //   } else {
  //     itemInCarts.removeAt(index);
  //   }
  //   notifyListeners();
  // }

  void decreaseQuantityById(int productId) {
    int index = _itemInCarts.indexWhere((item) => item.id == productId);
    if (index != -1) {
      if (_itemInCarts[index].quantity > 1) {
        _itemInCarts[index].quantity--;
      } else {
        _itemInCarts.removeAt(index);
      }
      notifyListeners();
    }
  }

  //direct remove from the card
  void directremovefromCart(int index) {
    if (itemInCarts[index].quantity >= 1) {
      itemInCarts.removeAt(index);
      notifyListeners();
    }
  }

  //get the quantity
  //of the product
  int getQuantityofProduct(int id) {
    try {
      return itemInCarts.firstWhere((item) => item.id == id).quantity;
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }




//Rate or the doller
  static const double usdToInrRate = 89.0;

  //dolller to indian rupees
  double convertUSDtoINR(double usd) {
    const double rate = 89.0;
    return usd * rate;
  }

  // SUBTOTAL in USD
  double get cartSubtotalUSD {
    double total = 0;
    for (var item in _itemInCarts) {
      total += item.price * item.quantity;
    }
    return total;
  }

  //total of the all product in car
  double get cartSubtotalINR {
    return  cartSubtotalUSD * usdToInrRate;
  }

  //shipping fee
  double get shippingFeeINR {
    return _itemInCarts.isEmpty ? 0 : 50;
  }

  // tax fees
  double get taxFeeINR {
    return 0;
  }

  // FINAL ORDER TOTAL
  double get orderTotalINR {
    return cartSubtotalINR + shippingFeeINR + taxFeeINR;
  }
}
