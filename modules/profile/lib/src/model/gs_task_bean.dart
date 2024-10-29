import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';

part 'gs_task_bean.g.dart';

enum GsTaskType {
  receptionTask, //接待任务
}

@JsonSerializable()
class GsTaskInfo {
  int uid;
  String name;
  String icon;

  @JsonKey(name: 'position_note')
  String note; //公会、频道

  @JsonKey(name: 'desc_url')
  String descUrl; //说明H5地址
  @JsonKey(name: 'end_time', fromJson: Util.parseInt)
  int endTime; //剩余时间，单位为秒
  @JsonKey(name: 'cur_level', fromJson: Util.parseInt)
  int curLevel; //当前级别
  @JsonKey(name: 'level_num', fromJson: Util.parseInt)
  int levelNum; //等级个数

  Map<String, List<GsTaskItem>>? tasks; //任务<级别，任务列表>
  List<GsRewardItem> rewards; //本周奖励
  @JsonKey(name: 'reward_desc')
  List<String> rewardDesc; //奖励说明

  GsTaskInfo(
      this.uid,
      this.name,
      this.icon,
      this.note,
      this.descUrl,
      this.endTime,
      this.curLevel,
      this.levelNum,
      this.tasks,
      this.rewards,
      this.rewardDesc);

  factory GsTaskInfo.fromJson(Map<String, dynamic> json) =>
      _$GsTaskInfoFromJson(json);
}

@JsonSerializable()
class GsTaskItem {
  String icon;
  String title;
  @JsonKey(name: 'total_progress', fromJson: Util.parseInt)
  int totalProgress;
  @JsonKey(name: 'cur_progress', fromJson: Util.parseInt)
  int curProgress;

  GsTaskItem(
      {this.icon = '',
      this.title = '',
      this.totalProgress = 0,
      this.curProgress = 0});

  factory GsTaskItem.fromJson(Map<String, dynamic> json) =>
      _$GsTaskItemFromJson(json);
}

@JsonSerializable()
class GsRewardItem {
  String icon;
  String name;

  GsRewardItem({this.icon = '', this.name = ''});

  factory GsRewardItem.fromJson(Map<String, dynamic> json) =>
      _$GsRewardItemFromJson(json);
}

@JsonSerializable()
class GsTaskRsp extends BaseResponse {
  GsTaskInfo? data;

  GsTaskRsp({super.success, super.msg, this.data});

  factory GsTaskRsp.fromJson(Map<String, dynamic> json) =>
      _$GsTaskRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class GsTaskFriendActivitItem {
  String name;
  int uid;

  @JsonKey(name: 'sex', fromJson: Util.parseInt)
  int sex;

  String icon;
  int status;
  int deadline;
  String award;

  GsTaskFriendActivitItem(
      {this.name = '',
      this.uid = 0,
      this.sex = 0,
      this.icon = '',
      this.status = 0,
      this.deadline = 0,
      this.award = ''});

  factory GsTaskFriendActivitItem.fromJson(Map<String, dynamic> json) =>
      _$GsTaskFriendActivitItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class GsFriendActivitRsp extends BaseResponse {
  List<GsTaskFriendActivitItem> data;

  GsFriendActivitRsp({super.success, super.msg, required this.data});

  factory GsFriendActivitRsp.fromJson(Map<String, dynamic> json) =>
      _$GsFriendActivitRspFromJson(json);
}

class GsTaskRepo {
  static Future<GsTaskRsp> getGsTaskInfo(GsTaskType taskType, int rid) async {
    String url =
        '${System.domain}treattask/info?type=${taskType == GsTaskType.receptionTask ? 2 : 1}&rid=$rid';
    try {
      XhrResponse response = await Xhr.postJson(url, {'uid': '${Session.uid}'},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GsTaskRsp(msg: response.error.toString(), success: false);
      }
      Map res = response.response as Map;
      if (!Util.parseBool(res['success'])) {
        return GsTaskRsp(msg: Util.parseStr(res['msg']), success: false);
      }
      try {
        GsTaskRsp responseData =
            GsTaskRsp.fromJson(res as Map<String, dynamic>);

        return responseData;
      } catch (e) {
        return GsTaskRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GsTaskRsp(msg: e.toString(), success: false);
    }
  }
}

class GsTaskFriendActivitRepository
    extends LoadingMoreBase<GsTaskFriendActivitItem> {
  final BuildContext context;
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  GsTaskFriendActivitRepository(this.context);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}ruser/list?page=$page',
          throwOnError: true);
      GsFriendActivitRsp result =
          GsFriendActivitRsp.fromJson(response.value() as Map<String, dynamic>);

      if (page == 1) {
        clear();
      }

      for (var element in result.data) {
        add(element);
      }

      _hasMore = (result.data.length == 100 ? true : false);
      page++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }

    return isSuccess;
  }
}
