import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/circle/model/circle_activity_resp.dart';
import 'package:moment/src/circle/model/circle_detail_resp.dart';
import 'package:moment/src/circle/model/circle_friend_playing_resp.dart';
import 'package:moment/src/circle/model/circle_join_resp.dart';
import 'package:moment/src/circle/model/circle_moment_response.dart';
import 'package:moment/src/model/homePageRsp.dart';
import 'package:moment/src/model/moment_bean_v3.dart';
import 'package:moment/src/model/recommend_follow_item_bean.dart';
import 'package:moment/src/model/rush_circle_bean.dart';
import 'package:moment/src/model/topic_bean.dart';
import 'package:shared/k.dart' as BaseK;

import '../../k.dart';
import '../model/circle_mood_bean.dart';
import '../model/circle_mood_reply_bean.dart';
import '../model/pb/generated/comment.pb.dart';
import '../model/pb/generated/square.pb.dart';

// 刷新关注的话题
const String EventRefreshFollowTopics = 'event.refresh.follow.topics';

// 刷新关注动态
const String EventRefreshFollowList = 'event.refresh.follow.list';

// 刷新广播动态
const String EventRefreshBroadcastList = 'event.refresh.broadcast.list';

/// 朋友圈api
class Api {
  /// 关注用户动态列表 v3
  /// [next] 翻页参数动态id
  static Future<DataRsp<MomentPageV3>> getFollowListV3(int next) async {
    String url =
        '${System.domain}circle/new?ver=4&previd=$next&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<MomentPageV3>.fromXhrResponse(response,
          (object) => MomentPageV3.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MomentPageV3>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 发表动态
  ///	[type],		提交数据类型（text, picture, audio, video)。string
  ///	[uid],		提交的用户id。int
  /// [content],	提交的文字内容。string
  /// [picture],	图片链接列表。array
  ///	[video],	视频链接url。string
  ///	[cover],	视频封面url。string
  /// [audio],	音频链接url。string
  /// [auth],	权限 public 公开、 friend 仅好友可见、 private 私密
  /// [location] 地理位置
  /// [tags] 动态标签
  /// [tagType] 动态标签类型 【topic|play】
  static Future<DataRsp<Moment>> postMoment(
    String type,
    int uid,
    String content, {
    List<String>? picture,
    String? video,
    String? cover,
    String? audio,
    String? location,
    String? longitude,
    String? latitude,
    String auth = 'public',
    List<String>? tags,
    SelectGame? gameTag,
    CaseTag? caseTag,
    AppraiserTag? appraiserTag,
    String atuids = '',
    bool isBroadcast = false,
    bool isWedding = false,
    int? musicId,
    Map<String, dynamic>? ext,
    Map<String, String>? musicVideoParams,
  }) async {
    String url = '${System.domain}circle/topic/submit?uid=${Session.uid}';
    try {
      String pics = picture != null ? jsonEncode(picture) : '';

      Map<String, String> postData = {
        'ver': '3',
        'type': type,
        'uid': '$uid',
        'content': content,
        'picture': pics,
        'video': video ?? '',
        'cover': cover ?? '',
        'audio': audio ?? '',
        'location': location ?? '',
        'longitude': longitude ?? '',
        'latitude': latitude ?? '',
        'auth': auth,
        'atuids': atuids,
      };

      // 标签
      if (tags != null && tags.isNotEmpty) {
        postData['tagtype'] = 'topic';
        postData['tags'] = jsonEncode(tags);
      }
      // 约玩
      else if (gameTag != null) {
        postData['tagtype'] = 'play';
        postData['tags'] = jsonEncode({
          "name": gameTag.game?.name,
          "mode": gameTag.mode?.name,
          "srv": gameTag.srv?.name,
          "level": gameTag.level?.name,
          "type": gameTag.game?.type,
        });
      }

      // 案件
      if (caseTag != null) {
        postData['tagtype'] = 'case';
        postData['tags'] = jsonEncode({
          "id": caseTag.id,
          "tag": caseTag.tag,
          "icon": caseTag.icon,
        });
      }

      // 鉴定师故事
      if (appraiserTag != null) {
        postData['tagtype'] = 'apra';
        postData['tags'] =
            jsonEncode({'id': appraiserTag.id, 'tag': appraiserTag.tag});
      }

      if (isBroadcast) {
        postData['tagtype'] = 'broadcast';
      }

      if (isWedding) {
        postData['tagtype'] = 'wedding';
        postData['tags'] = jsonEncode(ext);
      }

      if (musicId != null) {
        postData['tagtype'] = 'thevoice';
        postData['tags'] = jsonEncode({"vid": musicId});
      }

      if (musicVideoParams != null) {
        // musicVideoParams['user_voice_url'] = video;
        postData['work_extra'] = jsonEncode(musicVideoParams);
      }

      try {
        XhrResponse response = await Xhr.postJson(url, postData);
        DataRsp<Moment> rsp = DataRsp<Moment>.fromXhrResponse(response,
            (object) => Moment.fromJson(object as Map<String, dynamic>));
        if (rsp.success == true) {
          rsp.data?.titleNew = Session.titleNew;
          if (isBroadcast) {
            eventCenter.emit(EventRefreshBroadcastList, rsp.data);
            eventCenter.emit(EventRefreshFollowList, rsp.data);
          } else {
            eventCenter.emit(EventRefreshFollowList, rsp.data);
          }
        }
        return rsp;
      } catch (e) {
        return DataRsp<Moment>(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return DataRsp<Moment>(msg: e.toString(), success: false);
    }
  }

  /// 删除动态
  /// [topicId] 动态id
  static Future<DataRsp> deleteMoment(int topicId) async {
    String url =
        '${System.domain}circle/topic/submit/cancel?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(url, {'topic_id': '$topicId'});
      return DataRsp.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: e.toString(), success: false);
    }
  }

  /// 获取某个用户 动态列表
  /// [uid] 用户id
  /// [topicId] 动态id、分页用
  static Future<DataRsp<MomentPage>> getMomentList(int uid, int topicId) async {
    String url =
        '${System.domain}circle/topics?ver=3&tuid=$uid&tpid=$topicId&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<MomentPage>.fromXhrResponse(response,
          (object) => MomentPage.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MomentPage>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 动态详情 picture, video, audio
  /// [uid] 用户id
  /// [topicId] 动态id、分页用
  static Future<DataRsp<Moment>> getMomentDetail(int uid, int topicId) async {
    String url =
        '${System.domain}circle/topic?ver=3&tpid=$topicId&tuid=$uid&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<Moment>.fromXhrResponse(response,
          (object) => Moment.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<Moment>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 点赞列表
  /// [topicId] 动态id
  /// [topicUid] 动态发布者uid
  static Future<LikesResponse> getLikeList(int topicId, int topicUid) async {
    String url =
        '${System.domain}circle/like?tpid=$topicId&tuid=$topicUid&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return LikesResponse(msg: response.error.toString(), success: false);
      }
      try {
        return LikesResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        return LikesResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return LikesResponse(msg: e.toString(), success: false);
    }
  }

  /// 消息列表
  /// [msgid] 消息id 分页用, msgid = 0 拉取最新的数据
  static Future<DataRsp<MessagePage>> getMessageList(int msgid) async {
    String url =
        '${System.domain}circle/message/?uid=${Session.uid}&msgid=$msgid';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<MessagePage>.fromXhrResponse(response,
          (object) => MessagePage.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MessagePage>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 推荐用户列表
  static Future<MomentRecommendResponse> getRecommendList() async {
    String url =
        '${System.domain}circle/recommend?uid=${Session.uid}&version=10';
    try {
      XhrResponse response = await Xhr.postJson(url, {});
      if (response.error != null) {
        return MomentRecommendResponse(
            msg: response.error.toString(), success: false);
      }
      try {
        return MomentRecommendResponse.fromJson(
            response.value() as Map<String, dynamic>);
      } catch (e) {
        return MomentRecommendResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MomentRecommendResponse(msg: e.toString(), success: false);
    }
  }

  /// 动态点赞发布【/circle/like/submit/】POST方式
  /// [topicId] 动态id
  /// [uid] 用户id
  static Future<DataRsp<LikeBean>> postLike(int topicId, int tpuid,
      {int? uid, int caseId = 0}) async {
    String url =
        '${System.domain}circle/like/submit?uid=${uid ?? Session.uid}&version=1';
    try {
      XhrResponse response =
          await Xhr.postJson(url, {'topic_id': '$topicId', 'tpuid': '$tpuid'});
      DataRsp<LikeBean> rsp = DataRsp<LikeBean>.fromXhrResponse(response,
          (object) => LikeBean.fromJson(object as Map<String, dynamic>));
      if (rsp.success == true) {
        Tracker.instance.track(TrackEvent.like, properties: {
          'target_uid': tpuid,
          'moment_id': topicId,
          if (caseId > 0) 'true_case_id': caseId,
        });
      }
      return rsp;
    } catch (e) {
      return DataRsp<LikeBean>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 动态取消点赞
  /// [topicId] 动态id
  /// [uid] 用户id
  static Future<DataRsp> cancelLike(int topicId, int uid) async {
    String url = '${System.domain}circle/like/submit/cancel?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'tpuid': '$uid',
          'topic_id': '$topicId',
        },
      );
      return DataRsp.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: e.toString(), success: false);
    }
  }

  ///评论点赞/取消点赞 isLike:true:点赞,false：取消点赞
  static Future<ResCommentLike> commentLike(
      int topicId, int commentId, bool isLike) async {
    String url = '${System.domain}/go/yy/circle/commentLike';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'tpid': '$topicId',
            'cmtid': '$commentId',
            'islike': '$isLike',
          },
          pb: true);
      var rsp = ResCommentLike.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return ResCommentLike(success: false, msg: e.toString());
    }
  }

