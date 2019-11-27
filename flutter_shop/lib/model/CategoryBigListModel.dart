import 'package:flutter_shop/model/CategoryBigModel.dart';


class CategoryBigListModel {

  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);
  factory CategoryBigListModel.formJson(List json){
    return CategoryBigListModel(
      json.map((i)=>CategoryBigModel.fromJson((i))).toList()
    );
  }
  
}