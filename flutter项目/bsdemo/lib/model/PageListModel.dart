class PageListModel {
  List<PageList> data;
  String errorMsg;
  Page page;
  int resultCode;

  PageListModel({this.data, this.errorMsg, this.page, this.resultCode});

  PageListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<PageList>();
      json['data'].forEach((v) {
        data.add(new PageList.fromJson(v));
      });
    }
    errorMsg = json['errorMsg'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    resultCode = json['resultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['errorMsg'] = this.errorMsg;
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    data['resultCode'] = this.resultCode;
    return data;
  }
}

class PageList {
  int appUserId;
  int createdTime;
  int detailCount;
  int hot;
  int id;
  String imgUrl;
  String keyword;
  int lastTime;
  String name;
  String remark;
  bool run;
  String scoreImgUrl;

  PageList(
      {this.appUserId,
      this.createdTime,
      this.detailCount,
      this.hot,
      this.id,
      this.imgUrl,
      this.keyword,
      this.lastTime,
      this.name,
      this.remark,
      this.run,
      this.scoreImgUrl});

  PageList.fromJson(Map<String, dynamic> json) {
    appUserId = json['appUserId'];
    createdTime = json['createdTime'];
    detailCount = json['detailCount'];
    hot = json['hot'];
    id = json['id'];
    imgUrl = json['imgUrl'];
    keyword = json['keyword'];
    lastTime = json['lastTime'];
    name = json['name'];
    remark = json['remark'];
    run = json['run'];
    scoreImgUrl = json['scoreImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appUserId'] = this.appUserId;
    data['createdTime'] = this.createdTime;
    data['detailCount'] = this.detailCount;
    data['hot'] = this.hot;
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['keyword'] = this.keyword;
    data['lastTime'] = this.lastTime;
    data['name'] = this.name;
    data['remark'] = this.remark;
    data['run'] = this.run;
    data['scoreImgUrl'] = this.scoreImgUrl;
    return data;
  }
}

class Page {
  int current;
  int pages;
  int size;
  int total;

  Page({this.current, this.pages, this.size, this.total});

  Page.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    pages = json['pages'];
    size = json['size'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['pages'] = this.pages;
    data['size'] = this.size;
    data['total'] = this.total;
    return data;
  }
}