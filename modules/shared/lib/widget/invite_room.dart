import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../src/pbModel/generated/banban_popup.pb.dart';

part 'invite_room.g.dart';

///新注册用户，引导进房弹窗
///redmine：https://redmine.iambanban.com/issues/6047
///蓝湖：https://lanhuapp.com/web/#/item/project/board/detail?pid=d53319ec-3039-442c-a4ce-3c01f01612bf&project_id=d53319ec-3039-442c-a4ce-3c01f01612bf&image_id=ff756c86-dd86-4838-a46a-0dc849c784f3
class InviteRoomDialog extends StatefulWidget {
  final InviteRoomData? inviteRoomData;
  final bool fromAccompany;
  final String? cancelText;
  final String? okText;
  final String? contentText;

  static bool isShow = false;

  const InviteRoomDialog(
      {super.key,
      this.inviteRoomData,
      this.fromAccompany = false,
      this.cancelText,
      this.okText,
      this.contentText});

  @override
  _InviteRoomDialogState createState() => _InviteRoomDialogState();

  static Future<void> show(BuildContext context, InviteRoomRsp resp) async {
    if (!Session.isLogined) return;
    if (resp.success != true) return;
    if (resp.data?.name.isEmpty ?? true) return;
    if (!InviteRoomRepository.isNew) return;
    if (InviteRoomRepository.isDismissTimeLimit) return;

    if (isShow) {
      return;
    }

    if (!resp.isNew) {
      Config.set('Invite_Room_Is_New_${Session.uid}', 'false');
      return;
    }

    bool? result = await DialogQueue.root.enqueue(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return InviteRoomDialog(
          inviteRoomData: resp.data,
          cancelText: resp.text?.cancel,
          okText: resp.text?.ok,
          contentText: resp.text?.content,
        );
      },
    );

    String configKey = 'Invite_Room_Dismiss_Time_${Session.uid}';
    DateTime dismissTime = DateTime.now();
    if (result ?? false) {
      //进房
      Config.set(configKey, '${DateTime.now().millisecondsSinceEpoch}');
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, resp.data?.rid ?? 0,
          refer: 'new_pop');
    } else {
      //拒绝邀请后，当天不再弹窗
      String refuseDayKey = 'Invite_Room_Refuse_Time_${Session.uid}';
      String lastRefuseDay = Config.get(refuseDayKey, '');
      if (lastRefuseDay ==
          '${dismissTime.year}-${dismissTime.month}-${dismissTime.day}') {
        /// 当天已经拒绝过，第二次拒绝后当天不再弹窗
        DateTime time = DateTime(
            dismissTime.year, dismissTime.month, dismissTime.day, 23, 59);
        Config.set(configKey, '${time.millisecondsSinceEpoch}');
      } else {
        /// 当天第一次拒绝，只做普通的时间记录
        Config.set(configKey, '${DateTime.now().millisecondsSinceEpoch}');

        /// 记录拒绝时间(天)
        Config.set(refuseDayKey,
            '${dismissTime.year}-${dismissTime.month}-${dismissTime.day}');
      }
    }

    isShow = false;
  }

  static Future<void> showFromAccompany(
      BuildContext context, InviteRoomData inviteRoomData) async {
    if (!Session.isLogined) return;

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);

    if (roomManager.chatRoomDataExists()) {
      /// 正在房间不展示
      return;
    }

    if (isShow) {
      return;
    }

    bool? result = await DialogQueue.root.enqueue(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return InviteRoomDialog(
            inviteRoomData: inviteRoomData, fromAccompany: true);
      },
    );
    if (result ?? false) {
      //进房
      roomManager.openChatRoomScreenShow(context, inviteRoomData.rid,
          refer: 'invite_pop');
    }

    isShow = false;
  }
}

