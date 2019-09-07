import 'package:flutter/cupertino.dart';
import 'package:flutter_cart_example/domain/Product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> products = [];

  double get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

  int get totalItems => products.length;

  bool get isEmpty => totalItems == 0;

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

  void checkout() {
    products.clear();
    notifyListeners();
  }
}
