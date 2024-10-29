import 'package:shared/shared.dart';

class VideoInfo {
  final String? vid;
  final String? uid;
  final String? path;
  final String? cover;
  final String? duration;
  final String? width;
  final String? height;
  final String? dateline;
  final String? uuid;
  final String? deleted;
  final String? view_num;
  final String? recommend;
  final String? is_verify;
  final String? name;
  final String? icon;
  final String? time;
  final String? position;
  final String? key;

  //// 以下字段数据上报用
  final String? page;
  final String? flowType;
  final String? tag;
  final int? momentUid;
  final int? topicId;
  bool? fromFile;

  ////

  VideoInfo({
    this.vid,
    this.uid,
    this.path,
    this.cover,
    this.duration,
    this.width,
    this.height,
    this.dateline,
    this.uuid,
    this.deleted,
    this.view_num,
    this.recommend,
    this.is_verify,
    this.name,
    this.icon,
    this.time,
    this.position,
    this.key,
    this.page,
    this.flowType,
    this.tag,
    this.momentUid,
    this.topicId,
    this.fromFile = false,
  });

  factory VideoInfo.fromJson(Map<String, dynamic> json) {
    return VideoInfo(
      vid: json["vid"],
      uid: json["uid"],
      path: json["path"],
      cover: json["cover"],
      duration: json["duration"],
      width: json["width"],
      height: json["height"],
      dateline: json["dateline"],
      uuid: json["uuid"],
      deleted: json["deleted"],
      view_num: json["view_num"],
      recommend: json["recommend"],
      is_verify: json["is_verify"],
      name: json["name"],
      icon: json["icon"],
      time: json["time"],
      position: json["position"],
      key: json["_key"],
      fromFile: false,
    );
  }

  String? get videoCover {
    String? url = cover;
    if (url == null || url.isEmpty) {
      return null;
    }

    if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
      url = System.imageDomain + url;
    }

    if (!url.contains(RegExp(r'!cover(\d+)'))) {
      url = '$url!cover375';
    }

    return url;
  }

  String? get videoPath {
    String? url = path;
    if (url == null || url.isEmpty) {
      return null;
    }

    if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
      url = System.imageDomain + url;
    }

    return url;
  }
}
