import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../stores/foods.store.dart';

class BottonNavigatorCurved extends StatelessWidget {
  int _active_menu = 0;

  // FoodsStore storeFoods = new FoodsStore();

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
        _iconCart(context),
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

  Widget _iconCart(context) {
    final storeFoods = Provider.of<FoodsStore>(context);

    return Stack(
      children: [
        Icon(Icons.shopping_cart_outlined),
        Positioned(
          right: -1,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Observer(builder: (_) {
              return Text(
                storeFoods.cartItems.length.toString(),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              );
            }),
          ),
        )
      ],
    );
  }
}
