import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cart_example/domain/Product.dart';
import 'package:flutter_cart_example/models/cart_model.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: products.map((product) => ProductListItem(product)).toList(),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[400],
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: product.photoUrl,
              width: 150,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(product.name),
            ),
            IconButton(
              icon: Icon(
                cartModel.inCart(product)
                    ? Icons.remove_shopping_cart
                    : Icons.add_shopping_cart,
              ),
              onPressed: () {
                cartModel.toggle(product);
              },
            )
          ],
        ),
      ),
    );
  }
}
