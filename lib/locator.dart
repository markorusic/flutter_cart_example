import 'package:get_it/get_it.dart';
import 'package:shop_app/services/category_service.dart';
import 'package:shop_app/services/product_service.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => CategoryService());
}
