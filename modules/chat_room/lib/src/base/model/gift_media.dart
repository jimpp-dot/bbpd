import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/k.dart' as BaseK;

part 'gift_media.g.dart';

enum GiftMediaType {
  image, //图片礼物
  video, //视频礼物
}

enum CommodityType {
  coupon, //券
  gift, //礼物
}

@JsonSerializable(createToJson: false)
class MediaItem {
  int id;

  int uid;

  String image;

  @JsonKey(name: 'vedio')
  String? video;

  int status;

  @JsonKey(fromJson: MediaItem.parseType)
  GiftMediaType type;

  bool checked;

  MediaItem(
      this.id, this.uid, this.image, this.status, this.type, this.checked);

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  static GiftMediaType parseType(dynamic type) {
    if (type == 'vedio') {
      return GiftMediaType.video;
    } else {
      return GiftMediaType.image;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class EmptyMediaItem extends MediaItem {
  EmptyMediaItem() : super(0, 0, '', 0, GiftMediaType.image, false);
}

@JsonSerializable(createToJson: false)
class Commodity {
  @JsonKey(fromJson: Util.parseInt)
  final int id;

  @JsonKey(fromJson: Util.parseInt)
  final int cid;

  @JsonKey(fromJson: Commodity.parseType)
  final CommodityType type;

  @JsonKey(name: 'duction_money', fromJson: Util.parseInt)
  final int ductionMoney;

  @JsonKey(name: 'only_newpay', fromJson: Util.parseBool)
  final bool onlyNewPay;

  @JsonKey(name: 'state', fromJson: Util.parseBool)
  final bool recharged;

  Commodity(this.id, this.cid, this.type, this.ductionMoney, this.onlyNewPay,
      this.recharged);

  factory Commodity.fromJson(Map<String, dynamic> json) =>
      _$CommodityFromJson(json);

  static CommodityType parseType(dynamic type) {
    if (type == 'coupon') {
      return CommodityType.coupon;
    } else {
      return CommodityType.gift;
    }
  }

  static String typeToString(CommodityType? type) {
    if (type == CommodityType.coupon) {
      return 'coupon';
    } else {
      return 'gift';
    }
  }
}

@JsonSerializable(createToJson: false)
class GiftMediaInfo extends MediaItem {
  @JsonKey(fromJson: Util.parseInt)
  int rid;

  @JsonKey(name: 'lock', fromJson: GiftMediaInfo.parseLock)
  bool isLock;

  @JsonKey(name: 'gift_id', fromJson: Util.parseInt)
  int giftId;

  @JsonKey(name: 'gift_name')
  String giftName;

  @JsonKey(name: 'gift_price', fromJson: Util.parseInt)
  int giftPrice;

  @JsonKey(name: 'gift_icon')
  String giftIcon;

  @JsonKey(name: 'img_id', fromJson: Util.parseInt)
  int imageId;

  Commodity? commodity;

  GiftMediaInfo(
      int id,
      int uid,
      String image,
      int status,
      GiftMediaType type,
      bool checked,
      this.rid,
      this.isLock,
      this.giftId,
      this.giftName,
      this.giftPrice,
      this.giftIcon,
      this.imageId,
      this.commodity)
      : super(id, uid, image, status, type, checked);

  factory GiftMediaInfo.fromJson(Map<String, dynamic> json) =>
      _$GiftMediaInfoFromJson(json);

  factory GiftMediaInfo.fromMessage(MessageContent message) {
    Log.d('message.extra: ${message.extra}');
    GiftMediaInfo giftMediaInfo = GiftMediaInfo.fromJson(message.extra
            ?.map((key, value) => MapEntry<String, dynamic>('$key', value)) ??
        {});
    giftMediaInfo.type = MediaItem.parseType(message.extra?['image_type']);

    return giftMediaInfo;
  }

  static bool parseLock(dynamic value) {
    return Util.parseBool(value, true);
  }
}

@JsonSerializable(createToJson: false)
class MediaListRsp extends BaseResponse with PageListResponse<MediaItem> {
  @JsonKey(defaultValue: [])
  List<MediaItem>? data;

  MediaListRsp({super.success, super.msg, this.data});

  factory MediaListRsp.fromJson(Map<String, dynamic> json) =>
      _$MediaListRspFromJson(json);

  @override
  List<MediaItem>? get items => data;
}

@JsonSerializable(createToJson: false)
class GiftMediaInfoListRsp extends BaseResponse
    with PageListResponse<GiftMediaInfo> {
  @JsonKey(defaultValue: [])
  List<GiftMediaInfo>? data;

  int? money;

  GiftMediaInfoListRsp({super.success, super.msg, this.data, this.money});

  factory GiftMediaInfoListRsp.fromJson(Map<String, dynamic> json) =>
      _$GiftMediaInfoListRspFromJson(json);

  @override
  List<GiftMediaInfo>? get items => data;
}

class GiftMediaRepository {
  static Future<MediaListRsp> getMediaList(int page) async {
    String url = '${System.domain}screen/all?page=$page';
    try {
      XhrResponse response = await Xhr.postJson(url, {'uid': '${Session.uid}'},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MediaListRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return MediaListRsp(msg: res['msg'], success: false);
      }
      try {
        MediaListRsp responseData =
            MediaListRsp.fromJson(res as Map<String, dynamic>);

        if (page == 1) {
          if (responseData.data != null && responseData.data!.isNotEmpty) {
            responseData.data!.insert(0, EmptyMediaItem());
          }
        }
        return responseData;
      } catch (e) {
        return MediaListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MediaListRsp(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> addMedia(
      String type, String mediaUrl, String cover) async {
    String url = '${System.domain}screen/add?uid=${Session.uid}';
    try {
      Map<String, String> params = {
        'uid': '${Session.uid}',
        'image': mediaUrl,
        'type': type,
      };
      if (type == 'video') {
        params['type'] = 'vedio';
        params['image'] = cover;
        params['vedio'] = mediaUrl;
      }
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> sendGiftMedia(
      List<int> mediaIds, int giftId, int rid) async {
    String url = '${System.domain}screen/send?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': '$rid',
            'img_ids': mediaIds.join(','),
            'gid': '$giftId',
          },
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<GiftMediaInfoListRsp> getGiftMediaInfoList(
      List<int> mediaIds) async {
    String url = '${System.domain}go/yy/screen/query?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'img_ids': mediaIds.join(',')},
          formatJson: true, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GiftMediaInfoListRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return GiftMediaInfoListRsp(msg: res['msg'], success: false);
      }
      try {
        GiftMediaInfoListRsp responseData =
            GiftMediaInfoListRsp.fromJson(res as Map<String, dynamic>);

        return responseData;
      } catch (e) {
        return GiftMediaInfoListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GiftMediaInfoListRsp(msg: e.toString(), success: false);
    }
  }

  static Future<GiftMediaInfoListRsp> getGiftMediaInfoListByRoom(
      int rid, int page) async {
    String url = '${System.domain}screen/space?uid=${Session.uid}&page=$page';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': '$rid',
          },
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GiftMediaInfoListRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return GiftMediaInfoListRsp(msg: res['msg'], success: false);
      }
      try {
        GiftMediaInfoListRsp responseData =
            GiftMediaInfoListRsp.fromJson(res as Map<String, dynamic>);

        return responseData;
      } catch (e) {
        return GiftMediaInfoListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return GiftMediaInfoListRsp(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> delMedia(
      String type, List<int> mediaIds, int rid) async {
    String url = '${System.domain}screen/del';
    if (type == 'room') {
      url = '${System.domain}screen/delroomimage';
    }
    try {
      Map<String, String> params = {
        type == 'room' ? 'ids' : 'img_ids': mediaIds.join(','),
        if (type == 'room') 'rid': '$rid',
      };
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }
}

class GiftMediaModel with ChangeNotifier {
  Map<int, GiftMediaInfo?> giftMediaData = {};
  Set<int> loadingIds = {};
  int availableMoney = 0;

  GiftMediaModel() {
    eventCenter.addListener(EventConstant.EventUserMoneyChange, _onMoneyChange);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        EventConstant.EventUserMoneyChange, _onMoneyChange);
  }

  void _onMoneyChange(String type, dynamic field) {
    reload();
  }

  void reload() {
    if (giftMediaData.keys.isEmpty) return;
    List<int> cachedIds = giftMediaData.keys.toList();

    loadingIds.addAll(cachedIds);
    GiftMediaRepository.getGiftMediaInfoList(cachedIds).then((rsp) {
      if (!(rsp.success == true) || rsp.data == null || rsp.data!.isEmpty)
        return;
      for (var _ in rsp.data!) {
        loadingIds.remove(_.id);
        giftMediaData[_.id] = _;
      }
      availableMoney = rsp.money ?? 0;
      notifyListeners();
    });
  }

  void queryGiftMediaInfo(int giftMediaId, {bool reload = false}) {
    if (giftMediaData[giftMediaId] != null && !reload) return;

    if (!loadingIds.add(giftMediaId)) return;

    GiftMediaRepository.getGiftMediaInfoList([giftMediaId]).then((rsp) {
      loadingIds.remove(giftMediaId);

      if (!(rsp.success == true) || rsp.data == null || rsp.data!.isEmpty)
        return;

      giftMediaData[giftMediaId] =
          rsp.data!.firstWhereOrNull((_) => _.id == giftMediaId);
      availableMoney = rsp.money ?? 0;
      notifyListeners();
    });
  }

  static void previewMediaItem(BuildContext context, MediaItem mediaItem) {
    if (mediaItem.type == GiftMediaType.video &&
        mediaItem.video != null &&
        mediaItem.video!.isNotEmpty) {
      IVideoManager videoManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_VIDEO);
      videoManager.playVideo(
        context,
        videoList: [
          VideoInfo(
            path: mediaItem.video,
            cover: mediaItem.image,
          )
        ],
        index: 0,
      );
    } else if (mediaItem.type == GiftMediaType.image &&
        mediaItem.image.isNotEmpty) {
      ImagePreviewScreen.showImagePreviewScreen(
        context,
        images: [
          ImagePreviewBean(url: '${System.imageDomain}${mediaItem.image}')
        ],
        index: 0,
      );
    }
  }

  Future<bool?> _showConfirmDialog(
      BuildContext context, GiftMediaInfo giftMediaInfo) async {
    String mediaType = giftMediaInfo.type == GiftMediaType.video
        ? BaseK.K.base_video
        : BaseK.K.base_image;

    String msg = '';
    if (giftMediaInfo.commodity?.type == CommodityType.gift) {
      msg = K.room_gift_media_unlock_msg(
          [mediaType, '${K.room_one_unit}${giftMediaInfo.giftName}']);
    } else {
      int price = giftMediaInfo.giftPrice;
      if (giftMediaInfo.commodity?.type == CommodityType.coupon) {
        price = giftMediaInfo.giftPrice -
            (giftMediaInfo.commodity?.ductionMoney ?? 0);
      }
      String priceStr =
          '${MoneyConfig.moneyNum(price)}${MoneyConfig.moneyName}';
      msg = K.room_gift_media_unlock_msg([mediaType, priceStr]);
    }

    return showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            content: msg,
          );
        });
  }

  Future<void> payGiftMedia(BuildContext context, GiftMediaInfo giftMediaInfo,
      ChatRoomData room) async {
    bool onlyNewPay = giftMediaInfo.commodity?.onlyNewPay ?? false;
    int ductionMoney = giftMediaInfo.commodity?.ductionMoney ?? 0;
    int totalPrice = giftMediaInfo.giftPrice;

    bool? result = await _showConfirmDialog(context, giftMediaInfo);
    if (!(result ?? false)) return;

    if (giftMediaInfo.commodity?.type == CommodityType.coupon) {
      if (!onlyNewPay && availableMoney + ductionMoney >= totalPrice) {
        _pay(context, 'available', giftMediaInfo, room);
      } else {
        _displayPayDialog(context, giftMediaInfo, onlyNewPay, room);
      }
    } else if (availableMoney >= totalPrice ||
        giftMediaInfo.commodity?.type == CommodityType.gift) {
      _pay(context, 'available', giftMediaInfo, room);
    } else {
      _displayPayDialog(context, giftMediaInfo, false, room);
    }
  }

  void _pay(BuildContext context, String? type, GiftMediaInfo giftMediaInfo,
      ChatRoomData room,
      {bool retryWithPayDialog = true}) {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    payManager.pay(
      context,
      key: 'gift',
      type: type ?? '',
      args: {
        'money': giftMediaInfo.giftPrice,
        'type': 'package',
        'params': {
          'rid': giftMediaInfo.rid,
          'uids': '${giftMediaInfo.uid}',
          'giftId': giftMediaInfo.giftId,
          'giftNum': 1,
          'imageId': giftMediaInfo.id,
          'price': giftMediaInfo.giftPrice,
          'cid': giftMediaInfo.commodity?.id ?? 0,
          'ctype': Commodity.typeToString(giftMediaInfo.commodity?.type),
          'duction_money': giftMediaInfo.commodity?.ductionMoney ?? 0,
          'version': 2,
          'num': 1,
          'gift_type': 'normal',
          'refer': '${room.refer}:room'
        }
      },
      onPayed: () {
        ChatRoomData? room0 = ChatRoomData.getInstance();
        Map<String, dynamic> properties = {
          'scene': 'room',
          'rid': giftMediaInfo.rid,
          'gift_name': giftMediaInfo.giftName,
          'gift_id': giftMediaInfo.giftId,
          'gift_price': giftMediaInfo.giftPrice,
          'gift_num': 1,
          'user_num': 1,
          'to_uid': giftMediaInfo.uid,
          'total_price': giftMediaInfo.giftPrice,
          'gift_type': 'normal',
          if (room0 != null) 'chat_room_type': room0.config?.type,
          if (room0 != null)
            'chat_room_property': room0.config?.property.toString(),
          if (room0 != null) 'chat_room_types': room0.config?.types.toString(),
          if (!Util.isNullOrEmpty(room0?.config?.typeName))
            'type_label': room0?.config?.typeName,
          if (!Util.isNullOrEmpty(room0?.config?.originalRFT))
            'room_factory_type': room0?.config?.originalRFT,
          if (!Util.isNullOrEmpty(room0?.config?.settlementChannel))
            'settlement_channel': room0?.config?.settlementChannel,
        };

        if (room0?.config?.game == Games.Wolf) {
          IWereWolfManager wereWolfManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_WERE_WOLF);
          properties['game_type'] = wereWolfManager.getGameType();
        }

        Tracker.instance.track(TrackEvent.send_gift, properties: properties);
        Fluttertoast.showToast(
            msg: R.string('reward_suc'), gravity: ToastGravity.BOTTOM);
        eventCenter.emit("Gift.SendSuccess");

        queryGiftMediaInfo(giftMediaInfo.id, reload: true);
      },
      onError: (_) {
        if (retryWithPayDialog)
          _displayPayDialog(context, giftMediaInfo, false, room);
      },
    );
  }

  void _displayPayDialog(BuildContext context, GiftMediaInfo? giftMediaInfo,
      bool onlyNewPay, ChatRoomData room) async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(
        context,
        (giftMediaInfo?.giftPrice ?? 0) -
            (giftMediaInfo?.commodity?.ductionMoney ?? 0));
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    //使用新支付券，toast提醒
    if (onlyNewPay &&
        result.value?.key == 'available' &&
        !(giftMediaInfo?.commodity?.recharged ?? false) &&
        (!Util.isAndroid || Util.isLocale)) {
      Toast.showCenter(context, R.string('please_recharge_first'));
      return;
    }

    _pay(
      context,
      result.value?.key,
      giftMediaInfo!,
      room,
      retryWithPayDialog: false,
    );
  }
}
