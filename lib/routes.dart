import 'package:flutter/material.dart';

import './screens/auth/register_page.dart';
import './screens/auth/login_page.dart';
import './screens/restaurants/restaurant_page.dart';
import './screens/foods/foods_page.dart';
import './screens/cart/cart_page.dart';
import './screens/orders/order_page.dart';
import './screens/order_details/order_details.dart';
import './screens/evaluations_order/evaluations_order.dart';
import './screens/profile/profile_page.dart';
import './screens/splash/spash_page.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    '/splash': (context) => SplashScreen(),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/restaurants': (context) => RestaurantsPage(),
    '/foods': (context) => FoodsScreen(),
    '/cart': (context) => CartScreen(),
    '/orders': (context) => OrdersScreen(),
    '/details-order': (context) => OrderDetailsScreen(),
    '/evaluation-order': (context) => EvaluationOrderScreen(),
    '/profile': (context) => ProfileScreen(),
  };
}
