// https://javiercbk.github.io/json_to_dart/
/*
{
    "code": 0,
    "msg": "success",
    "data": {
        "banner": [
            {
                "url": "bili://deeplink/video/123",
                "name": "今天实现线上美食自由",
                "poster": "https://i0.hdslb.com/bfs/archive/ae15a0898874f4846644d78194c29bd9ffe5aa05.jpg@480w_270h"
            },
            {
                "url": "bili://deeplink/video/123",
                "name": "还想谈个恋爱",
                "poster": "https://i0.hdslb.com/bfs/archive/6c0369464f059524a7403524ee889cab59a22c33.jpg@480w_270h"
            }
        ],
        "video": [
            {
                "type": "normal",
                "id": "123",
                "poster": "http://i1.hdslb.com/bfs/archive/a09a9c1bb3f75a3b520fb4a9cb4ee6c89ffef928.jpg@480w_270h_1c",
                "watchNumer": 3295040,
                "danmuNumer": 6390
            },
            {
                "type": "normal",
                "id": "123",
                "poster": "http://i1.hdslb.com/bfs/archive/a09a9c1bb3f75a3b520fb4a9cb4ee6c89ffef928.jpg@480w_270h_1c",
                "watchNumer": 3295040,
                "danmuNumer": 6390
            },
            {
                "type": "normal",
                "id": "123",
                "poster": "http://i1.hdslb.com/bfs/archive/a09a9c1bb3f75a3b520fb4a9cb4ee6c89ffef928.jpg@480w_270h_1c",
                "watchNumer": 3295040,
                "danmuNumer": 6390
            }
        ]
    }
}
 */
class HomeAPI {
  int code;
  String msg;
  Data data;

  HomeAPI({this.code, this.msg, this.data});

  HomeAPI.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Banner> banner;
  List<Video> video;

  Data({this.banner, this.video});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = new List<Banner>();
      json['banner'].forEach((v) {
        banner.add(new Banner.fromJson(v));
      });
    }
    if (json['video'] != null) {
      video = new List<Video>();
      json['video'].forEach((v) {
        video.add(new Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.video != null) {
      data['video'] = this.video.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String url;
  String name;
  String poster;

  Banner({this.url, this.name, this.poster});

  Banner.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    poster = json['poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['poster'] = this.poster;
    return data;
  }
}

class Video {
  String type;
  String id;
  String poster;
  int watchNumer;
  int danmuNumer;

  Video({this.type, this.id, this.poster, this.watchNumer, this.danmuNumer});

  Video.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    poster = json['poster'];
    watchNumer = json['watchNumer'];
    danmuNumer = json['danmuNumer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['poster'] = this.poster;
    data['watchNumer'] = this.watchNumer;
    data['danmuNumer'] = this.danmuNumer;
    return data;
  }
}
