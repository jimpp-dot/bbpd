import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:math';
import 'package:shared/k.dart';

part 'comment_bean.g.dart';

// 朋友圈评论折叠数量
const int MAX_COMMENT_FOLD_NUM = 2;
const int EXPAND_TEXT_LINE = 8;

/// 评论
@JsonSerializable()
class Comment {
  @JsonKey(name: 'topic_id')
  int? topicId; // feed 流需要

  @JsonKey(name: 'cmtid')
  final int? commentId; // 评论id
  final int? uid;
  String? icon;
  String? name;
  @JsonKey(name: 'mkname')
  String? markName;
  String? content;

  @JsonKey(name: 'to_uid')
  int? toUid;
  @JsonKey(name: 'to_name')
  String? toName;
  @JsonKey(name: 'to_mkname')
  String? toMarkName;
  @JsonKey(name: 'fc_state') //0:非首评；1：首评
  int fcState;
  @JsonKey(name: 'like_num') //点赞数
  int likeNum;
  @JsonKey(name: 'is_like') //是否已点赞
  bool isLike;

  final int? time;

  // status为success表示已审核，pending表示审核中
  final String? status;
  final bool isInAudit;

  Comment({
    this.topicId,
    this.uid,
    this.icon,
    this.name,
    this.markName,
    this.content,
    this.toUid,
    this.toName,
    this.toMarkName,
    this.time,
    this.commentId,
    this.status,
    this.isInAudit = false,
    this.fcState = 0,
    this.likeNum = 0,
    this.isLike = false,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  ///点赞 or 取消点赞
  void changeLikeState() {
    if (isLike) {
      likeNum = max(likeNum - 1, 0);
    } else {
      likeNum++;
    }
    isLike = !isLike;
  }

  String get userIcon {
    String url = Util.imageFullUrl(icon ?? '');
    if (!url.contains(RegExp(r'!head(\d+)')) &&
        !url.contains('x-oss-process=image/resize')) {
      url = '$url!head150';
    }

    return url;
  }

  String get publishTime {
    return time == null ? K.early_ago : Utility.getDateDiff(time!);
  }

  // 评论的人 备注名
  String get displayName {
    if (markName != null && markName!.isNotEmpty) {
      return markName!;
    } else {
      if (name == null || name!.isEmpty) {
        return K.moment_no_name;
      }
      return name ?? '';
    }
  }

  // 评论回复的人 备注名
  String? get displayToName {
    if (toMarkName != null && toMarkName!.isNotEmpty) {
      return toMarkName!;
    } else {
      if (toName == null || toName!.isEmpty) {
        return K.moment_no_name;
      }
      return toName;
    }
  }
}
