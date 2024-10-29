import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moment/src/model/likes_bean.dart';
import 'package:moment/src/model/moment_notice_people.dart';
import 'package:moment/src/model/tag_bean.dart';

import '../../k.dart';

part 'moment_bean.g.dart';

const double Report_Start_Percent = 0.5;
const double Report_End_Percent = 0.5;

/// 动态类型
enum MomentType {
  normal,
  text,
  picture,
  video,
  audio,
  work,
}

/// 用户类型
enum UserType {
  /// 普通用户
  user,

  /// 官方
  @JsonValue('offical')
  official,

  other,
}

enum Authority {
  public,
  friend,
  private,
}

enum TagType {
  /// 话题
  topic,

  /// 约玩
  play,

  /// 婚礼
  wedding,
  broadcast,
  born,
  thevoice, //好声音
  unknown,
}

/// 动态分页
@JsonSerializable()
class MomentPage {
  // 动态总数量
  final int total;

  // 下一页的起始ID 如果为空，表示已经到底了 next为空的时候，topics可能不为空。
  final int next;
  final List<Moment> topics;

  MomentPage(this.total, this.next, this.topics);

  factory MomentPage.fromJson(Map<String, dynamic> json) =>
      _$MomentPageFromJson(json);

  Map<String, dynamic> toJson() => _$MomentPageToJson(this);
}

/// 动态
@JsonSerializable(fieldRename: FieldRename.snake)
class Moment {
  /// 动态ID
  final int topicId;
  final int uid;
  final String? name;
  int titleNew;

  @JsonKey(name: 'badge_list')
  final List<String> badgeList;

  /// 备注名
  @JsonKey(name: 'mkname')
  final String? markName;

  @JsonKey(fromJson: Util.parseIcon)
  final String? icon;

  final String? content;

  /// 用户类型
  @JsonKey(name: 'ttype', unknownEnumValue: UserType.user)
  final UserType userType;

  /// 发布动态的附件类型（picture, video, audio)
  @JsonKey(name: 'atype', unknownEnumValue: MomentType.text)
  final MomentType type;

  // 动态附加数据, 图片，video，audio取第一个
  @JsonKey(name: 'attach')
  final List<String>? images;

  int hasLike; // 是否点赞， 1为点赞

  int likeNum; // 动态点赞数。int

  int cmtNum; // 动态评论数。int

  /// 查看权限
  final Authority authority;

  // 动态发布时间（unixtime）
  @JsonKey(fromJson: Util.parseInt)
  final int time;

  List<LikeBean>? likes;
  List<Comment>? comments;

  Comment? hotComment; //热门评论

  final String? cover; // 视频动态封面图
  final int duration; // 音频时长

  final String? location;
  final String? latitude;
  final String? longitude;

  @JsonKey(name: 'tagtype', unknownEnumValue: TagType.unknown)
  final TagType? tagType;

  @JsonKey(name: 'tagstp')
  final List<NormalTag>? tagsTp;

  // 约玩动态背景
  final String? bgp;

  // 游戏卡信息
  final Card? card;

  //案件信息
  @JsonKey(name: 'tagscase')
  final TagsCase? tagsCase;

  //鉴定师tag
  @JsonKey(name: 'tagsapra')
  final AppraiserTag? appraiserTag;

  //动态广播下TagID
  final BroadcastTag? tagsBroadcast;

  //婚礼信息
  @JsonKey(name: 'tagswedding')
  final WeddingTag? tagsWedding;

  //好声音信息
  @JsonKey(name: 'tagsvoice')
  final GoodVoiceTag? tagsGoodVoice;

  //作品信息
  @JsonKey(name: 'work_info')
  final WorkInfo? workInfo;

  final int sex;

  final int age;

  @JsonKey(name: 'isfollow', fromJson: Util.parseInt)
  int isFollow; // 0 未关注，1已关注

  final bool expanded;

  // 是否曝光
  @JsonKey(defaultValue: false)
  bool isExposure;

