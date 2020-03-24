class HomeModel {
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

  HomeModel(
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
      this.scoreImgUrl
      });

  HomeModel.fromJson(Map<String, dynamic> json) {
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