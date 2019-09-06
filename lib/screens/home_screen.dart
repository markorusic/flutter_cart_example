import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/product_list.dart';
import 'package:shop_app/widgets/shared/load_error.dart';
import 'package:shop_app/widgets/shared/loading_indicator.dart';
import 'package:shop_app/widgets/shared/stateful_wrapper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () =>
          Provider.of<ProductModel>(context, listen: false).fetchAll(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: <Widget>[
            IconButton(
              icon: Badge(
                badgeContent: Consumer<CartModel>(
                  builder: (context, cartModel, child) {
                    return Text(
                      "${cartModel.totalItems}",
                      style: TextStyle(color: Colors.white),
                    );
                  },
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
            child: Consumer<ProductModel>(
              builder: (context, productModel, child) {
                if (productModel.loading) {
                  return LoadingIndicator(
                    loadingMessage: 'Loading...',
                  );
                }
                if (productModel.error != null) {
                  return LoadError(
                    errorMessage: productModel.error.toString(),
                    onRetryPressed: () => productModel.fetchAll(),
                  );
                }
                return ProductList(productModel.products);
              },
            ),
          ),
        ),
      ),
    );
  }
}
