import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/locator.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/home_screen.dart';

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
