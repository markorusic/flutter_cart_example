import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/Product.dart';
import 'package:shop_app/models/cart_model.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList(this.products);

  Widget _buildItem(Product product) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) {
        final inCart = cartModel.inCart(product);
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                product.photoUrl,
                width: 180,
              ),
              Text(
                product.name,
              ),
              IconButton(
                icon: Icon(inCart
                    ? Icons.remove_shopping_cart
                    : Icons.add_shopping_cart),
                onPressed: () {
                  cartModel.toggle(product);
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: products.map(_buildItem).toList(),
    );
  }
}
