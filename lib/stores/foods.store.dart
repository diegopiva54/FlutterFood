import '../data/network/repositories/food_repository.dart';
import 'package:mobx/mobx.dart';
import '../models/Food.dart';

part 'foods.store.g.dart';

class FoodsStore = _FoodsStoreBase with _$FoodsStore;

abstract class _FoodsStoreBase with Store {
  FoodRepository _repository;

  _FoodsStoreBase() {
    _repository = new FoodRepository();
  }

  @observable
  ObservableList<Food> foods = ObservableList<Food>();

  @observable
  // ObservableList<Food> cartItems = ObservableList<Food>();
  List<Map<String, dynamic>> cartItems = [];

  @observable
  double totalCart = 0;

  @observable
  bool isLoading = false;

  ///
  ///SEMPRE QUE ALTERAR DEVE RODAR NO TERMINAL UM NOVO BUILD PARA GERAR UM NOVO ARQUIVO
  ///
  ///EX: "flutter packages pub run build_runner watch"
  ///
  ///

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void addFood(Food food) {
    foods.add(food);
  }

  @action
  void addAll(List<Food> foods) {
    foods.addAll(foods);
  }

  @action
  void removeFood(Food food) {
    foods.remove(food);
  }

  @action
  void clearFoods() {
    foods.clear();
  }

  @action
  Future getFoodsFromApi(String tokenCompany, {List<String> categories}) async {
    clearFoods();
    clearCart();

    setLoading(true);

    final response =
        await _repository.getFoods(tokenCompany, filterCategories: categories);

    // print(response);
    setLoading(false);

    response.map((food) => addFood(Food.fromJson(food))).toList();
  }

  ///
  ///Cart
  ///

  @action
  void addFoodCart(Food food) {
    // print('addFoodCart');

    if (inFoodCart(food)) {
      incrementFoodCart(food);
    }

    cartItems.add({
      'identify': food.identify,
      'qty': 1,
      'product': food,
    });

    calcTotalCart();
  }

  @action
  void removeFoodCart(Food food) {
    // print('removeFoodCart');

    cartItems.removeWhere((value) => value['identify'] == food.identify);

    calcTotalCart();
  }

  @action
  void clearCart() {
    // print('clearCart');
    cartItems.clear();

    calcTotalCart();
  }

  @action
  void incrementFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((value) => value['identify'] == food.identify);

    cartItems[index]['qty'] = cartItems[index]['qty'] + 1;

    calcTotalCart();
  }

  @action
  void decrementFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((value) => value['identify'] == food.identify);

    cartItems[index]['qty'] = cartItems[index]['qty'] - 1;

    if (cartItems[index]['qty'] == 0) {
      return removeFoodCart(food);
    }
    calcTotalCart();
  }

  @action
  bool inFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((value) => value['identify'] == food.identify);

    return index != -1;
  }

  @action
  double calcTotalCart() {
    // print('calcTotalCart');
    double total = 0;

    cartItems
        .map((value) => total += value['qty'] * value['product'].price)
        .toList();

    // print(total);
    totalCart = total;

    foods = foods;

    cartItems = cartItems;

    return total;
  }
}
