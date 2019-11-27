import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_method.dart';
import 'dart:convert';

import 'package:flutter_shop/model/details.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  bool isLeft = true;
  bool isRight = false;

  changeLeftAndRight(String changeState){
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  getGoodsInfo(String id) async{
    var formData = {'goodId': id};

   await request('getGoodDetailById', formData: formData).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();

    });
  }
}