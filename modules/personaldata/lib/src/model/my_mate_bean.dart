import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_mate_bean.g.dart';

enum MarryEvent {
  MarryEventChangeRing,
  MarryEventSelectProposeRing,
  MarryEventReleaseRelation,
  MarryEventChangeBg,
}

@JsonSerializable()
class BlessListResponse extends BaseResponse with PageListResponse<BlessItem> {
  @override
  @JsonKey(name: 'data')
  List<BlessItem>? items;
  @override
  @JsonKey(name: 'more', fromJson: Util.parseBool)
  bool hasMore;

  BlessListResponse(
      {bool success = false, String msg = '', this.items, this.hasMore = false})
      : super(msg: msg, success: success);

  factory BlessListResponse.fromJson(Map<String, dynamic> json) =>
      _$BlessListResponseFromJson(json);
}

@JsonSerializable()
class BlessItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(name: 'u_name', defaultValue: '')
  String name;
  @JsonKey(name: 'u_icon', defaultValue: '')
  String icon;
  @JsonKey(name: 'create_time', fromJson: Util.parseInt)
  int time;
  @JsonKey(name: 'gift_icon', defaultValue: '')
  String giftIcon;
  @JsonKey(name: 'gift_name', defaultValue: '')
  String giftName;
  @JsonKey(name: 'gift_num', fromJson: Util.parseInt)
  int giftCount;

  BlessItem(this.uid, this.name, this.icon, this.time, this.giftIcon,
      this.giftName, this.giftCount);

  factory BlessItem.fromJson(Map<String, dynamic> json) =>
      _$BlessItemFromJson(json);
}

@JsonSerializable()
class MessageListResponse extends BaseResponse
    with PageListResponse<MessageItem> {
  @override
  @JsonKey(name: 'data')
  List<MessageItem>? items;

  MessageListResponse({
    bool success = false,
    String msg = '',
    this.items,
  }) : super(msg: msg, success: success);

  factory MessageListResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageListResponseFromJson(json);
}

@JsonSerializable()
class MessageItem {
  @JsonKey(name: 'id', fromJson: Util.parseInt)
  int msgId;
  @JsonKey(fromJson: Util.parseInt)
  int mid;
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(defaultValue: '')
  String icon;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String message;
  @JsonKey(name: 'create_time', fromJson: Util.parseInt)
  int time;

  MessageItem(this.msgId, this.mid, this.uid, this.icon, this.name,
      this.message, this.time);

  factory MessageItem.fromJson(Map<String, dynamic> json) =>
      _$MessageItemFromJson(json);
}

@JsonSerializable()
class RelationItem {
  @JsonKey(name: 'img_bg', defaultValue: '')
  String bgImg;

  @JsonKey(name: 'has_wedding', fromJson: Util.parseInt)
  int hasWedding; // 0未定 1已结婚 2已结婚，可再次预约婚礼

  RelationItem(this.bgImg, this.hasWedding);

  factory RelationItem.fromJson(Map<String, dynamic> json) =>
      _$RelationItemFromJson(json);
}

@JsonSerializable()
class MyMateResponse extends BaseResponse {
  @JsonKey(name: 'commodity_list')
  List<RingItem>? items;
  @JsonKey(name: 'commodity')
  RingItem? currentRing;
  @JsonKey(name: 'degree', fromJson: Util.parseInt)
  int loveIndex;
  @JsonKey(name: 'wish', fromJson: Util.parseInt)
  int blessIndex;
  @JsonKey(name: 'relation_day', fromJson: Util.parseInt)
  int loveDays;
  @JsonKey(name: 'profile')
  ProfileItem? user1;
  @JsonKey(name: 't_profile')
  ProfileItem? user2;
  @JsonKey(name: 'relation')
  RelationItem? relationItem;
  @JsonKey(fromJson: Util.parseInt)
  int code;
  @JsonKey(name: 'is_block', fromJson: Util.parseBool)
  bool isBlock;

  @JsonKey(name: 'wedding_status')
  int weddingStatus; //0:未预约 1:已预约 2:进行中 3:已结束

  @JsonKey(name: 'wedding_id')
  int wid;

  @JsonKey(name: 'can_hold_wedding', fromJson: Util.parseBool)
  bool canHoldWedding;

  ///结婚当事人
  bool isMarrier() {
    if (user1 != null && user1?.uid == Session.uid) {
      return true;
    }
    if (user2 != null && user2?.uid == Session.uid) {
      return true;
    }
    return false;
  }

