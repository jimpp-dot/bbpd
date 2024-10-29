import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';

part 'new_user_transfer_bean.g.dart';

@JsonSerializable()
class NewUserTransfer {
  @JsonKey(fromJson: Util.parseInt)
  int uid;

  @JsonKey(fromJson: Util.parseStr)
  String name;

  @JsonKey(fromJson: Util.parseInt)
  int sex;

  @JsonKey(fromJson: Util.parseStr)
  String icon;

  @JsonKey(fromJson: Util.parseInt)
  int age;

  @JsonKey(name: 'level', fromJson: Util.parseInt)
  int vipLevel;

  @JsonKey(name: 'online_status', fromJson: Util.parseInt)
  int isOnline;

  @JsonKey(name: 'regist_text', fromJson: Util.parseStr)
  String registText;

  @JsonKey(name: 'online_text', fromJson: Util.parseStr)
  String onlineText;

  @JsonKey(name: 'rookie_tag')
  RookieTag? rookieTag;

  @JsonKey(name: 'new_noble', fromJson: Util.parseBool)
  bool isNewNoble; //新贵

  bool selected = false;

  NewUserTransfer(
      this.uid,
      this.name,
      this.sex,
      this.icon,
      this.age,
      this.vipLevel,
      this.isOnline,
      this.registText,
      this.onlineText,
      this.rookieTag,
      this.isNewNoble);

  factory NewUserTransfer.fromJson(Map<String, dynamic> json) =>
      _$NewUserTransferFromJson(json);

  Sex get userSex {
    if (sex == 1) {
      return Sex.Male;
    } else {
      return Sex.Female;
    }
  }
}

@JsonSerializable()
class RookieTag {
  @JsonKey(name: 'seven_new', fromJson: Util.parseInt)
  int sevenNew;

  @JsonKey(name: 'pay_level', fromJson: Util.parseInt)
  int payLevel;

  RookieTag(this.sevenNew, this.payLevel);

  factory RookieTag.fromJson(Map<String, dynamic> json) =>
      _$RookieTagFromJson(json);
}

class NewUserTransferListRsp extends BaseResponse {
  final List<NewUserTransfer>? list;
  final bool more;

  NewUserTransferListRsp(
      {super.success, super.msg, this.list, this.more = false});

  factory NewUserTransferListRsp.fromJson(Map<String, dynamic> json) {
    bool success = false;
    String msg = '';
    List<NewUserTransfer> resultList = [];
    bool more = false;
    try {
      success = Util.parseBool(json['success']);
      msg = Util.notNullStr(json['msg']);
      if (success) {
        Map? data = json['data'];
        more = Util.parseBool(data?['more']);
        (data?['list'] as List?)?.forEach((element) {
          NewUserTransfer ranking = NewUserTransfer.fromJson(element);
          resultList.add(ranking);
        });
      }
    } catch (e) {
      Log.d(e);
    }
    NewUserTransferListRsp rsp = NewUserTransferListRsp(
        success: success, msg: msg, list: resultList, more: more);
    return rsp;
  }
}

class NewUserTransferRepository extends LoadingMoreBase<NewUserTransfer> {
  final BuildContext context;
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  NewUserTransferRepository(this.context);

  @override
  bool get hasMore => (_hasMore && length < 300) || forceRefresh;

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
      XhrResponse response = await Xhr.getJson(
          '${System.domain}transfer/list?page=$page&version=1',
          throwOnError: true);
      NewUserTransferListRsp result = NewUserTransferListRsp.fromJson(
          response.value() as Map<String, dynamic>);
      if (page == 1) {
        clear();
      }
      result.list?.forEach((element) {
        add(element);
      });
      _hasMore = result.more;
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
