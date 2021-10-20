import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import './widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/botton_navigator.dart';
import '../../stores/foods.store.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../stores/categories.store.dart';
import '../../stores/rastaurant.store.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  Restaurant _restaurant;
  //FoodsStore storeFoods = new FoodsStore();
  FoodsStore storeFoods;
  CategoriesStore storeCategories;
  RestaurantStore storeRestaurant;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    storeFoods = Provider.of<FoodsStore>(context);
    storeCategories = Provider.of<CategoriesStore>(context);
    storeRestaurant = Provider.of<RestaurantStore>(context);

    RouteSettings settings = ModalRoute.of(context).settings;
    _restaurant = settings.arguments;

    disposer =
        reaction((_) => storeCategories.filterChanged, (filterChanged) async {
      if (!storeCategories.isLoading && !storeFoods.isLoading) {
        await storeFoods.getFoodsFromApi(_restaurant.identify,
            categories: storeCategories.filters);
        // print('filtros alterados');
      }
    });

    storeRestaurant.setRestaurant(_restaurant);
    storeCategories.getCategories(_restaurant.identify);
    storeFoods.getFoodsFromApi(_restaurant.identify);
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('${_restaurant.name}'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: BottonNavigatorCurved(
          0), // Barra de menú do botton widgets personalizados
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[
        Observer(builder: (context) {
          return storeCategories.isLoading
              ? CustomCircularProgressIndicator(
                  textLabel: 'Carregando categorias...')
              : Categories(storeCategories.categories);
        }),
        Observer(builder: (context) {
          return storeFoods.isLoading
              ? CustomCircularProgressIndicator(textLabel: 'Carregando...')
              : storeFoods.foods.length == 0
                  ? Center(
                      child: Text(
                        'Nenhum Produto',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : _buildFoods();
        }),
      ],
    );
  }

  Widget _buildFoods() {
    return Container(
        margin: EdgeInsets.only(top: 5),
        height: (MediaQuery.of(context).size.height - 200),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: storeFoods.foods.length,
            itemBuilder: (context, index) {
              final Food food = storeFoods.foods[index];

              return FoodCard(food: food);
            }));
  }
}
