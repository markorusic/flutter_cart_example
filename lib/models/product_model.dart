import 'package:flutter/cupertino.dart';
import 'package:flutter_cart_example/domain/Product.dart';
import 'package:flutter_cart_example/locator.dart';
import 'package:flutter_cart_example/services/product_service.dart';

class ProductModel extends ChangeNotifier {
  final _productService = locator<ProductService>();

  final List<Product> products = [];
  var loading = false;
  Error error;

  Future<void> fetchAll() async {
    loading = true;
    notifyListeners();
    try {
      final _products = await _productService.fetchAll();
      products.addAll(_products);
    } catch (e) {
      error = e;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