  MyMateResponse(
      {bool success = false,
      String msg = '',
      this.items,
      this.loveIndex = 0,
      this.blessIndex = 0,
      this.loveDays = 0,
      this.currentRing,
      this.user1,
      this.user2,
      this.relationItem,
      this.code = 0,
      this.isBlock = false,
      this.weddingStatus = 0,
      this.wid = 0,
      this.canHoldWedding = false})
      : super(msg: msg, success: success);

  factory MyMateResponse.fromJson(Map<String, dynamic> json) =>
      _$MyMateResponseFromJson(json);
}

@JsonSerializable()
class MarryProposeResponse extends BaseResponse
    with PageListResponse<ProposeItem> {
  @override
  @JsonKey(name: 'list')
  List<ProposeItem>? items;

  @JsonKey(name: 'newest_letter_id', fromJson: Util.parseInt)
  final int loveLetterId;

  MarryProposeResponse(
      {bool success = false,
      String msg = '',
      this.items,
      this.loveLetterId = 0})
      : super(msg: msg, success: success);

  factory MarryProposeResponse.fromJson(Map<String, dynamic> json) =>
      _$MarryProposeResponseFromJson(json);
}

@JsonSerializable()
class ProfileItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String icon;
  @JsonKey(fromJson: Util.parseInt)
  int sex;

  ProfileItem(this.uid, this.name, this.icon, this.sex);

  factory ProfileItem.fromJson(Map<String, dynamic> json) =>
      _$ProfileItemFromJson(json);
}

@JsonSerializable()
class ProposeItem {
  @JsonKey(fromJson: Util.parseInt, name: 'tuid')
  int uid;
  @JsonKey(fromJson: Util.parseInt, name: 'degree')
  int intimacy;
  @JsonKey(fromJson: Util.parseBool, name: 'can_propose')
  bool canPropose;
  @JsonKey(name: 't_profile')
  ProfileItem? proposeProfile;

  ProposeItem(this.uid, this.intimacy, this.canPropose, this.proposeProfile);

  factory ProposeItem.fromJson(Map<String, dynamic> json) =>
      _$ProposeItemFromJson(json);
}

@JsonSerializable()
class MarryOurRingsResponse extends ProposeRingsResponse {
  MarryOurRingsResponse({
    bool success = false,
    String msg = '',
  }) : super(msg: msg, success: success);
  factory MarryOurRingsResponse.fromJson(Map<String, dynamic> json) =>
      _$MarryOurRingsResponseFromJson(json);
}

@JsonSerializable()
class MarryRingsResponse extends ProposeRingsResponse {
  @JsonKey(name: 'profile')
  ProfileItem? profileItem;
  @JsonKey(name: 't_profile')
  ProfileItem? tProfileItem;
  @JsonKey(name: 'commodity')
  RingItem? currentRing;
  MarryRingsResponse({
    bool success = false,
    String msg = '',
    this.profileItem,
    this.tProfileItem,
    this.currentRing,
  }) : super(msg: msg, success: success);
  factory MarryRingsResponse.fromJson(Map<String, dynamic> json) =>
      _$MarryRingsResponseFromJson(json);
}

@JsonSerializable()
class ProposeRingsResponse extends BaseResponse {
  @JsonKey(name: 'commodity_list')
  List<RingItem>? items;

  ProposeRingsResponse({
    bool success = false,
    String msg = '',
    this.items,
  }) : super(msg: msg, success: success);

  factory ProposeRingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposeRingsResponseFromJson(json);
}

@JsonSerializable()
class RingItem {
  @JsonKey(fromJson: Util.parseInt)
  int cid;
  @JsonKey(defaultValue: '')
  String type;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(name: 'image', defaultValue: '')
  String icon;
  @JsonKey(fromJson: Util.parseInt)
  int price;
  @JsonKey(name: 'num', fromJson: Util.parseInt)
  int? ownCount;
  @JsonKey(name: 'exist_ring_box', fromJson: Util.parseInt)
  int existInBox;
  @JsonKey(name: 'money_type', defaultValue: '')
  String moneyType;
  @JsonKey(name: 'image_bg')
  String imageBG;

  RingItem(this.cid, this.icon, this.price, this.type, this.name,
      this.existInBox, this.moneyType, this.imageBG);

  factory RingItem.fromJson(Map<String, dynamic> json) =>
      _$RingItemFromJson(json);
}

