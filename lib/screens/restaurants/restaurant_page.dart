import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/restaurant_card.dart';
import '../../models/Restaurant.dart';
import '../../widgets/botton_navigator.dart';
import '../../data/network/dio_client.dart';
import '../../data/network/repositories/restaurant_repository.dart';

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
    getRestaurants();
  }

  List<Restaurant> _restaurants = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body:
          isLoading ? CircularProgressIndicator() : _buildRestaurants(context),
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

  void getRestaurants() async {
    setState(() => isLoading = true);

    final restaurants = await RestaurantRepository().getRestaurants();

    setState(() {
      _restaurants.addAll(restaurants);
      isLoading = false;
    });
  }
}
