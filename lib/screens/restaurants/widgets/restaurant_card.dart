import 'package:flutter/material.dart';
import 'package:flutter_food/constants/api.dart';

import '../../../widgets/show_image_cached_network.dart';
import '../../../models/Restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(restaurant.image);
        Navigator.pushNamed(context, '/foods', arguments: restaurant);
      },
      child: Container(
        padding: EdgeInsets.only(top: 4, right: 1, left: 1),
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    // child: Image.asset('assets/images/IconeFlutterFood.png'),
                    child: this.restaurant.image != ''
                        ? ShowImageCachedNetwork(this.restaurant.image)
                        : Image.asset('assets/images/icon.png'),
                  ),
                  VerticalDivider(color: Colors.black26),
                  Expanded(
                      child: Text(
                    this.restaurant.name,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