  /// 动态评论
  /// [topicId] 动态id int64
  /// [uid] 用户id
  /// [content] 评论内容
  /// [toUid] 回复对象uid，可以为空
  ///
  /// 语音弹幕新增
  /// [ReferCmtId] 直接回复的评论ID
  /// [contentType] 评论内容类型:0 默认文字评论,1 嗨歌弹幕
  /// [startTime] 录制的开始时间 毫秒
  /// [duration] 弹幕时长 毫秒
  static Future<DataRsp<Comment>> postComment(
      String? topicId, int topicUid, String content,
      {int? toUid,
      String ReferCmtId = '0',
      int contentType = 0,
      int startTime = 0,
      int? duration}) async {
    String url =
        '${System.domain}circle/comment/submit?uid=${Session.uid}&version=1';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'tpuid': '$topicUid',
          'topic_id': topicId ?? '',
          'content': content,
          'to_uid': '${toUid ?? ''}',
          'refer_cmt_id': ReferCmtId,
          'content_type': '$contentType',
          'start_time': '$startTime',
          if (Util.parseInt(duration) > 0) 'duration': '$duration',
        },
      );

      DataRsp<Comment> rsp = DataRsp<Comment>.fromXhrResponse(response,
          (object) => Comment.fromJson(object as Map<String, dynamic>));
      if (rsp.success == true && rsp.data != null) {
        Tracker.instance.track(TrackEvent.comment, properties: {
          'target_uid': toUid ?? topicUid,
          'moment_id': topicId,
          'comment_id': rsp.data!.commentId,
        });
      }
      return rsp;
    } catch (e) {
      return DataRsp<Comment>(msg: e.toString(), success: false);
    }
  }

  /// 删除评论
  /// [topicId] 动态id
  /// [topicUid] 用户id
  /// [cmtid] 评论 id
  static Future<DataRsp<Comment>> cancelComment(
      int topicId, int topicUid, String cmtid) async {
    String url =
        '${System.domain}circle/comment/submit/cancel?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'topic_id': '$topicId',
          'tpuid': '$topicUid',
          'cmtid': cmtid,
        },
      );
      return DataRsp<Comment>.fromXhrResponse(response,
          (object) => Comment.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<Comment>(msg: e.toString(), success: false);
    }
  }

  /// 清空消息
  static Future<DataRsp> clearMessage() async {
    String url = '${System.domain}circle/message/clear?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {},
      );
      return DataRsp.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: e.toString(), success: false);
    }
  }

  /// 上传音频
  /// [audioBase64] 音频base64编码
  static Future<DataRsp<UploadAudioBean>> uploadAudio(
      String audioBase64) async {
    String url = '${System.domain}circle/upload/audio?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'audioBase64': audioBase64,
        },
      );
      return DataRsp<UploadAudioBean>.fromXhrResponse(response,
          (object) => UploadAudioBean.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<UploadAudioBean>(msg: e.toString(), success: false);
    }
  }

  /// 朋友圈发现
  /// [page] 请求page
  static Future<DataRsp<RushMomentPage>> getDiscoverList(int page) async {
    String url = '${System.domain}circle/found?page=$page&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<RushMomentPage>.fromXhrResponse(response,
          (object) => RushMomentPage.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<RushMomentPage>(msg: e.toString(), success: false);
    }
  }

  /// 约玩、标签过滤后的动态列表
  /// [page] 请求page
  /// [type] 页面类型
  /// [id] 游戏id
  /// [sort] new-最新 rcmd-推荐
  static Future<DataRsp<RushMomentPage>> getPlayList(int page,
      {PageType? type, int id = 0}) async {
    String url =
        '${System.domain}circle/detail?ver=1&page=$page&uid=${Session.uid}';

    if (type == PageType.Tag) {
      url += '&tagid=$id&sort=new';
    } else if (type == PageType.PlayTag) {
      url += '&gameid=$id';
    } else if (type == PageType.Case) {
      url += '&caseid=$id';
    } else if (PageType.Recommend == type) {
      url += '&tagid=$id&sort=rcmd';
    } else if (PageType.Broadcast == type) {
      url += '&type=broadcast';
    } else if (PageType.Appraiser == type) {
      url += '&apraid=$id';
    } else if (PageType.GameClub == type) {
      url += '&club_id=$id';
    }

    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<RushMomentPage>.fromXhrResponse(response,
          (object) => RushMomentPage.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<RushMomentPage>(msg: e.toString(), success: false);
    }
  }

  /// 获取推荐标签
  static Future<DataRsp<MomentTags>> getTagRecommend() async {
    String url = '${System.domain}circle/tag/recommend';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<MomentTags>.fromXhrResponse(response,
          (object) => MomentTags.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MomentTags>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 标签匹配、查询服务端是否创建了该标签
  /// [tag] 标签
  static Future<DataRsp<MomentTags>> tagMatch(String tag) async {
    String url = '${System.domain}circle/tag/match';
    try {
      XhrResponse response = await Xhr.postJson(url, {
        'key': tag,
      });
      return DataRsp<MomentTags>.fromXhrResponse(response,
          (object) => MomentTags.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<MomentTags>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 添加标签 [POST方式]
  /// [tag] 标签名
  static Future<DataRsp> tagSubmit(String tag) async {
    String url = '${System.domain}circle/tag/submit';
    try {
      XhrResponse response = await Xhr.postJson(url, {'tag': tag});
      return DataRsp<MomentTags>.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: e.toString(), success: false);
    }
  }

  /// 开黑、挂起、约玩、征召配置列表数据
  /// [type] type=[play|black|recruit]
  /// [gid] 游戏id ，房间征召用
  /// play 约玩、black 开黑、recruit征召
  static Future<DataRsp<RushConfigBean>> getRushConfig(String type,
      {int? gid}) async {
    String url = '${System.domain}rush/config?type=$type';
    if (gid != null) {
      url += '&gid=$gid';
    }
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<RushConfigBean>.fromXhrResponse(response,
          (object) => RushConfigBean.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<RushConfigBean>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 关注流 关注话题
  ///
  static Future<DataRsp<List<Topic>>> getFollowTopics() async {
    String url = '${System.domain}circle/tag/focus';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<Topic>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => Topic.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<Topic>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 首页推荐话题
  ///
  static Future<DataRsp<List<Topic>>> getRecommendTopics() async {
    String url = '${System.domain}circle/tag/talk';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<Topic>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => Topic.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<Topic>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// [bwids] 上一页下发的所有id
  /// [debug] 1为debug版本，输出ctr等信息
  /// [sort] 排序类型(rcmd:推荐; time:时间)
  static Future<HomePageRsp> getHomePage(int page,
      {List<String>? bwids, int debug = 0, String? sort = 'rcmd'}) async {
    try {
      String url = "${System.domain}rush/v4";
      Map<String, String> params = {'page': page.toString()};
      if (bwids != null && bwids.isNotEmpty) {
        params['bwids'] = json.encode(bwids);
      }
      params['debug'] = debug.toString();
      params['sort'] = sort ?? 'rcmd';
      params['network'] = Util.connectivityResult == ConnectivityResult.wifi
          ? 'wifi'
          : 'mobile';
      params['os'] = Platform.operatingSystem;

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      HomePageRsp rsp = HomePageRsp.fromJson(res as Map<String, dynamic>);
      return rsp;
    } catch (e) {
      Log.d(e.toString());
      return HomePageRsp(false);
    }
  }

  /// 标签分类
  static Future<DataRsp<List<TagCate>>> getTagCate() async {
    String url = "${System.domain}circle/tagCate";
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<TagCate>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => TagCate.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<TagCate>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 推荐话题
  static Future<DataRsp<TagDetail>> getRecommendTagDetail() async {
    String url = "${System.domain}circle/tagCate/rcmd?version=1";
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<TagDetail>.fromXhrResponse(response,
          (object) => TagDetail.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<TagDetail>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 标签分类
  static Future<DataRsp<TagDetail>> getTagDetail(int cateId) async {
    String url = "${System.domain}circle/tagDetail?cateId=$cateId";
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<TagDetail>.fromXhrResponse(response,
          (object) => TagDetail.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<TagDetail>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 话题信息
  static Future<DataRsp<TagInfo>> getTagInfo(int tagId) async {
    String url = "${System.domain}circle/tagInfo?tagId=$tagId";
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<TagInfo>.fromXhrResponse(response,
          (object) => TagInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<TagInfo>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 获取圈子tab红点
  static Future<DataRsp<RushCircleRedPoint>> getRushCircleRedPoint() async {
    String url = '${System.domain}rush/hub/hasNew?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<RushCircleRedPoint>.fromXhrResponse(
          response,
          (object) =>
              RushCircleRedPoint.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<RushCircleRedPoint>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 首页圈子列表
  static Future<DataRsp<CirclePageData>> getCirclePageList() async {
    String url = '${System.domain}rush/hub/index?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CirclePageData>.fromXhrResponse(response,
          (object) => CirclePageData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CirclePageData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 圈内活动
  static Future<DataRsp<CircleActivityData>> getCircleActivityPageResponse(
      int page) async {
    String url =
        '${System.domain}rush/hub/activity?page=$page&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CircleActivityData>.fromXhrResponse(
          response,
          (object) =>
              CircleActivityData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CircleActivityData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 圈友在玩
  static Future<DataRsp<CircleFriendPlayingData>>
      getCircleFriendPlayingPageResponse(int page, {int hubid = 0}) async {
    String url =
        '${System.domain}rush/hub/friends?page=$page&uid=${Session.uid}';
    if (hubid > 0) {
      url = '$url&hubid=$hubid';
    }
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CircleFriendPlayingData>.fromXhrResponse(
          response,
          (object) =>
              CircleFriendPlayingData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CircleFriendPlayingData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 圈子详情
  static Future<DataRsp<CircleDetailData>> getCircleDetailResponse(
      int circleId) async {
    String url =
        '${System.domain}rush/hub/detail?hubid=$circleId&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CircleDetailData>.fromXhrResponse(
          response,
          (object) =>
              CircleDetailData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CircleDetailData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 圈内动态
  static Future<DataRsp<CircleMomentData>> getCircleMomentResponse(
      int? circleId, int? typeId, int? page) async {
    String url = '${System.domain}rush/list/section?ver=1';
    try {
      Map<String, String> params = {
        'hubid': '${circleId ?? ''}',
        'id': '${typeId ?? ''}',
        'page': '${page ?? ''}',
        'uid': Session.uid.toString()
      };

      var connectivityResult = await (Connectivity().checkConnectivity());
      params['network'] =
          connectivityResult == ConnectivityResult.wifi ? 'wifi' : 'mobile';
      params['os'] = Platform.operatingSystem;

      XhrResponse response = await Xhr.postJson(url, params);
      return DataRsp<CircleMomentData>.fromXhrResponse(
          response,
          (object) =>
              CircleMomentData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CircleMomentData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 加入圈子
  static Future<DataRsp<CircleOpResult>> getJoinCircleResponse(
      int circleId) async {
    String url =
        '${System.domain}rush/hub/join?hubid=$circleId&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CircleOpResult>.fromXhrResponse(response,
          (object) => CircleOpResult.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CircleOpResult>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 退出圈子
  static Future<DataRsp<CircleOpResult>> getQuitCircleResponse(
      int circleId) async {
    String url =
        '${System.domain}rush/hub/quit?hubid=$circleId&uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CircleOpResult>.fromXhrResponse(response,
          (object) => CircleOpResult.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<CircleOpResult>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 动态相册用户信息
  static Future<DataRsp<AlbumData>> getCirclePicsInfo(int uid) async {
    String url = '${System.domain}circle/pics/info?uid=$uid';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<AlbumData>.fromXhrResponse(response,
          (object) => AlbumData.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<AlbumData>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 动态相册
  /// [tpid] 翻页参数，初始化为0
  static Future<ResCirclePics> getCirclePics(int uid, int tpid) async {
    String url = '${System.domain}go/yy/circle/pics?uid=$uid&tpid=$tpid';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResCirclePics.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCirclePics(msg: e.toString(), success: false);
    }
  }

  /// 私信点击上报
  /// [tpid] 动态id
  static void reportCircleChat(int tpid) {
    String url = '${System.domain}report/circleChat';
    try {
      Xhr.postJsonWithoutParse(url, {'tpid': '$tpid'});
    } catch (e) {
      Log.d(e.toString());
    }
  }

  /// 关注成功点击上报
  /// [tpid] 动态id
  static void reportCircleFollow(int tpid) {
    String url = '${System.domain}report/circleFollow';
    try {
      Xhr.postJsonWithoutParse(url, {'tpid': '$tpid'});
    } catch (e) {
      Log.d(e.toString());
    }
  }

  /// 动态点击上报
  /// [tpid] 动态id
  static void reportCircleClick(int tpid) {
    String url = '${System.domain}report/circleClick';
    try {
      Xhr.postJsonWithoutParse(url, {'tpid': '$tpid'});
    } catch (e) {
      Log.d(e.toString());
    }
  }

  /// 动态曝光上报
  /// [ids] 动态id
  static void reportStreamExposure(List<String?>? ids) {
    if (ids == null || ids.isEmpty) return;
    ids.removeWhere((item) => item == null);
    String url = '${System.domain}go/yy/report/streamExposure';
    try {
      Xhr.postJsonWithoutParse(
          url,
          {
            'data': json.encode(ids),
          },
          pb: true);
    } catch (e) {
      Log.d(e.toString());
    }
  }

  /// 获取推荐用户列表
  static Future<DataRsp<List<RecommendFollowItem>>> getRecommendFollow() async {
    String url = "${System.domain}friend/inactiveRecommend";

    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<RecommendFollowItem>>.fromXhrResponse(
        response,
        (object) =>
            Util.parseList(object, (e) => RecommendFollowItem.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<RecommendFollowItem>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 获取是否有喊话卡
  static Future<DataRsp<Map>> getHasBroadcastCardOrNot() async {
    String url = "${System.domain}circle/getSendBroadcastEnable";
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return DataRsp(msg: response.error.toString(), success: false);
      }
      try {
        return DataRsp.fromJson(response.value() as Map<String, dynamic>,
            (object) => object as Map);
      } catch (e) {
        return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return DataRsp(msg: e.toString(), success: false);
    }
  }

  /// 小心情页面接口
  static Future<CircleMoodResp> getCircleMoodResponse() async {
    try {
      String url = '${System.domain}circle/mood';
      XhrResponse response = await Xhr.postJson(url, {});
      Map resp = response.value();
      if (resp.isNotEmpty) {
        return CircleMoodResp.fromJson(resp as Map<String, dynamic>);
      } else {
        return CircleMoodResp(success: false, msg: K.moment_no_data);
      }
    } catch (e) {
      return CircleMoodResp(success: false, msg: BaseK.K.base_net_error);
    }
  }

  /// 回复小心情接口
  static Future<CircleMoodReplyResp> circleMoodReply(
      int topicId, int tpuid, String content) async {
    try {
      String url = '${System.domain}circle/mood/reply';
      XhrResponse response = await Xhr.postJson(url, {
        'topic_id': topicId.toString(),
        'tpuid': tpuid.toString(),
        'content': content
      });
      Map resp = response.value();
      if (resp.isNotEmpty) {
        return CircleMoodReplyResp.fromJson(resp as Map<String, dynamic>);
      } else {
        return CircleMoodReplyResp(success: false, msg: K.moment_reply_fail);
      }
    } catch (e) {
      return CircleMoodReplyResp(success: false, msg: e.toString());
    }
  }

  /// 动态tab小心情未读数接口
  static Future<ResCircleTabRedPoint> getSmallMoodUnreadNum() async {
    String url = '${System.domain}go/yy/circle/tabRedPoint';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResCircleTabRedPoint.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCircleTabRedPoint(msg: e.toString(), success: false);
    }
  }

  /// 动态广场-热搜话题
  static Future<ResGetRecTags> getSquareHotTopic() async {
    String url = '${System.domain}go/yy/circle/getRecTags';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResGetRecTags.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGetRecTags(msg: e.toString(), success: false);
    }
  }

  /// 获取广场创作达人弹窗内容 scene:0-首次弹窗，1 or其它-非首次弹窗
  static Future<SquarePopupRsp> getSquarePopup(int scene) async {
    String url = '${System.domain}go/yy/square/popup?scene=$scene';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return SquarePopupRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return SquarePopupRsp(msg: e.toString(), success: false);
    }
  }

  /// 动态置顶、取消置顶
  static Future<NormalNull> setTop(int topicId, bool top) async {
    String url = '${System.domain}go/yy/circle/topPrivateCircle';
    try {
      XhrResponse response = await Xhr.post(
          url, {'topic_id': '$topicId', 'istop': top ? 'true' : 'false'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 广场一周情报局
  static Future<RespGetWeekInfo> getWeekInfo() async {
    String url = '${System.domain}go/go_circle/intelligence/getWeekInfo';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return RespGetWeekInfo.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespGetWeekInfo(msg: e.toString(), success: false);
    }
  }

  /// 广场一周情报局入口
  static Future<RespGetCfg> getCfg() async {
    String url = '${System.domain}go/go_circle/intelligence/getCfg';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return RespGetCfg.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespGetCfg(msg: e.toString(), success: false);
    }
  }
}
