import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';

part 'room_task_light_rank.g.dart';

@JsonSerializable(createToJson: false)
class RoomLightUpUser {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  String name;
  String icon;

  ///用户是否全部完成任务
  @JsonKey(fromJson: Util.parseBool)
  bool complete;

  /// 连续点亮的天数
  @JsonKey(name: 'continuous_day', fromJson: Util.parseInt)
  int continuousDay;

  RoomLightUpUser(
      this.uid, this.name, this.icon, this.complete, this.continuousDay);

  factory RoomLightUpUser.fromJson(Map<String, dynamic> json) =>
      _$RoomLightUpUserFromJson(json);
}

class RoomRankListRepo extends LoadingMoreBase<RoomLightUpUser> {
  RoomRankListRepo(
      {required this.rid, required this.uid, required this.package});

  final int rid;
  final int uid;
  final String package;

  RoomLightUpUser? selfInfo;
  bool _hasMore = true;
  int _next = 1;

  Future<List<RoomLightUpUser>?> getList(int page) async {
    String url = '${System.domain}roomexp/lightuplist';
    final Map<String, dynamic> params = {
      "rid": rid,
      "uid": uid,
      "package": package,
    };

    try {
      XhrResponse response =
          await Xhr.getJson(url, params: params, throwOnError: true);
      Map res = response.response as Map;
      Map? info = res['data']['self_info'];
      if (info != null)
        selfInfo = RoomLightUpUser.fromJson(info as Map<String, dynamic>);

      List? list = res['data']['user_info'];
      List<RoomLightUpUser> userList = [];
      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            RoomLightUpUser friend =
                RoomLightUpUser.fromJson(item as Map<String, dynamic>);
            userList.add(friend);
          } catch (e) {
            Log.d(e);
          }
        }
      }
      return userList;
    } catch (e) {
      Log.d(e);
      return null;
      // return debugData();
    }
  }

  List<RoomLightUpUser> debugData() {
    Map<String, dynamic> info = {
      'uid': '1108773788',
      'continuous_day': 13,
      'name': 'angle',
      'complete': false,
      'icon':
          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2749310931,2588587605&fm=26&gp=0.jpg'
    };
    selfInfo = RoomLightUpUser.fromJson(info);
    return [for (var i = 0; i < 30; ++i) selfInfo!];
  }

  Future<bool> _loadList(int next, {bool first = false}) async {
    bool success = false;

    List<RoomLightUpUser>? list = await getList(next);
    if (list != null) {
      if (first) {
        clear();
      }
      addAll(list);
      _hasMore = false;
      // _hasMore = firendList.length == pageSize;
      // if (_hasMore) {
      //   _next += 1;
      // }
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _next = 1;
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  bool get hasMore {
    return _hasMore;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isLoadMore = isloadMoreAction;
    if (isLoadMore) {
      // 防止上拉回弹
      await Future.delayed(const Duration(milliseconds: 500));
    }
    return _loadList(isLoadMore ? _next : 1, first: !isLoadMore);
  }
}
