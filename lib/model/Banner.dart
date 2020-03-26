/**
 *   /*先将字符串转成json*/
    Map<String, dynamic> json = jsonDecode(jsonData);
    /*将Json转成实体类*/
    NewsBean newsBean=NewsBean.fromJson(news);
    /*取值*/
    String sats = newsBean.result.stat;
 */

class Banner {
  List<Banners> banners;
  int code;

  Banner({this.banners, this.code});

  Banner.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Banners {
  String pic;
  int targetId;
  String typeTitle;
  String url;

  Banners(
      {this.pic,
      this.targetId,
      this.typeTitle,
      this.url,
   });

  Banners.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    targetId = json['targetId'];
    typeTitle = json['typeTitle'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['targetId'] = this.targetId;
    data['typeTitle'] = this.typeTitle;
    data['url'] = this.url;
    return data;
  }
}
