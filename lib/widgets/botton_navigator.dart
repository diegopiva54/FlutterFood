import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottonNavigatorCurved extends StatelessWidget {
  int _active_menu = 0;

  BottonNavigatorCurved(this._active_menu);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).backgroundColor,
      height: 50,
      index: this._active_menu,
      items: <Widget>[
        Icon(Icons.home),
        Icon(Icons.list),
        Icon(Icons.shopping_cart_outlined),
        Icon(Icons.person),
      ],
      animationDuration: Duration(milliseconds: 500),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/restaurants');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/orders');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/restaurants');
        }
      },
    );
  }
}
