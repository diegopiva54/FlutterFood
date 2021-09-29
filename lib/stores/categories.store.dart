import 'package:mobx/mobx.dart';

import '../data/network/repositories/category_repository.dart';
import '../models/Category.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoryRepository repository = new CategoryRepository();

  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  @observable
  List<String> filters = [];

  @observable
  bool filterChanged = false;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void addCategory(Category category) {
    categories.add(category);
  }

  @action
  void removeCategory(Category category) {
    categories.remove(category);
  }

  @action
  void clearCategories() {
    categories.clear();
  }

  @action
  void addFilter(String identify) {
    filters.add(identify);

    categories = categories;
    filterChanged = !filterChanged;
  }

  @action
  void removeFilter(String identify) {
    filters.remove(identify);

    categories = categories;
    filterChanged = !filterChanged;
  }

  @action
  bool inFilter(String identify) {
    // print(identify);
    return filters.contains(identify);
  }

  @action
  void clearFilters() {
    filters.clear();

    categories = categories;
    filterChanged = !filterChanged;
  }

  @action
  Future getCategories(String tokenCompany) async {
    setLoading(true);

    this.clearCategories();
    this.clearFilters();

    final response = await repository.getCategories(tokenCompany);

    response
        .map((categoryJson) => addCategory(Category.fromJson(categoryJson)))
        .toList();

    setLoading(false);
  }
}
