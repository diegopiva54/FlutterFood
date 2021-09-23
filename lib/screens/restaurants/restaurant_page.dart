import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/restaurant_card.dart';
import '../../models/Restaurant.dart';
import '../../widgets/botton_navigator.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  List<Restaurant> _restaurants = [
    new Restaurant(
        name: 'Carneiro no Ponto',
        contact: 'carneiro@teste.com',
        image: '',
        uuid: 'fafdafaadfa'),
    new Restaurant(
        name: 'Carneiro no Ponto 2',
        contact: 'carneiro2@teste.com',
        image: '',
        uuid: 'adfqfadfqsd'),
    new Restaurant(
        name: 'Carneiro no Ponto 3',
        contact: 'carneiro3@teste.com',
        image: '',
        uuid: 'fqfasrqcaafa'),
    new Restaurant(
        name: 'Carneiro no Ponto 3',
        contact: 'carneiro3@teste.com',
        image: '',
        uuid: 'fqfasrqcaafa'),
    new Restaurant(
        name: 'Carneiro no Ponto 3',
        contact: 'carneiro3@teste.com',
        image: '',
        uuid: 'fqfasrqcaafa'),
    new Restaurant(
        name: 'Carneiro no Ponto 3',
        contact: 'carneiro3@teste.com',
        image: '',
        uuid: 'fqfasrqcaafa'),
    new Restaurant(
        name: 'Carneiro no Ponto 3',
        contact: 'carneiro3@teste.com',
        image: '',
        uuid: 'fqfasrqcaafa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildRestaurants(context),
      bottomNavigationBar: BottonNavigatorCurved(0),
    );
  }

  Widget _buildRestaurants(context) {
    return Container(
      child: ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final Restaurant restaurant = _restaurants[index];

          return RestaurantCard(
            uuid: restaurant.uuid,
            name: restaurant.name,
            image: restaurant.image,
            contact: restaurant.contact,
          );
        },
      ),
    );
  }
}
