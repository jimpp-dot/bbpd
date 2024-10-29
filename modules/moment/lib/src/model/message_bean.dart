import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../k.dart';
import '../../moment.dart';

part 'message_bean.g.dart';

@JsonSerializable()
class MessagePage {
  final List<MessageBean> msgs;
  final int next;

  @JsonKey(name: "have_forbidden")
  final bool showForbidTips;

  MessagePage(this.msgs, this.next, this.showForbidTips);

  factory MessagePage.fromJson(Map<String, dynamic> json) =>
      _$MessagePageFromJson(json);

  Map<String, dynamic> toJson() => _$MessagePageToJson(this);
}

@JsonSerializable()
class MessageBean {
  final int id; // 消息ID
  final int uid; // 用户id
  final String? name;

  @JsonKey(name: 'mkname')
  final String? markName;

  final String? icon;

  // 消息类型。string（'like', 'comment', 'atuser'）
  final String? type;

  @JsonKey(name: 'cmtid', fromJson: Util.parseInt)
  final int commentId; // 评论ID。int

  @JsonKey(name: 'cmt')
  final String? commentContent; // 评论内容

  @JsonKey(name: 'is_barrage', fromJson: Util.parseInt)
  final int isBarrageComment; //1:弹幕评论（用户点击这条消息会跳转到作品详情页，并指定对应的评论ID） 其他:普通评论

  @JsonKey(name: 'voice_cmt_url')
  final String? voiceCommentUrl; // 声音评论的音频url

  @JsonKey(name: 'tpid', fromJson: Util.parseInt)
  final int topicId; // 动态ID。int

  @JsonKey(name: 'tuid')
  final int topicUid; // 动态发布者的uid

  @JsonKey(name: 'tpcont')
  final String? topicContent; // 动态内容。string

  @JsonKey(name: 'tptype', unknownEnumValue: MomentType.text)
  final MomentType? topicType; // 动态附件类型，可为空。（picture，video，audio）string

  @JsonKey(name: 'is_work', fromJson: Util.parseInt)
  //1:动态是否是作品类型的（用户点击这条消息会跳转到作品详情页） 其他：普通动态
  //老版本app不支持展示topicType=work，而且服务端暂不支持根据app版本下发topicType， 因此先增加个字段
  final int isWork;

  @JsonKey(name: 'tpattach')
  final String? topicAttach; // 封面图）string

  final int duration;

  final int time;

  final int replied; // 1表示当前用户回复了本人 , 0表示普通的评论

  final String? tips; // 陪伴榜消息

  MessageBean(
    this.commentId,
    this.commentContent,
    this.isBarrageComment,
    this.voiceCommentUrl,
    this.topicId,
    this.topicUid,
    this.topicContent,
    this.topicType,
    this.isWork,
    this.topicAttach,
    this.id,
    this.uid,
    this.icon,
    this.name,
    this.type,
    this.time,
    this.duration,
    this.markName,
    this.replied,
    this.tips,
  );

  factory MessageBean.fromJson(Map<String, dynamic> json) =>
      _$MessageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MessageBeanToJson(this);

  String get userIcon {
    String url = icon ?? '';
    if (!url.startsWith(RegExp(r'http(s?)://'))) {
      url = System.imageDomain + url;
    }
    return '$url!head150';
  }

  String get getCover {
    if (topicType == MomentType.picture ||
        topicType == MomentType.video ||
        topicType == MomentType.work) {
      String url = topicAttach ?? '';
      if (!url.startsWith(RegExp(r'http(s?)://'))) {
        url = System.imageDomain + url;
      }
      return url;
    }
    return '';
  }

  String get publishTime {
    return time == 0 ? K.early_ago : Utility.getDateDiff(time);
  }

  MessageType get getMessageType {
    if (type == 'like' || type == 'interact_circle_like') {
      return MessageType.Liked;
    } else if (type == 'interact_circle_comment_like') {
      return MessageType.CommentLiked;
    } else if (type == 'comment' || type == 'interact_circle_comment') {
      return MessageType.Comment;
    } else if (type == 'atuser' || type == 'interact_circle_at_user') {
      return MessageType.AtUser;
    } else if (type == 'interact_accompany_enter_rank') {
      return MessageType.EnterAccompany;
    } else if (type == 'interact_accompany_reach_level') {
      return MessageType.UpdateAccompany;
    } else {
      return MessageType.Other;
    }
  }

  String get displayName {
    if (markName != null && markName!.isNotEmpty) {
      return markName!;
    } else {
      return name ?? '';
    }
  }

  String get durationText {
    return '${Utility.formatAudioTime(duration)}"';
  }

  String get displayText {
    switch (getMessageType) {
      case MessageType.Liked:
        return K.moment_like_you;
      case MessageType.CommentLiked:
        return K.moment_comment_liked;
      case MessageType.Comment:
        if (replied == 1) {
          return K.moment_comment_you;
        }
        return K.moment_comment;
      case MessageType.AtUser:
        return K.moment_at_you;
      case MessageType.Other:
      default:
        return '';
    }
  }
}

enum MessageType {
  Liked, // 动态点赞
  CommentLiked, // 评论点赞
  Comment,
  AtUser,
  EnterAccompany,

  /// 进入陪伴榜
  UpdateAccompany,

  /// 陪伴榜亲密度提升
  Other,
}
