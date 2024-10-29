import 'dart:convert';

import 'package:shared/shared.dart';

class Photo {
  String? image;
  String? type;
  String? path;
  int typeIndex = 0; // 用于排序，视频为1，图片为0

  Photo.fromParams(this.image, this.type, this.path, this.typeIndex);

  Photo.fromJson(jsonRes) {
    image = Util.parseStr(jsonRes['image']);
    type = Util.parseStr(jsonRes['type']);
    path = Util.parseStr(jsonRes['path']);
    if ('video' == type) {
      typeIndex = 1;
    }
  }

  @override
  String toString() {
    return '{"image": ${image != null ? json.encode(image) : 'null'},"type": ${type != null ? json.encode(type) : 'null'},"path": ${path != null ? json.encode(path) : 'null'}, typeIndex: $typeIndex}';
  }
}