  // 用户所在房间id
  final int rid;

  final int inRoom;

  // 房间类型提示文案
  @JsonKey(name: 'playtip')
  final String? playTip;

  final int official;

  // 房间类型提示文案icon
  @JsonKey(name: 'ricon')
  String? playIcon;

  final int isOnline;

  // 头像框
  final String? headFrame;

  // at 用户列表
  @JsonKey(name: 'atuids')
  final List<MomentNoticePeople>? atUsers;

  // 明星加V
  final bool starVerifyTag;

  //置顶
  @JsonKey(name: 'is_top_v2')
  bool isTop;

  /// 测试数据用于产品调试
  final int exposure; // 曝光次数
  final int recommend; // 是否推荐。1表示推荐，0表示非推荐
  final double topic_heat; // 动态热度
  final double sort_score; // 推荐分
  final double ctr; // CTR值
  final double decay_ratio; // 衰减系数
  final int index;

  // status为success表示已审核，pending表示审核中
  final String? status;
  final bool isInAudit;

  Moment({
    required this.topicId,
    required this.uid,
    required this.name,
    required this.titleNew,
    required this.badgeList,
    required this.markName,
    required this.type,
    required this.icon,
    required this.content,
    required this.time,
    required this.likeNum,
    required this.cmtNum,
    required this.userType,
    required this.hasLike,
    required this.likes,
    required this.comments,
    required this.hotComment,
    required this.images,
    this.expanded = false,
    required this.authority,
    this.cover,
    required this.duration,
    this.location,
    this.latitude,
    this.longitude,
    required this.tagType,
    required this.tagsTp,
    this.card,
    this.tagsCase,
    this.tagsBroadcast,
    this.tagsWedding,
    this.workInfo,
    required this.sex,
    required this.age,
    required this.isFollow,
    this.isExposure = false,
    this.bgp,
    required this.rid,
    this.playTip,
    required this.exposure,
    required this.recommend,
    required this.topic_heat,
    required this.sort_score,
    required this.ctr,
    required this.decay_ratio,
    required this.index,
    required this.official,
    required this.inRoom,
    required this.isOnline,
    this.headFrame,
    required this.atUsers,
    required this.starVerifyTag,
    required this.isTop,
    this.appraiserTag,
    this.tagsGoodVoice,
    this.status,
    this.isInAudit = false,
  });

  factory Moment.fromJson(Map<String, dynamic> json) => _$MomentFromJson(json);

  Map<String, dynamic> toJson() => _$MomentToJson(this);

  /// UI展现用户名，优先显示备注
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

  /// 用户性别
  Sex get userSex {
    if (sex == 1) {
      return Sex.Male;
    } else if (sex == 2) {
      return Sex.Female;
    } else {
      return Sex.Female;
    }
  }

  /// 视频链接
  String? get videoUrl {
    String? videoUrl;
    if (images != null && images!.isNotEmpty) {
      videoUrl = images![0];
    }
    if (videoUrl != null && !videoUrl.startsWith(RegExp(r'http(s?)://'))) {
      videoUrl = '${System.imageDomain}$videoUrl';
    }

    return videoUrl;
  }

  /// 音频链接
  String? get audioUrl {
    String? audioUrl;
    if (images != null && images!.isNotEmpty) {
      audioUrl = images![0];
      if (!audioUrl.startsWith(RegExp(r'http(s?)://'))) {
        audioUrl = '${System.imageDomain}$audioUrl';
      }
    }
    return audioUrl;
  }

  bool get isPublic {
    return authority == Authority.public;
  }

