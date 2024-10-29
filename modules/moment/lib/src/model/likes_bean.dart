import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../k.dart';

part 'likes_bean.g.dart';

const int MAX_SHOW_LIKE_NUM = 15;

/// 点赞列表response
@JsonSerializable()
class LikesResponse extends BaseResponse {
  final List<LikeListUser>? data;

  LikesResponse({super.success, super.msg, this.data});

  factory LikesResponse.fromJson(Map<String, dynamic> json) =>
      _$LikesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LikesResponseToJson(this);

  List<LikeListUser> get likes {
    data?.sort((left, right) {
      if (left.time == right.time) {
        return right.uid.compareTo(left.uid);
      }
      return right.time.compareTo(left.time);
    });
    return data ?? [];
  }
}

/// 点赞列表点赞用户
@JsonSerializable()
class LikeListUser {
  @JsonKey(name: 'topic_id', fromJson: Util.parseInt)
  final int topicId; // feed 流需要
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  final String? icon;
  final String? sex; // male、 female
  @JsonKey(fromJson: Util.parseInt)
  final int age;
  final String? name;

  @JsonKey(name: 'mkname')
  final String? markName;

  @JsonKey(fromJson: Util.parseInt)
  final int online;
  @JsonKey(fromJson: Util.parseInt)
  final int time;

  @JsonKey(fromJson: Util.parseInt)
  int isfollow;

  LikeListUser({
    required this.topicId,
    required this.uid,
    this.name,
    this.icon,
    this.sex,
    required this.age,
    this.markName, // 备注名
    required this.online, // 是否在线
    required this.time, // 点赞时间
    required this.isfollow,
  });

  factory LikeListUser.fromJson(Map<String, dynamic> json) =>
      _$LikeListUserFromJson(json);

  Map<String, dynamic> toJson() => _$LikeListUserToJson(this);

  String get userIcon {
    String url = Util.imageFullUrl(icon ?? '');

    if (!url.contains(RegExp(r'!head(\d+)')) &&
        !url.contains('x-oss-process=image/resize')) {
      url = '$url!head150';
    }

    return url;
  }

  String get displayName {
    if (markName != null && markName!.isNotEmpty) {
      return markName!;
    } else {
      if (name == null || name!.isEmpty) {
        return K.moment_no_name;
      }
      return name!;
    }
  }

  Sex get userSex {
    if (sex == 'male') {
      return Sex.Male;
    } else if (sex == 'female') {
      return Sex.Female;
    } else {
      return Sex.Female;
    }
  }

  int get sexInt {
    if (sex == 'male') {
      return 1;
    } else if (sex == 'female') {
      return 2;
    } else {
      return 0;
    }
  }

  String get onlineTime {
    if (online == 1) {
      return K.moment_online;
    } else {
      return time == 0 ? K.early_ago : Utility.getDateDiff(time);
    }
  }

  bool get isFollow {
    return isfollow == 1;
  }
}

///
@JsonSerializable()
class LikeBean {
  @JsonKey(name: 'topic_id')
  final int topicId; // feed 流需要
  final int uid;
  final String? icon;
  final int sex; // male、 female
  final int age;
  final String? name;

  @JsonKey(name: 'mkname')
  final String? markName;

  final int online;
  final int? time;

  LikeBean({
    required this.topicId,
    required this.uid,
    this.name,
    this.icon,
    required this.sex,
    this.age = 0,
    this.markName, // 备注名
    this.online = 0, // 是否在线
    required this.time, // 点赞时间
  });

  factory LikeBean.fromJson(Map<String, dynamic> json) =>
      _$LikeBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LikeBeanToJson(this);

  String get userIcon {
    String url = icon ?? '';
    if (!url.startsWith(RegExp(r'http(s?)://'))) {
      url = System.imageDomain + url;
    }
    return '$url!head150';
  }

  String get displayName {
    if (markName != null && markName!.isNotEmpty) {
      return markName!;
    } else {
      if (name == null || name!.isEmpty) {
        return K.moment_no_name;
      }
      return name!;
    }
  }

  String get onlineTime {
    if (online == 1) {
      return K.moment_online;
    } else {
      return (time ?? 0) == 0 ? K.early_ago : Utility.getDateDiff(time!);
    }
  }
}