class MyMateRepository {
  /// 祝福榜单
  static Future<BlessListResponse> getBlessGiftItems(int page, int mid) async {
    String url = '${System.domain}games/marry/wishList';
    try {
      Map<String, String> params = {'mid': '$mid', 'p': '$page'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BlessListResponse(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (!res['success'] ?? false) {
        return BlessListResponse(msg: res['msg'], success: false);
      }
      try {
        BlessListResponse responseData = BlessListResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return BlessListResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BlessListResponse(msg: e.toString(), success: false);
    }
  }

  /// 留言列表
  static Future<MessageListResponse> getMessageItems(int page, int mid) async {
    String url = '${System.domain}games/marry/msgList';
    try {
      Map<String, String> params = {'p': '$page', 'mid': '$mid'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MessageListResponse(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (!res['success'] ?? false) {
        return MessageListResponse(msg: res['msg'], success: false);
      }
      try {
        MessageListResponse responseData = MessageListResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return MessageListResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MessageListResponse(msg: e.toString(), success: false);
    }
  }

  /// 伴侣页数据
  static Future<MyMateResponse> getMyMateData(int mid) async {
    String url = '${System.domain}games/marry/myPartner';
    try {
      Map<String, String> params = {'mid': '$mid'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MyMateResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!res['success'] ?? false) {
        return MyMateResponse(
            msg: res['msg'], success: false, code: res['code']);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        MyMateResponse responseData = MyMateResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return MyMateResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MyMateResponse(msg: e.toString(), success: false);
    }
  }

  static Future<MarryRingsResponse> getMarryRingItems({int single = 0}) async {
    String url = '${System.domain}games/marry/ringList';
    try {
      Map<String, String> params = {'is_single': '$single'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MarryRingsResponse(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!res['success'] ?? false) {
        return MarryRingsResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        MarryRingsResponse responseData = MarryRingsResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return MarryRingsResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MarryRingsResponse(msg: e.toString(), success: false);
    }
  }

  static Future<MarryOurRingsResponse> getOurRingItems({int toUid = 0}) async {
    String url = '${System.domain}games/marry/weRingList';
    try {
      Map<String, String> params = {'to_uid': '$toUid'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MarryOurRingsResponse(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!res['success'] ?? false) {
        return MarryOurRingsResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        MarryOurRingsResponse responseData =
            MarryOurRingsResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return MarryOurRingsResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MarryOurRingsResponse(msg: e.toString(), success: false);
    }
  }

  static Future<bool> isInBlock(int uid) async {
    XhrResponse response = await Xhr.getJson(
      "${System.domain}block/is?uid=$uid",
      throwOnError: true,
    );

    if (response.error != null) {
      return false;
    }

    Map res = response.value();
    String block = (res != null ? response.value()['data'] : 'unblock');
    if ((block ?? 'unblock') == 'block') {
      return true;
    } else {
      return false;
    }
  }
}

class MarryProposeRepository {
  static const String KEY_LATEST_LOVE_LETTER_ID = 'key_latest_love_letter_id';
  static const String KEY_LOCAL_LOVE_LETTER_ID = 'key_local_love_letter_id';

  static shouldShowLoveLetterRedDot() {
    int localLoveLetterId = Config.getInt(KEY_LOCAL_LOVE_LETTER_ID, 0);
    int latestLoveLetterId = Config.getInt(KEY_LATEST_LOVE_LETTER_ID, 0);
    return latestLoveLetterId > localLoveLetterId;
  }

  static updateLoveLetterId() {
    Config.set(KEY_LOCAL_LOVE_LETTER_ID,
        '${Config.getInt(KEY_LATEST_LOVE_LETTER_ID, 0)}');
  }

  static Future<MarryProposeResponse> getProposeItems(int page) async {
    String url = '${System.domain}games/marry/choosePartner';
    try {
      Map<String, String> params = {'p': '$page'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MarryProposeResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!res['success'] ?? false) {
        return MarryProposeResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        MarryProposeResponse responseData = MarryProposeResponse.fromJson(data);
        Config.set(KEY_LATEST_LOVE_LETTER_ID, '${responseData.loveLetterId}');
        return responseData;
      } catch (e) {
        return MarryProposeResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MarryProposeResponse(msg: e.toString(), success: false);
    }
  }

  static Future<MarryProposeResponse> getKillerProposeItems(int page) async {
    String url = '${System.domain}games/relation/getRelationList';
    if (page >= 2) {
      return MarryProposeResponse(msg: '', success: true);
    }
    try {
      Map<String, String> params = {'p': '$page'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MarryProposeResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!res['success'] ?? false) {
        return MarryProposeResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        MarryProposeResponse responseData = MarryProposeResponse.fromJson(data);
        Config.set(KEY_LATEST_LOVE_LETTER_ID, '${responseData.loveLetterId}');
        return responseData;
      } catch (e) {
        return MarryProposeResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MarryProposeResponse(msg: e.toString(), success: false);
    }
  }

  static Future<ProposeRingsResponse> getProposeRingItems(
    int toUid,
  ) async {
    String url = '${System.domain}games/marrypropose/detail';
    try {
      Map<String, String> params = {'to_uid': '$toUid'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return ProposeRingsResponse(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!res['success'] ?? false) {
        return ProposeRingsResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        ProposeRingsResponse responseData = ProposeRingsResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return ProposeRingsResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return ProposeRingsResponse(msg: e.toString(), success: false);
    }
  }
}

enum MessagePermissionType { all, friend }

@JsonSerializable()
class LeaveMessageResponse extends BaseResponse {
  @JsonKey(name: 'data')
  MessageItem? item;

  LeaveMessageResponse({
    bool success = false,
    String msg = '',
    this.item,
  }) : super(msg: msg, success: success);

  factory LeaveMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveMessageResponseFromJson(json);
}

@JsonSerializable()
class SendRingResponse extends BaseResponse {
  @JsonKey(name: 'propose_id', fromJson: Util.parseInt)
  int proposeId;
  @JsonKey(name: 'to_uid', fromJson: Util.parseInt)
  int toUid;

  SendRingResponse(
      {bool success = false,
      String msg = '',
      this.proposeId = 0,
      this.toUid = 0})
      : super(msg: msg, success: success);

  factory SendRingResponse.fromJson(Map<String, dynamic> json) =>
      _$SendRingResponseFromJson(json);
}

@JsonSerializable()
class PermissionResponse extends BaseResponse {
  @JsonKey(name: 'limit_msg', fromJson: Util.parseInt)
  int limitMsg;

  PermissionResponse({
    bool success = false,
    String msg = '',
    this.limitMsg = 0,
  }) : super(msg: msg, success: success);

  factory PermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionResponseFromJson(json);
}

class MarryOperateRepository {
  static payForRing(
      BuildContext context, RingItem? item, VoidCallback onPayed) async {
    if (item?.moneyType == 'coin') {
      IPayManager payManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
      payManager.pay(
        context,
        key: 'coin-shop-buy',
        type: 'available',
        refer: 'shop',
        args: {
          'money': item?.price ?? 0,
          'type': 'coin-shop-buy',
          'params': {
            'num': 1,
            'cid': item?.cid ?? 0,
            'price': item?.price ?? 0,
            'version': 2,
            'gift_scene': 'shop'
          }
        },
        onPayed: onPayed,
      );
    } else if (item?.moneyType == 'bean') {
      IPayManager payManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
      payManager.pay(
        context,
        key: 'bean-shop-buy',
        type: 'available',
        refer: 'shop',
        args: {
          'money': item?.price ?? 0,
          'type': 'bean-shop-buy',
          'params': {
            'num': 1,
            'cid': item?.cid ?? 0,
            'price': item?.price ?? 0,
            'version': 2,
            'gift_scene': 'shop'
          }
        },
        onPayed: onPayed,
      );
    } else {
      IPayManager payManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
      int ringPrice = ((item?.price ?? 0) * 100).round();
      SheetCallback? result =
          await payManager.showRechargeSheet(context, ringPrice);
      if (result == null ||
          result.reason == SheetCloseReason.Active ||
          result.value?.key == IPayManager.pTRecharge) {
        return;
      }
      payManager.pay(
        context,
        key: 'shop-buy',
        type: result.value?.key ?? '',
        refer: 'shop',
        args: {
          'money': ringPrice,
          'type': 'shop-buy',
          'params': {
            'num': 1,
            'cid': item?.cid ?? 0,
            'price': ringPrice,
            'version': 2,
            'gift_scene': 'shop'
          }
        },
        onPayed: onPayed,
      );
    }
  }

  static Future<BaseResponse> canPropose(int toUid, int ringId) async {
    String url = '${System.domain}games/marrypropose/canSend';
    XhrResponse response = await Xhr.postJson(
        url, {'to_uid': '$toUid', 'cid': '$ringId'},
        throwOnError: false);
    return BaseResponseReturn(response);
  }

  static Future<BaseResponse> canChangeRing(int ringId) async {
    String url = '${System.domain}games/marry/canChangeRing';
    XhrResponse response =
        await Xhr.postJson(url, {'cid': '$ringId'}, throwOnError: false);
    return BaseResponseReturn(response);
  }

  static Future<SendRingResponse> sendPropose(int toUid, int ringId) async {
    String url = '${System.domain}games/marrypropose/send';
    XhrResponse response = await Xhr.postJson(
        url, {'to_uid': '$toUid', 'cid': '$ringId'},
        throwOnError: false);
    if (response.error != null) {
      Log.d(response.error.toString());
      return SendRingResponse(msg: response.error.toString(), success: false);
    }
    Map res = response.value();
    if (!res['success'] ?? false) {
      return SendRingResponse(msg: res['msg'], success: false);
    }
    try {
      Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
      data['success'] = true;
      SendRingResponse responseData = SendRingResponse.fromJson(data);
      return responseData;
    } catch (e) {
      return SendRingResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<BaseResponse> releaseRelationship(int tuid) async {
    String url = '${System.domain}games/marrypropose/break';
    XhrResponse response = await Xhr.postJson(
        url, {'to_uid': '$tuid', 'is_force': '0'},
        throwOnError: false);
    return BaseResponseReturn(response);
  }

  static Future<LeaveMessageResponse> leaveMessage(
      String content, int mid) async {
    String url = '${System.domain}games/marry/sendMsg';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'content': content, 'mid': '$mid}'},
          throwOnError: false);
      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (!res['success'] ?? false) {
        return LeaveMessageResponse(msg: res['msg'], success: false);
      }
      try {
        LeaveMessageResponse responseData = LeaveMessageResponse.fromJson(res);
        return responseData;
      } catch (e) {
        return LeaveMessageResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return LeaveMessageResponse(msg: e.toString(), success: false);
    }
  }

  /// 删除留言
  static Future<BaseResponse> deleteMessage(int msgId, int mid) async {
    String url = '${System.domain}games/marry/delMsg';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'mid': '$mid',
          'msgId': '$msgId',
        },
        throwOnError: false,
      );
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 穿戴戒指
  static Future<BaseResponse> wearRing(int ringId, {int single = 0}) async {
    String url = '${System.domain}games/marry/addRing';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'cid': '$ringId',
          'is_single': '$single',
        },
        throwOnError: false,
      );
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 更换戒指
  static Future<BaseResponse> changeRing(int ringId, {int single = 0}) async {
    String url = '${System.domain}games/marry/changeRing';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'cid': '$ringId',
          'is_single': '$single',
        },
        throwOnError: false,
      );
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<PermissionResponse> getMsgPermission(int mid) async {
    String url = '${System.domain}games/marry/getMsgLimit';
    try {
      Map<String, String> params = {'mid': '$mid'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return PermissionResponse(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!res['success'] ?? false) {
        return PermissionResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] as Map<String, dynamic>;
        data['success'] = true;
        return PermissionResponse.fromJson(data);
      } catch (e) {
        return PermissionResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return PermissionResponse(msg: e.toString(), success: false);
    }
  }

  /// 设置送礼权限
  static Future<BaseResponse> setSendGiftPermission(
      int mid, MessagePermissionType permissionType) async {
    String url = '${System.domain}games/marry/setMsgLimit';
    try {
      int permission = (permissionType == MessagePermissionType.all ? 0 : 1);
      Map<String, String> params = {'mid': '$mid', 'limit_msg': '$permission'};
      XhrResponse response = await Xhr.postJson(url, params);
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }
}

BaseResponse BaseResponseReturn(
  XhrResponse response,
) {
  if (response.error != null) {
    Log.d(response.error.toString());
    return BaseResponse(msg: response.error.toString(), success: false);
  }
  Map<String, dynamic> res = response.value() as Map<String, dynamic>;
  if (!(res['success'] ?? false)) {
    return BaseResponse(msg: res['msg'], success: false);
  }
  try {
    return BaseResponse.fromJson(res);
  } catch (e) {
    Log.d(e);
    return BaseResponse(
        msg: R.array('xhr_error_type_array')[6], success: false);
  }
}

class LoadingAlert {
  static DialogLoadingController? _loading;

  static void hideLoading() {
    if (_loading != null) {
      _loading!.close();
      _loading = null;
    }
  }

  static void showLoading(BuildContext context, {String message = ''}) async {
    if (_loading != null) {
      _loading!.setLabel(message);
      return;
    }

    _loading = DialogLoadingController();
    await _loading!
        .show(context: context, message: message, barrierDismissible: true);
  }
}
