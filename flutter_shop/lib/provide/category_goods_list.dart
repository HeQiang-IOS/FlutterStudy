import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/categoryGoodsList.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];

  getGoodsList(List<CategoryListData> list){
    goodsList = list;
    notifyListeners();
  }
}