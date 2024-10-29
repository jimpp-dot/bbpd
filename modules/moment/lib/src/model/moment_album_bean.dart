import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moment_album_bean.g.dart';

/// 动态相册个人信息response
@JsonSerializable()
class AlbumData {
  final AlbumUserInfo? info;

  AlbumData(this.info);

  factory AlbumData.fromJson(Map<String, dynamic> json) =>
      _$AlbumDataFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDataToJson(this);
}

@JsonSerializable()
class AlbumUserInfo {
  final String? icon;
  final String? name;

  @JsonKey(name: 'is_online', defaultValue: 0)
  final int isOnline;
  final int sex;
  final int uid;
  final int age;
  final int tpnum;
  final int in_room;
  int isfollow = 0;

  AlbumUserInfo(
    this.icon,
    this.name,
    this.isOnline,
    this.sex,
    this.uid,
    this.age,
    this.tpnum,
    this.in_room,
    this.isfollow,
  );

  factory AlbumUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AlbumUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumUserInfoToJson(this);

  bool get isUserOnline {
    return isOnline == 1;
  }
}

/// 动态相册response
@JsonSerializable()
class AlbumPageResp extends BaseResponse implements MomentAlbumOutput {
  final AlbumPage? data;

  AlbumPageResp({super.success, super.msg, this.data});

  factory AlbumPageResp.fromJson(Map<String, dynamic> json) =>
      _$AlbumPageRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AlbumPageRespToJson(this);

  @override
  List<IMomentAlbum> get momentAlbumList => data?.output ?? [];

  @override
  int get momentCount => data?.total ?? 0;
}

@JsonSerializable()
class AlbumPage {
  final int tpid; // 翻页参数，0表示到底了
  @JsonKey(fromJson: Util.parseInt)
  final int total; //动态数量
  final List<MomentAlbumBean> output;

  AlbumPage(this.tpid, this.output, this.total);

  factory AlbumPage.fromJson(Map<String, dynamic> json) =>
      _$AlbumPageFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumPageToJson(this);
}

@JsonSerializable()
class MomentAlbumBean extends IMomentAlbum {
  final int tpid;
  final int total;
  final int pos;

  MomentAlbumBean(this.tpid, this.total, this.pos, String url) {
    super.url = url;
  }

  factory MomentAlbumBean.fromJson(Map<String, dynamic> json) =>
      _$MomentAlbumBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MomentAlbumBeanToJson(this);

  String get cover375 {
    String result = url ?? '';

    if (!result.startsWith(RegExp(r'http(s?)://'))) {
      result = System.imageDomain + result;
    }

    // 分割宽高
    List<String> strs = result.split('?');
    if (strs.length == 2) {
      result = strs[0];
    }

    return '$result!cover375';
  }
}