  String? get rushPublishTime {
    String? rushPublishTime;
    if (time == 0) {
      rushPublishTime = null;
    } else {
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime publishTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      Duration diffTime = now.difference(publishTime);
      Duration diffDay = today.difference(publishTime);

      if (publishTime.isAfter(today)) {
        // 当天
        if (diffTime.inMinutes < 1) {
          // 1分钟内
          rushPublishTime = K.moment_just_now;
        } else if (diffTime.inHours < 1) {
          // 1小时以内
          rushPublishTime = K.moment_minutes_ago(['${diffTime.inMinutes}']);
        } else {
          // 当前超过1小时
          rushPublishTime = K.moment_hours_ago(['${diffTime.inHours}']);
        }
      } else if (diffDay.inDays < 6) {
        // 一周内
        rushPublishTime = K.moment_days_ago(['${diffDay.inDays + 1}']);
      } else {
        // 超过1周
        // rushPublishTime = K.moment_week_ago;
        rushPublishTime = Utility.getDateDiff(time);
      }
    }
    return rushPublishTime;
  }

  /// 是否点赞
  bool get isLiked {
    for (LikeBean likeBean in likes ?? []) {
      if (likeBean.uid == Session.uid) {
        return true;
      }
    }
    return hasLike == 1;
  }

  /// 用户头像
  String? get userIcon {
    String? url = icon;
    if (url == null || url.isEmpty) {
      return null;
    }

    if (!url.startsWith(RegExp(r'http(s?)://'))) {
      url = System.imageDomain + url;
    }

    if (!url.contains(RegExp(r'!head(\d+)'))) {
      url = '$url!head100';
    }

    return url;
  }

  /// 用户头像框
  String? get userHeadFrame {
    String? url = headFrame;
    if (url == null || url.isEmpty) {
      return null;
    }

    if (!url.startsWith(RegExp(r'http(s?)://'))) {
      url = System.imageDomain + url;
    }

    return url;
  }

  /// 该用户是否在房间
  bool get isInRoom {
    return inRoom != 0;
  }

  /// 是否在线
  bool get isUserOnline {
    return isOnline == 1;
  }

  /// 点赞数量
  int get getLikesNum {
    return likeNum;
  }

  /// 图片动态封面
  List<ImageBean>? _imageBeans = [];

  /// 获取动态图片完整链接
  List<ImageBean> getMomentImages() {
    if (images == null) {
      return [];
    }

    if (_imageBeans == null || _imageBeans!.isEmpty) {
      _imageBeans = images!.where((element) => element.isNotEmpty).map((item) {
        return _getImageBean(item);
      }).toList();
    }
    return _imageBeans ?? [];
  }

  /// 视频封面
  ImageBean? _videoBean;

  ImageBean? get videoCover {
    if (cover == null || cover!.isEmpty) {
      return null;
    }

    _videoBean ??= _getImageBean(cover!);

    return _videoBean;
  }

  /// 点赞, 插入最前面
  void addLike(LikeBean bean, {bool changeNum = true, bool sort = false}) {
    likes ??= [];
    if (Session.uid == bean.uid) {
      hasLike = 1;
    }

    int index = likes!.indexWhere((item) => item.uid == bean.uid);
    if (index == -1) {
      if (changeNum) {
        likeNum++;
      }

      likes!.insert(0, bean);

      if (sort) {
        sortLikes();
      }
    }
  }

  /// 取消赞
  void deleteLike(int uid, {bool changeNum = true}) {
    if (Session.uid == uid) {
      hasLike = 0;
    }

    if (likes == null) {
      return;
    }

    int index = likes!.indexWhere((item) => item.uid == uid);
    if (index != -1) {
      likes!.removeAt(index);

      if (changeNum && likeNum > 0) {
        likeNum--;
      }
    }
  }

  /// 评论点赞or取消点赞
  void changeCommentLikeState(int commentId) {
    if (hotComment?.commentId == commentId) {
      hotComment?.changeLikeState();
    }
    comments ??= [];
    int index = comments!.indexWhere((item) => item.commentId == commentId);
    if (index != -1) {
      comments![index].changeLikeState();
    }
  }

