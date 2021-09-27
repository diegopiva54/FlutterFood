import 'package:mobx/mobx.dart';

import '../models/Restaurant.dart';

part 'rastaurant.store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;

abstract class _RestaurantStoreBase with Store {
  @observable
  Restaurant restaurant;

  @action
  void setRestaurant(Restaurant value) => restaurant = value;
}
