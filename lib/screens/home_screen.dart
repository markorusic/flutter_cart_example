import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cart_example/models/cart_model.dart';
import 'package:flutter_cart_example/models/product_model.dart';
import 'package:flutter_cart_example/widgets/product_list.dart';
import 'package:flutter_cart_example/widgets/shared/data_container.dart';
import 'package:flutter_cart_example/widgets/shared/stateful_wrapper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);
    var productModel = Provider.of<ProductModel>(context);

    return StatefulWrapper(
      onInit: () => productModel.fetchAll(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: <Widget>[
            IconButton(
              icon: Badge(
                badgeContent: Text(
                  "${cartModel.totalItems}",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: DataContainer(
              loading: productModel.loading,
              error: productModel.error,
              onRetryPressed: productModel.fetchAll,
              child: ProductList(productModel.products),
            ),
          ),
        ),
      ),
    );
  }
}
