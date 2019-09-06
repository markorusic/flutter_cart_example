import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:shop_app/domain/Product.dart';

class ProductService {
  Future<List<Product>> fetchAll() async {
    final productsJson = await rootBundle.loadString('assets/products.json');
    try {
      final products = (json.decode(productsJson)['data'] as List)
          .map((i) => Product.fromJson(i))
          .toList();
      return Future.delayed(Duration(milliseconds: 0), () => products);
    } catch (error) {
      log('Error parsing products json: ' + error.toString());
      throw new Exception('Unable to parse products as json');
    }
  }
}
