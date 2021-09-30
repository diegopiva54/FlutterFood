import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import 'theme/app_theme.dart';
import '../stores/foods.store.dart';
import '../stores/categories.store.dart';
import '../stores/rastaurant.store.dart';
import '../stores/orders.store.dart';
import '../stores/auth.store.dart';

void main() => runApp(FlutterFoodApp()); // função principal

class FlutterFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodsStore>(
          create: (_) => FoodsStore(),
        ),
        Provider<CategoriesStore>(
          create: (_) => CategoriesStore(),
        ),
        Provider<RestaurantStore>(
          create: (_) => RestaurantStore(),
        ),
        Provider<OrdersStore>(
          create: (_) => OrdersStore(),
        ),
        Provider<AuthStore>(
          create: (_) => AuthStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterFood',
        theme: themeData,
        initialRoute: '/splash',
        routes: Routes.routes,
      ),
    );
  }
}
