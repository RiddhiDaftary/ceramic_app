import 'package:flutter/material.dart';

import 'category.dart';

class CategoryData extends ChangeNotifier{
  List<Category> _categoryList = List();

  addCategory(Category category){
    _categoryList.add(category);
    notifyListeners();
  }

  List<Category> get categoryList{
    return _categoryList;
  }

  set categoryList(List<Category> categoryList){
    _categoryList = categoryList;
    notifyListeners();
  }

  int get numberOfCategory{
    return _categoryList.length;
  }
}