import 'package:chat/src/quick_reply/model/quick_reply_edit_model.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:shared/shared.dart';
import 'package:shared/util/response_utils.dart';

/// 快速回复Repository
class QuickReplyRepository {
  QuickReplyRepository._();

  static const tag = 'QuickReplyRepository';
  static const debug = false;

  /// 加载快速回复分组信息
  static Future<DataRsp<QuickGroups>> loadGroups({int showContent = 1}) async {
    String url =
        '${System.domain}go/yy/gs/getList?version=1&show_content=$showContent';

    /// show_content = 0，表示不需要下发data节点下的rows节点
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: true, formatJson: true);
      if (debug) Log.d('$tag#loadGroups, response: ${response.response}');
      DataRsp<QuickGroups> resp = DataRsp<QuickGroups>.fromXhrResponse(response,
          (object) => QuickGroups.fromJson(object as Map<String, dynamic>));
      return resp;
    } catch (e) {
      if (debug) Log.d('QuickReplyRepository#loadGroups:, e: $e');
      return ResponseUtils.buildErrorDataRsp<QuickGroups>(e);
    }
  }

  /// 创建快速回复分组
  static Future<BaseResponse> createGroup(String name) async {
    String url = '${System.domain}quickreply/createGroup?uid=${Session.uid}';
    try {
      XhrResponse response =
          await Xhr.post(url, {'name': name}, throwOnError: true);
      if (debug) Log.d('$tag#createGroup, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#createGroup:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 重命名快速回复分组
  static Future<BaseResponse> renameGroup(int groupId, String name) async {
    String url = '${System.domain}quickreply/modifyGroup';
    try {
      XhrResponse response = await Xhr.post(
          url, {'group_id': '$groupId', 'name': name},
          throwOnError: true);
      if (debug) Log.d('$tag#renameGroup, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#renameGroup:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 删除快速回复分组
  static Future<BaseResponse> deleteGroup(int groupId) async {
    String url = '${System.domain}quickreply/delGroup';
    try {
      XhrResponse response =
          await Xhr.post(url, {'group_id': '$groupId'}, throwOnError: true);
      if (debug) Log.d('$tag#deleteGroup, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#deleteGroup:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 删除快速回复
  static Future<BaseResponse> deleteReply(int replyId) async {
    String url = '${System.domain}quickreply/delReply';
    try {
      XhrResponse response =
          await Xhr.post(url, {'content_id': '$replyId'}, throwOnError: true);
      if (debug) Log.d('$tag#deleteReply, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#deleteReply:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 创建快速回复
  static Future<BaseResponse> createReply(
      int groupId, QuickReplyEditResult result) async {
    String url =
        '${System.domain}/quickreply/createReply?uid=${Session.uid}&version=1';
    try {
      Map<String, String> params = {
        'group_id': '$groupId',
        'title': result.title,
        if (!Util.isStringEmpty(result.content)) 'content': result.content!,
        if (!Util.isStringEmpty(result.image)) 'img': result.image!,
        if (!Util.isStringEmpty(result.audio)) 'audio': result.audio!,
        if (Util.parseInt(result.duration) > 0)
          'duration': result.duration.toString(),
      };
      if (!Util.isStringEmpty(result.image)) {
        params['img'] = result.image!;
        params['img_w'] = '${result.imgWidth ?? 0}';
        params['img_h'] = '${result.imgHeight ?? 0}';
      }
      XhrResponse response = await Xhr.post(url, params, throwOnError: true);
      if (debug) Log.d('$tag#createReply, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#createReply:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 修改快速回复
  static Future<BaseResponse> editReply(
      int replyId, QuickReplyEditResult result) async {
    String url = '${System.domain}quickreply/modifyReply&version=1';
    try {
      Map<String, String> params = {
        'content_id': '$replyId',
        'title': result.title,
        if (!Util.isStringEmpty(result.content)) 'content': result.content!,
        if (!Util.isStringEmpty(result.audio)) 'audio': result.audio!,
        if (Util.parseInt(result.duration) > 0)
          'duration': result.duration.toString(),
      };
      if (!Util.isStringEmpty(result.image)) {
        params['img'] = result.image!;
        params['img_w'] = '${result.imgWidth ?? 0}';
        params['img_h'] = '${result.imgHeight ?? 0}';
      }
      XhrResponse response = await Xhr.post(url, params, throwOnError: true);
      if (debug) Log.d('$tag#editReply, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#editReply:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 加载快速回复
  static Future<DataRsp<GroupReplies>> loadReplies(int groupId) async {
    String url =
        '${System.domain}/quickreply/getGroupDetail?version=1&group_id=$groupId';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (debug) Log.d('$tag#loadReplies, response: ${response.response}');
      DataRsp<GroupReplies> resp = DataRsp<GroupReplies>.fromXhrResponse(
          response,
          (object) => GroupReplies.fromJson(object as Map<String, dynamic>));
      return resp;
    } catch (e) {
      if (debug) Log.d('$tag#loadReplies:, e: $e');
      return ResponseUtils.buildErrorDataRsp<GroupReplies>(e);
    }
  }
}
