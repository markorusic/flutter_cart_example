import 'package:get_it/get_it.dart';
import 'package:flutter_cart_example/services/product_service.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => ProductService());
}
