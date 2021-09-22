import 'package:flutter/material.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import './widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/botton_navigator.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  List<Category> _categories = [
    Category(name: 'Salgados', description: 'fdafafa', identify: 'fadfafa'),
    Category(name: 'Refree', description: 'fasfsff', identify: 'afaafa'),
    Category(name: 'Tortas', description: 'fdsfes', identify: 'fadffdsfsfafa'),
    Category(name: 'Bolos', description: 'careafac', identify: 'fsfsfw'),
    Category(name: 'Sucos', description: 'cafqfda', identify: 'fsfsfsfs'),
  ];
  List<Food> _foods = [
    Food(
        title: 'Pizza Calabresa',
        description: 'massa de pizza, presunto, mussarela e calabresa',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '56.50',
        identify: 'jfkadsopajfpa'),
    Food(
        title: 'Pizza Marguerita',
        description: 'massa de pizza, presunto, mussarela e manjericão',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '59.50',
        identify: 'fafdaca'),
    Food(
        title: 'Pizza Portuguesa',
        description: 'massa de pizza, presunto, mussarela e cebola',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '60.50',
        identify: 'qeqrfafqf'),
    Food(
        title: 'Porção de batata',
        description: 'massa de pizza, presunto, mussarela e calabresa',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '50.50',
        identify: 'cadftag'),
    Food(
        title: 'Porção de batata',
        description: 'massa de pizza, presunto, mussarela e calabresa',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '50.50',
        identify: 'cadftag'),
    Food(
        title: 'Porção de batata',
        description: 'massa de pizza, presunto, mussarela e calabresa',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '50.50',
        identify: 'cadftag'),
    Food(
        title: 'Porção de batata',
        description: 'massa de pizza, presunto, mussarela e calabresa',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
        price: '50.50',
        identify: 'cadftag'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opções'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: BottonNavigatorCurved(
          1), // Barra de menú do botton widgets personalizados
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[Categories(_categories), _buildFoods()],
    );
  }

  Widget _buildFoods() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: (MediaQuery.of(context).size.height - 200),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _foods.length,
          itemBuilder: (conext, index) {
            final Food food = _foods[index];
            return FoodCard(
              identify: food.identify,
              description: food.description,
              image: food.image,
              price: food.price,
              title: food.title,
            );
          }),
    );
  }
}
