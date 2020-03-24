import 'package:bsdemo/model/HomeModel.dart';

class HomeModelList {

  List<HomeModel> data;
  String errorMsg;
  int resultCode;

  HomeModelList({this.data, this.errorMsg, this.resultCode});

  HomeModelList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<HomeModel>();
      json['data'].forEach((v) {
        data.add(new HomeModel.fromJson(v));
      });
    }
    errorMsg = json['errorMsg'];
    resultCode = json['resultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['errorMsg'] = this.errorMsg;
    data['resultCode'] = this.resultCode;
    return data;
  }
  
}