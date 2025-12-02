import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_api/apimodel/newProduct.dart';

class Wishlistprovider extends ChangeNotifier {
  List<Product> _wishlistLIST = [];

  List<Product> get allwishlistList => _wishlistLIST;

  //ADDing to wishList
  void addToWishListProduct(Product productInfo) {

    //check is in list
    bool alreadyinwishlist = _wishlistLIST.any(
      (item) => item.id == productInfo.id,
    );

    //if in list remove
    if (alreadyinwishlist) {
      log("Product is alread in our wishlist");
      _wishlistLIST.removeWhere((item) => item.id == productInfo.id);
      
      return;
    }

    //if not add
    _wishlistLIST.add(
      Product(
        id: productInfo.id,
        title: productInfo.title,
        price: productInfo.price,
        description: productInfo.description,
        category: productInfo.category,
        image: productInfo.image,
        rating: productInfo.rating,
        quantity: 1,
      ),
    );

    notifyListeners();
    log("Length of our wishlist: ${_wishlistLIST.length}");
  }

  //Removing From Wishlit

  // void removeFromWishList(int index) {
  //   _wishlistLIST.removeAt(index);
  //   notifyListeners();
  //   log("Length of our wishlist: ${_wishlistLIST.length}");
  // }

  //increse
  //quantity of product
  void increaseQuantity(int index) {
    allwishlistList[index].quantity++;
    notifyListeners();
  }

  //decres
  //quantity of product
  void decreseQuantity(int index) {
    if (allwishlistList[index].quantity > 1) {
      allwishlistList[index].quantity--;
      notifyListeners();
    } else {
      allwishlistList.removeAt(index);
      notifyListeners();
    }
  }

  //check is it in the
  bool isitIntheWishList(int id) {
    if( _wishlistLIST.any((item) => item.id == id)){
      return true;
    }else{
      return false;
    }
  }



  
  // void onfavIconClicked(Product produtinfo) {
  //   _wishlistLIST.add(
  //     Product(
  //       id: produtinfo.id,
  //       title: produtinfo.title,
  //       price: produtinfo.price,
  //       description: produtinfo.description,
  //       category: produtinfo.category,
  //       image: produtinfo.image,
  //       rating: produtinfo.rating,
  //     ),
  //   );
  //   notifyListeners();
  //   log("length of wishlist is : ${_wishlistLIST.length}");
  // }

  //increse
  //quantity of product
  // void increaseQuantity(int index) {
  //   allwishlistList[index].quantity++;
  //   notifyListeners();
  // }

  //decres
  //quantity of product
  // void decreseQuantity(int index){
  //   if(allwishlistList[index].quantity>1){
  //     allwishlistList[index].quantity--;
  //     notifyListeners();
  //   }else{
  //     allwishlistList.removeAt(index);
  //     notifyListeners();
  //   }
  // }
}
