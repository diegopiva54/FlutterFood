import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/show_image_cached_network.dart';
import '../models/Food.dart';
import '../stores/foods.store.dart';

class FoodCard extends StatelessWidget {
  bool NotShowIconCart;
  Food food;
  //FoodsStore storeFoods = new FoodsStore();

  FoodCard({
    this.NotShowIconCart = false,
    this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[100]),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                _buildImageFood(),
                VerticalDivider(color: Colors.black26),
                _buildInfoFood(),
                _buildButtonCart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(right: 5),
      child: ShowImageCachedNetwork(
          //food.image
          'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png'),
    );
  }

  Widget _buildInfoFood() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${this.food.name}',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 2,
          ),
          Text('${this.food.description}',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          Container(
            height: 8,
          ),
          Text("R\$ ${this.food.price.toStringAsFixed(2)}",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildButtonCart(context) {
    final storeFoods = Provider.of<FoodsStore>(context);

    return NotShowIconCart
        ? Container()
        : Container(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: storeFoods.inFoodCart(food)
                  ? GestureDetector(
                      onTap: () {
                        storeFoods.removeFoodCart(food);
                      },
                      child: Icon(
                        Icons.remove_shopping_cart_outlined,
                        color: Colors.red,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        storeFoods.addFoodCart(food);
                      },
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
            ),
          );
  }
}
