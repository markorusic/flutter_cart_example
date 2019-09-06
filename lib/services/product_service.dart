import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/domain/Product.dart';

class ProductService {
  static List<Product> _parseProducts(String productsJson) {
    return (json.decode(productsJson)['data'] as List)
        .map((i) => Product.fromJson(i))
        .toList();
  }

  Future<List<Product>> fetchAll() async {
    final productsJson = await rootBundle.loadString('assets/products.json');
    try {
      final products = compute(_parseProducts, productsJson);
      return Future.delayed(Duration(milliseconds: 0), () => products);
    } catch (error) {
      log('Error parsing products json: ' + error.toString());
      throw new Exception('Unable to parse products as json');
    }
  }
}
