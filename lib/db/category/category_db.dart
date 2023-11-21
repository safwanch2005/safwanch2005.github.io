// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_test/models/category/category_model.dart';

const categoryDBName = 'category-database';

class CategoryDB {
  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListListner =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListListner =
      ValueNotifier([]);

  insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await _categoryDB.put(value.id, value);
    refreshUI();
  }

  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    return _categoryDB.values.toList();
  }

  refreshUI() async {
    final _allCategories = await getCategories();
    incomeCategoryListListner.value.clear();
    expenseCategoryListListner.value.clear();
    await Future.forEach(_allCategories, (CategoryModel category) {
      category.type == CategoryType.income
          ? incomeCategoryListListner.value.add(category)
          : expenseCategoryListListner.value.add(category);
    });

    incomeCategoryListListner.notifyListeners();
    expenseCategoryListListner.notifyListeners();
  }

  deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await _categoryDB.delete(categoryID);
    refreshUI();
  }

  Future<void> clearAllCategory() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await _categoryDB.clear(); // This will remove all entries from the box
    refreshUI();
  }
}
