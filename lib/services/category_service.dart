import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:shop_app/domain/Category.dart';

class CategoryRepository {
  Future<List<Category>> fetchAll() async {
    final categoriesJson =
        await rootBundle.loadString('assets/categories.json');
    try {
      return (json.decode(categoriesJson)['data'] as List)
          .map((i) => Category.fromJson(i))
          .toList();
    } catch (error) {
      log('Error parsing categories json: ' + error.toString());
      throw new Exception('Unable to parse categories as json');
    }
  }
}
