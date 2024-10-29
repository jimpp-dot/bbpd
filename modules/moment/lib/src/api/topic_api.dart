import 'package:shared/shared.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/topic_bean.dart';

/// 话题相关api
class TopicApi {
  static Future<List<TopicTab>?> getTopicTab() async {
    String url = '${System.domain}circle/tag/square/tab';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      DataRsp rsp = DataRsp<List<TopicTab>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => TopicTab.fromJson(e)),
      );
      return rsp.success == true ? rsp.data : null;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 获取话题列表
  static Future<TopicSquareListResponse> getTopicList(int id, int page) async {
    String url = '${System.domain}circle/tag/square?id=$id&page=$page';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      TopicSquareListResponse topicResponse = TopicSquareListResponse.fromJson(
          response.value() as Map<String, dynamic>);
      return topicResponse;
    } catch (e) {
      Log.d(e);
      return TopicSquareListResponse(success: false, msg: e.toString());
    }
  }

  /// 关注话题
  static Future<bool> followTopic(int topicId, int uid, String? page) async {
    String url = '${System.domain}circle/tag/follow?id=$topicId&uid=$uid';
    XhrResponse response = await Xhr.getJson(url, throwOnError: false);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.success == true) {
      Tracker.instance.track(TrackEvent.topic_follow, properties: {
        'topic_id': topicId,
        'stat': 'follow',
        'page': page ?? '',
      });
      eventCenter.emit(EventRefreshFollowTopics);
      Fluttertoast.showToast(msg: K.moment_follow_success);
    } else if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    } else {
      Fluttertoast.showToast(msg: K.moment_follow_failed);
    }
    return baseResponse.success == true;
  }

  /// 取消关注话题
  static Future<bool> unFollowTopic(int topicId, int uid, String? page) async {
    String url = '${System.domain}circle/tag/unfollow?id=$topicId&uid=$uid';
    XhrResponse response = await Xhr.getJson(url, throwOnError: false);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.success == true) {
      Tracker.instance.track(TrackEvent.topic_follow, properties: {
        'topic_id': topicId,
        'stat': 'unfollow',
        'page': page ?? '',
      });
      eventCenter.emit(EventRefreshFollowTopics);
      Fluttertoast.showToast(msg: K.moment_unfollow_success);
    } else if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    } else {
      Fluttertoast.showToast(msg: K.moment_unfollow_failed);
    }
    return baseResponse.success == true;
  }
}
