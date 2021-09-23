import 'package:flutter/material.dart';

import './routes.dart';
import 'theme/app_theme.dart';

void main() => runApp(FlutterFoodApp()); // função principal

class FlutterFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFood',
      theme: themeData,
      initialRoute: '/splash',
      routes: Routes.routes,
    );
  }
}
