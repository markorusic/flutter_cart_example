import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/widgets/product_list.dart';

class CartScreen extends StatelessWidget {
  void _showSuccessfulCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Successfully purchased!"),
        actions: <Widget>[
          FlatButton(
            child: Text("Close"),
            onPressed: () => Navigator.of(context).pushNamed('/'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Center(
          child: cart.isEmpty
              ? Text(
                  'Your cart is empty!',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Products in cart: ${cart.totalItems}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Total price: ${cart.totalPrice}\$',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                cart.checkout();
                                _showSuccessfulCheckoutDialog(context);
                              },
                              padding: EdgeInsets.only(left: 23, right: 23),
                              color: Colors.blue,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.payment,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Checkout',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ProductList(cart.products),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
