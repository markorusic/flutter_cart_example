import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/widgets/product_list.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Container(
          child: Consumer<CartModel>(
            builder: (context, cartModel, child) =>
                ProductList(cartModel.products),
          ),
        ),
      ),
    );
  }
}