class _InviteRoomDialogState extends State<InviteRoomDialog> {
  @override
  void initState() {
    super.initState();
    InviteRoomDialog.isShow = true;
    if (widget.fromAccompany) {
      Tracker.instance.track(TrackEvent.invite_pop_show, properties: {
        'refer': 'business_1by1',
        'to_uid': widget.inviteRoomData?.uid,
        'rid': widget.inviteRoomData?.rid
      });
    } else {
      Tracker.instance.track(TrackEvent.new_pop_show, properties: {
        'to_uid': widget.inviteRoomData?.uid,
        'rid': widget.inviteRoomData?.rid,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.typeName))
          'type_label': widget.inviteRoomData?.typeName,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.roomFactoryType))
          'room_factory_type': widget.inviteRoomData?.roomFactoryType,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.settlementChannel))
          'settlement_channel': widget.inviteRoomData?.settlementChannel,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.roomFactoryType))
          'event_room_factory_type': widget.inviteRoomData?.roomFactoryType,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.channelType))
          'channel_type': widget.inviteRoomData?.channelType,
      });
    }
  }

  @override
  void dispose() {
    InviteRoomDialog.isShow = false;
    super.dispose();
  }

  Widget _buildIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        CommonAvatar(
          path: widget.inviteRoomData?.icon,
          shape: BoxShape.circle,
          size: 90,
          onTap: onPositive,
        ),
        const SoundEffectWidget(
          isSpeaking: true,
          width: 90,
          aniColor: null,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        _buildIcon(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LimitedBox(
              maxWidth: 170,
              child: Text(
                widget.inviteRoomData?.name ?? '',
                maxLines: 1,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            if (Util.parseInt(widget.inviteRoomData?.sex) > 0) ...[
              const SizedBox(
                width: 4,
              ),
              UserSexAndAgeWidget(
                sex: widget.inviteRoomData?.sex ?? 0,
                age: widget.inviteRoomData?.age ?? 0,
                width: 31,
                height: 14,
              )
            ]
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          Util.validStr(widget.contentText)
              ? widget.contentText!
              : K.base_invite_room_dialog_msg,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 12,
        ),
        if (widget.inviteRoomData?.distance != null &&
            widget.inviteRoomData!.distance.isNotEmpty)
          Text(widget.inviteRoomData!.distance,
              style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ConfirmDialog(
        contentBuilder: (context) {
          return _buildContent();
        },
        negativeButton: NegativeButton(
          text: Util.validStr(widget.cancelText)
              ? widget.cancelText
              : K.base_invite_room_dialog_cancel,
          onPressed: () {
            if (widget.fromAccompany) {
              Tracker.instance.track(TrackEvent.invite_pop_click, properties: {
                'button': 'refuse',
                'refer': 'business_1by1',
              });
            } else {
              Tracker.instance.track(TrackEvent.new_pop_click, properties: {
                'button': 'refuse',
                'rid': widget.inviteRoomData?.rid ?? 0,
                'to_uid': widget.inviteRoomData?.uid ?? 0,
                if (!Util.isNullOrEmpty(widget.inviteRoomData?.typeName))
                  'type_label': widget.inviteRoomData?.typeName,
                if (!Util.isNullOrEmpty(widget.inviteRoomData?.roomFactoryType))
                  'room_factory_type': widget.inviteRoomData?.roomFactoryType,
                if (!Util.isNullOrEmpty(
                    widget.inviteRoomData?.settlementChannel))
                  'settlement_channel':
                      widget.inviteRoomData?.settlementChannel,
                if (!Util.isNullOrEmpty(widget.inviteRoomData?.roomFactoryType))
                  'event_room_factory_type':
                      widget.inviteRoomData?.roomFactoryType,
                if (!Util.isNullOrEmpty(widget.inviteRoomData?.channelType))
                  'channel_type': widget.inviteRoomData?.channelType,
              });
            }

            reportUserOp(false);

            Navigator.of(context).pop(false);
          },
        ),
        positiveButton: PositiveButton(
          onPressed: onPositive,
          useGradientBg: true,
          gradientBg: R.color.mainBrandGradientColors,
          needSweepAni: true,
          child: buildPositive(),
        ),
      ),
    );
  }

  void onPositive() {
    if (widget.fromAccompany) {
      Tracker.instance.track(TrackEvent.invite_pop_click, properties: {
        'button': 'enter_room',
        'refer': 'business_1by1',
        'rid': widget.inviteRoomData?.rid ?? 0,
        'to_uid': widget.inviteRoomData?.uid ?? 0,
      });
    } else {
      Tracker.instance.track(TrackEvent.new_pop_click, properties: {
        'button': 'enter_room',
        'rid': widget.inviteRoomData?.rid ?? 0,
        'to_uid': widget.inviteRoomData?.uid ?? 0,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.typeName))
          'type_label': widget.inviteRoomData?.typeName,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.roomFactoryType))
          'room_factory_type': widget.inviteRoomData?.roomFactoryType,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.settlementChannel))
          'settlement_channel': widget.inviteRoomData?.settlementChannel,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.roomFactoryType))
          'event_room_factory_type': widget.inviteRoomData?.roomFactoryType,
        if (!Util.isNullOrEmpty(widget.inviteRoomData?.channelType))
          'channel_type': widget.inviteRoomData?.channelType,
      });
    }
    reportUserOp(true);
    Navigator.of(context).pop(true);
  }

  Widget buildPositive() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img('ic_invite_room.webp',
            width: 15, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
        const SizedBox(
          width: 2,
        ),
        Text(
          Util.validStr(widget.okText)
              ? widget.okText!
              : K.base_invite_room_dialog_sure,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  void reportUserOp(bool enterRoom) async {
    if ((widget.inviteRoomData?.id ?? 0) > 0) {
      try {
        String url =
            "${System.domain}go/yy/report/roomPopClick?id=${widget.inviteRoomData?.id}&op=${enterRoom ? 2 : 1}";
        await Xhr.post(url, {}, throwOnError: true, pb: true);
      } catch (e) {
        Log.d('reportUserOp error: $e');
      }
    }
  }
}

@JsonSerializable()
class InviteRoomData {
  int uid;
  int rid;
  int age;
  int sex;
  String name;
  String icon;
  String distance;

  @JsonKey(name: 'type_label')
  String typeName;

  @JsonKey(name: 'settlement_channel')
  String settlementChannel;

  @JsonKey(name: 'room_factory_type')
  String roomFactoryType;

  @JsonKey(name: 'channel_type')
  String channelType;

  int id;

  InviteRoomData(
      {this.uid = 0,
      this.rid = 0,
      this.age = 0,
      this.sex = 0,
      this.icon = '',
      this.name = '',
      this.distance = '',
      this.typeName = '',
      this.settlementChannel = '',
      this.roomFactoryType = '',
      this.channelType = '',
      this.id = 0});

  factory InviteRoomData.fromJson(Map<String, dynamic> json) =>
      _$InviteRoomDataFromJson(json);
}

@JsonSerializable()
class InviteText {
  String cancel;
  String ok;
  String content;

  InviteText({this.cancel = '', this.ok = '', this.content = ''});

  factory InviteText.fromJson(Map<String, dynamic> json) =>
      _$InviteTextFromJson(json);
}

@JsonSerializable()
class InviteRoomRsp extends BaseResponse {
  @JsonKey(name: 'is_new', defaultValue: true)
  bool isNew = false;

  InviteRoomData? data;

  InviteText? text;

  InviteRoomRsp({super.msg, super.success, this.data, this.text});

  factory InviteRoomRsp.fromJson(Map<String, dynamic> json) =>
      _$InviteRoomRspFromJson(json);
}

class InviteRoomRepository {
  static Future<int> getInviteRoomId() async {
    // 新不夜暂时移除此逻辑
    return 0;
    if (!Session.isLogined) return 0;

    try {
      String url = '${System.domain}go/yy/popup/room';
      XhrResponse response = await Xhr.get(url,
          pb: true,
          queryParameters: {'uid': '${Session.uid}', 'mac': DeviceInfo.mac},
          throwOnError: false);
      ResPopupRoom data = ResPopupRoom.fromBuffer(response.bodyBytes);
      if (data.success != true) {
        return 0;
      }
      InviteRoomRsp responseData =
          InviteRoomRsp.fromJson(data.toProto3Json() as Map<String, dynamic>);
      return responseData.data?.rid ?? 0;
    } catch (e) {
      return 0;
    }
  }

  /// 是否为新用户
  static bool get isNew =>
      'true' == Config.get('Invite_Room_Is_New_${Session.uid}', 'true');

  /// 弹窗时间是否受限
  static bool get isDismissTimeLimit {
    String configKey = 'Invite_Room_Dismiss_Time_${Session.uid}';
    int lastDismiss = Util.parseInt(Config.get(configKey), 0);
    if (lastDismiss > 0) {
      DateTime lastDismissTime =
          DateTime.fromMillisecondsSinceEpoch(lastDismiss);
      DateTime now = DateTime.now();
      if (now.isBefore(lastDismissTime) ||
          now.difference(lastDismissTime).inMinutes <= 10) return true;
    }
    return false;
  }
}
