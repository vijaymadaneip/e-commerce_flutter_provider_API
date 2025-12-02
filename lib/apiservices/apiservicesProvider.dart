import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_api/apimodel/newProduct.dart';
import 'package:http/http.dart' as http;

class apiserviceProvder extends ChangeNotifier {
  //list of products
  List<Product> _listofProduct = [];
  List<String> _categories = [];

  //getter for list
  List<Product> get listofallProdcut => _listofProduct;
  List<String> get categories => _categories;

  Future<void> fetchProducts() async {
    log("Inside fetch we are fetchting......");

    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        // log("Length of ProductLIST--${jsonData}");

        _listofProduct = jsonData
            .map((data) => Product.fromJson(data))
            .toList();

        notifyListeners();
        log("Length of ProductLIST ${_listofProduct.length}");
        log("${_listofProduct}");
        // for(dynamic singleproduct in listofallProdcut){
        //   log("${singleproduct}");
        // }
        // setState(() {
        //   // Proucts = jsonData.map((data)=>Products.fromJSON(data)).toList();
        //   listofProduct = jsonData
        //       .map((data) => Product.fromJson(data))
        //       .toList();
        // }
        // );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      // notifyListeners();
    }
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

  //fetch by categories

  // Future<void> fetchCategories() async {
  //   log("Inside fetch we are fetchting by categoeis......");
  //   final response = await http.get(
  //     Uri.parse("https://fakestoreapi.com/products/categories"),
  //   );

  //   try {
  //     if (response.statusCode == 200) {
  //       List<dynamic> jsonData = json.decode(response.body);

  //       log("Length of the categorie: ${jsonData.length}");
  //       _categories = List<String>.from(jsonData);

  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     log("Category fetch error: $e");
  //   }
  // }

  // NEW FUNCTION — Products of selected category
  List<Product> getProductsByCategory(String categoryName) {
    return _listofProduct
        .where((product) => product.category == categoryName)
        .toList();
  }
}











// Future<void> fetchProducts() async{

//   final response = await http.get(Uri.parse("https://api.restful-api.dev/objects"));

//   if(response.statusCode==200){
//     List<dynamic> jsonData = json.decode(response.body);
    
//   }
// }


/*
class apiserviceProvder extends ChangeNotifier {
  List<Product> _listofProduct = [];

  // new: list of category names (String)
  List<String> _categories = [];

  // getters
  List<Product> get listofallProdcut => _listofProduct;
  List<String> get categories => _categories;

  // fetch all products
  Future<void> fetchProducts() async {
    log("Inside fetch we are fetching products......");

    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        _listofProduct =
            jsonData.map((data) => Product.fromJson(data)).toList();

        notifyListeners();
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  //  NEW FUNCTION — Fetch categories
  Future<void> fetchCategories() async {
    log("Fetching categories...");

    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
    );

    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        _categories = List<String>.from(jsonData);

        notifyListeners();
        log("Categories = $_categories");
      }
    } catch (e) {
      log("Category error: $e");
    }
  }

  // NEW FUNCTION — Products of selected category
  List<Product> getProductsByCategory(String categoryName) {
    return _listofProduct
        .where((product) => product.category == categoryName)
        .toList();
  }
}


@override
void initState() {
  super.initState();
  final provider = Provider.of<apiserviceProvder>(context, listen: false);
  provider.fetchProducts();
  provider.fetchCategories(); // 🔥 important
}


Consumer<apiserviceProvder>(
  builder: (context, provider, child) {
    if (provider.categories.isEmpty) {
      return const CircularProgressIndicator();
    }

    selectedCategory = selectedCategory.isEmpty
        ? provider.categories.first
        : selectedCategory;

    return DropdownButton(
      value: selectedCategory,
      items: provider.categories.map((cat) {
        return DropdownMenuItem(
          value: cat,
          child: Text(cat),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
        });
      },
    );
  },
),
Consumer<apiserviceProvder>(
  builder: (context, provider, child) {
    List<Product> catProducts =
        provider.getProductsByCategory(selectedCategory);

    return Expanded(
      child: ListView.builder(
        itemCount: catProducts.length,
        itemBuilder: (context, index) {
          final product = catProducts[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.category),
            leading: Image.network(product.image, height: 50),
          );
        },
      ),
    );
  },
),

*/