// ignore_for_file: non_constant_identifier_names
// docs  https://doc-zh.zego.im/article/15564

import '../util/util.dart';

class ZegoMusicResource {

  static const int deviation = 300;

  /// 是否为伴奏。
  /// 0：歌曲
  /// 1：伴奏
  final int is_accompany;

  /// 歌曲名。
  final String song_name;

  /// 歌手名
  final String singer_name;

  /// 歌曲时长，单位：毫秒
  final int duration;

  final int share_token_ttl;

  /// share_token 有效时长，默认值为 3600000 毫秒（1 小时）
  final int token_ttl;

  /// 歌曲资源数，resources 中资源个数
  final int resources_size;

  /// 歌曲资源信息
  final List<Resource> resources;

  int requestTime = 0;


  /// 资源是否过期
  bool get isExpire {
    if (resources.isEmpty) return true;

    return (DateTime.now().millisecondsSinceEpoch - requestTime) > (resources[0].resource_ttl - deviation) * 1000;
  }

  ZegoMusicResource(
    this.is_accompany,
    this.song_name,
    this.singer_name,
    this.duration,
    this.share_token_ttl,
    this.token_ttl,
    this.resources_size,
    this.resources,
  );

  factory ZegoMusicResource.fromJson(Map<String, dynamic> json) => ZegoMusicResource(
        Util.parseInt(json['is_accompany']),
        Util.parseStr(json['song_name']),
        Util.parseStr(json['singer_name']),
        Util.parseInt(json['duration']),
        Util.parseInt(json['share_token_ttl']),
        Util.parseInt(json['token_ttl']),
        Util.parseInt(json['resources_size']),
        Util.parseList(json['resources'], (e) => Resource.fromJson(Map<String, dynamic>.from(e))),
      );
}

class Resource {
  /// 歌曲资源 ID
  final String resource_id;

  /// 歌曲资源大小，单位：字节
  final int size;

  ///歌曲音质。
  /// normal：标准，支持该音质资源的版权方 vendorID 取值为 0（默认）、1、2、4。
  /// hq：高清，支持该音质资源的版权方 vendorID 取值为 0（默认）、1、2。
  /// sq：无损，支持该音质资源的版权方 vendorID 取值为 0（默认）、1。
  final String quality;

  /// 旧版参数
  final String share_token;

  /// 该资源的剩余有效时长，单位：毫秒
  final int resource_ttl;

  Resource(this.resource_id, this.size, this.quality, this.share_token, this.resource_ttl);

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        Util.parseStr(json['resource_id']),
        Util.parseInt(json['size']),
        Util.parseStr(json['quality']),
        Util.parseStr(json['share_token']),
        Util.parseInt(json['resource_ttl']),
      );
}
