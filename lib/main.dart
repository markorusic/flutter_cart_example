import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cart_example/locator.dart';
import 'package:flutter_cart_example/models/cart_model.dart';
import 'package:flutter_cart_example/models/product_model.dart';
import 'package:flutter_cart_example/screens/cart_screen.dart';
import 'package:flutter_cart_example/screens/home_screen.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => CartModel()),
        ChangeNotifierProvider(builder: (context) => ProductModel()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
