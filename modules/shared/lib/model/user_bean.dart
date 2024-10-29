import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_bean.g.dart';

/// 用户信息
@JsonSerializable()
class UserBean {
  @JsonKey(name: 'uid')
  final int uid;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'mark_name')
  String? markName;
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'sex')
  int sex;
  @JsonKey(name: 'age')
  int age;
  @JsonKey(defaultValue: 0)
  int official;

  UserBean({
    this.uid = 0,
    this.name,
    this.markName,
    this.icon,
    this.sex = 0,
    this.age = 0,
    this.official = 0,
  });

  factory UserBean.fromJson(Map<String, dynamic> json) =>
      _$UserBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UserBeanToJson(this);

  /// DB
  Map<String, dynamic> toDBMap() => <String, dynamic>{
        'uid': uid,
        'name': name,
        'mark_name': markName,
        'icon': icon,
        'sex': sex,
        'age': age,
        'official': official
      };

  factory UserBean.fromDBJson(Map<String, dynamic> json) {
    return UserBean(
      uid: Util.parseInt(json['uid']),
      name: Util.parseStr(json['name']),
      markName: Util.parseStr(json['mark_name']),
      icon: Util.parseStr(json['icon']),
      sex: Util.parseInt(json['sex']),
      age: Util.parseInt(json['age']),
      official: Util.parseInt(json['official']),
    );
  }

  bool equal(UserBean? other) {
    if (other == null) {
      return false;
    }
    return uid == other.uid &&
        name == other.name &&
        markName == other.markName &&
        icon == other.icon &&
        sex == other.sex &&
        age == other.age &&
        official == other.official;
  }

  String? get iconUrl {
    if (icon == null || icon!.isEmpty) {
      return null;
    }
    String url = Util.imageFullUrl(icon ?? '');
    if (!url.contains(RegExp(r'!head(\d+)')) &&
        !url.contains('x-oss-process=image/resize')) {
      url = '$url!head150';
    }

    return url;
  }
}

/// 评论 or 删除评论返回
@JsonSerializable()
class UserRelationResponse extends BaseResponse {
  final RelationData? data;

  UserRelationResponse({bool? success, String? msg, this.data})
      : super(msg: msg, success: success ?? false);

  factory UserRelationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRelationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserRelationResponseToJson(this);
}

@JsonSerializable()
class RelationData {
  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'time')
  final int time;

  @JsonKey(name: 'users')
  final List<UserRelationBean> users;

  RelationData(this.status, this.time, this.users);

  factory RelationData.fromJson(Map<String, dynamic> json) =>
      _$RelationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RelationDataToJson(this);
}

@JsonSerializable()
class UserRelationBean {
  @JsonKey(name: 'u')
  final int uid;
  @JsonKey(name: 'f')
  final int isFriend; // 0 表示关注， 1表示好友

  UserRelationBean(this.uid, this.isFriend);

  factory UserRelationBean.fromJson(Map<String, dynamic> json) =>
      _$UserRelationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UserRelationBeanToJson(this);

  Relation get userRelation {
    switch (isFriend) {
      case 0:
        return Relation.Follow;
      case 1:
        return Relation.Friend;
      default:
        return Relation.None;
    }
  }
}

enum Relation {
  None,
  Friend, //建立好友关系
  Follow, //单向关注
  Delete, //解除关注关系
}
