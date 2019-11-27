import 'package:flutter/material.dart';
import 'package:flutter_shop/model/CategoryBigModel.dart';

class ChildCategory with ChangeNotifier {

  List<CategoryBigModel> childCategoryList = [];
  int childIndex = 0;
  String categoryId= '4';

  getChildCategory(List list, String id) {
    childIndex = 0;
    childCategoryList = list;
    notifyListeners();
    categoryId = id;
  }

  changeChildIndex(index){
    childIndex = index;
    notifyListeners();
  }
}