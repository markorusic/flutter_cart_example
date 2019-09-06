import 'package:flutter/cupertino.dart';
import 'package:shop_app/domain/Product.dart';
import 'package:shop_app/services/product_service.dart';

class ProductModel extends ChangeNotifier {
  static final _productService = ProductService();

  final List<Product> products = [];
  var loading = false;
  Error error;

  void fetchAll() async {
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
