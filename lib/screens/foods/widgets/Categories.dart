import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../models/Category.dart';
import '../../../stores/categories.store.dart';

class Categories extends StatelessWidget {
  List<Category> _categories;
  CategoriesStore storeCategories;

  Categories(this._categories);

  @override
  Widget build(BuildContext context) {
    storeCategories = Provider.of<CategoriesStore>(context);
    return _buildCategories();
  }

  Widget _buildCategories() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final Category category = _categories[index];
          return _buildCategory(category);
        },
      ),
    );
  }

  Widget _buildCategory(Category category) {
    final String identifyCategory = category.identify;
    final bool inFilter = storeCategories.inFilter(identifyCategory);

    return GestureDetector(
      onTap: () {
        inFilter
            ? storeCategories.removeFilter(identifyCategory)
            : storeCategories.addFilter(identifyCategory);
      },
      child: Container(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: inFilter ? Colors.orange[300] : Colors.white,
            border: Border.all(color: inFilter ? Colors.white : Colors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
                color: inFilter ? Colors.grey[800] : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