  /// 评论,往数组最前插入
  void addComment(Comment? comment,
      {bool changeNum = true, bool sort = false}) {
    if (comment == null || comment.commentId == null) {
      return;
    }
    comments ??= [];
    int index =
        comments!.indexWhere((item) => item.commentId == comment.commentId);
    if (index == -1) {
      if (changeNum) {
        cmtNum++;
      }
      comments!.insert(0, comment);
      if (sort) {
        sortComments();
      }
    }
  }

  /// 删除评论,同时删除热评
  void deleteComment(int commentId, {bool changeNum = true}) {
    if (hotComment?.commentId == commentId) {
      hotComment = null;
    }
    if (comments == null) {
      return;
    }
    int index = comments!.indexWhere((item) => item.commentId == commentId);
    if (index != -1) {
      if (changeNum) {
        if (cmtNum > 0) {
          cmtNum--;
        }
      }
      comments!.removeAt(index);
    }
  }

  /// 按时间降序
  void sortLikes() {
    likes?.sort((left, right) {
      if (left.time == null || right.time == null) {
        return -1;
      }
      if (left.time == right.time) {
        return right.uid.compareTo(left.uid);
      }
      return right.time!.compareTo(left.time!);
    });
  }

  /// 按时间升序
  void sortComments() {
    comments?.sort((left, right) {
      if (left.time == right.time) {
        return left.commentId!.compareTo(right.commentId!);
      }
      return left.time!.compareTo(right.time!);
    });
  }

  ImageBean _getImageBean(String item) {
    if (item.isEmpty) {
      return ImageBean();
    }

    if (!item.startsWith(RegExp(r'http(s?)://'))) {
      item = System.imageDomain + item;
    }

    String url = item;
    double width = 0.0;
    double height = 0.0;

    // 分割宽高
    List<String> strs = item.split('?');
    if (strs.length == 2) {
      url = strs[0];
      String extra = strs[1];
      List<String> size = extra.split('*');
      if (size.length >= 2) {
        width = Util.parseDouble(size[0]);
        height = Util.parseDouble(size[1]);
      }
    }

    return ImageBean(url: url, width: width, height: height);
  }

  /// 数据上报
  String get flowType {
    if (tagType == null || tagType == TagType.unknown) {
      return 'topic_moment';
    } else if (tagType == TagType.play) {
      return 'game_moment';
    } else {
      return '${_$TagTypeEnumMap[tagType]}_moment';
    }
  }

  String get reportTag {
    if (tagsTp != null && tagsTp!.isNotEmpty) {
      return jsonEncode(tagsTp!.map((e) => e.tag).toList(growable: false));
    } else {
      return '';
    }
  }

  List<int> get reportTagIds {
    if (tagsTp == null) return [];

    return tagsTp!.map((e) => e.id).toList();
  }
}

@JsonSerializable()
class WorkInfo {
  @JsonKey(name: 'singer_name')
  final String? singerName;
  @JsonKey(name: 'song_name')
  final String? songName;
  @JsonKey(name: 'song_cover')
  final String? songCover;
  @JsonKey(name: 'gift_num')
  final String? giftNum;
  @JsonKey(name: 'play_num')
  final String? playNum;
  @JsonKey(name: 'singer_icon')
  final String? singerIcon;
  @JsonKey(name: 'song_duration')
  final int songDuration;
  @JsonKey(name: 'work_type')
  final String? workType;
  @JsonKey(name: 'song_id')
  final int songId;

  WorkInfo(
      this.singerName,
      this.songName,
      this.songCover,
      this.giftNum,
      this.playNum,
      this.singerIcon,
      this.songDuration,
      this.workType,
      this.songId);

  factory WorkInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkInfoToJson(this);
}

class ExposureMoment {
  int topicId;
  DateTime startExposureTime;
  int duration = 0;
  Moment? moment;
  bool isDirty = false;

  ExposureMoment({
    required this.topicId,
    required this.startExposureTime,
    this.moment,
    this.isDirty = false,
    this.duration = 0,
  });

  void reset() {
    startExposureTime = DateTime.now();
    isDirty = false;
    duration = 0;
  }
}
