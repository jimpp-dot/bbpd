import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';

part 'add_friend_bean.g.dart';

@JsonSerializable(createToJson: false)
class RecommendFriendItem {
  String? name;
  String? icon;
  int uid;
  int sex;
  int rid;
  String? reason;

  @JsonKey(name: 'reason_color')
  String? reasonColor;

  int follow;

  @JsonKey(name: 'tag_info')
  RecommendFriendTagInfo? tagInfo;

  RecommendFriendItem(this.name, this.icon, this.uid, this.sex, this.rid,
      this.reason, this.reasonColor, this.follow, this.tagInfo);

  factory RecommendFriendItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendFriendItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendFriendTagInfo {
  String? show;

  @JsonKey(name: 'bg')
  List<String> bgColors;

  @JsonKey(name: 'acute_icon')
  String? acuteIcon;

  RecommendFriendTagInfo(this.show, this.bgColors, this.acuteIcon);

  factory RecommendFriendTagInfo.fromJson(Map<String, dynamic> json) =>
      _$RecommendFriendTagInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendFriendRsp extends BaseResponse {
  List<RecommendFriendItem> data;

  RecommendFriendRsp({super.success, super.msg, required this.data});

  factory RecommendFriendRsp.fromJson(Map<String, dynamic> json) =>
      _$RecommendFriendRspFromJson(json);
}

class RecommendFriendsSource extends LoadingMoreBase<RecommendFriendItem> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  RecommendFriendsSource();

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      String url = '${System.domain}friend/recommend?page=$page&version=1';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      RecommendFriendRsp result =
          RecommendFriendRsp.fromJson(response.value() as Map<String, dynamic>);

      if (page == 1) {
        clear();
      }

      for (var element in result.data) {
        add(element);
      }

      _hasMore = (result.data.length == 20 ? true : false);
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
