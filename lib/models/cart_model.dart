import 'package:flutter/cupertino.dart';
import 'package:shop_app/domain/Product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> products = [];

  double get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

  int get totalItems => products.length;

  void add(Product product) {
    products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    products.remove(product);
    notifyListeners();
  }

  bool inCart(Product product) {
    return products.contains(product);
  }

  void toggle(Product product) {
    if (inCart(product)) {
      remove(product);
    } else {
      add(product);
    }
  }
}
