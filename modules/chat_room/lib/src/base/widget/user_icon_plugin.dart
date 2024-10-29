import 'dart:async';
import 'dart:typed_data';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/mic_punish_data.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/base/punish/widget/punish_stick_widget.dart';
import 'package:chat_room/src/biz_plugin/bomb/model/digit_bomb_info_model.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../protobuf/generated/impress_tag.pb.dart';
import 'mic_award_name_anim.dart';

// 麦位插件，提供 [buildWidgets] 和 [buildUserIcon] 两个方法分别覆盖
/// [UserIcon] 的 build 和 buildUserIcon 的行为
class UserIconPlugin {
  late BuildContext context;
  late double size;
  late ChatRoomData room;
  late RoomPosition roomPosition;
  VoidCallback? refresh;

  void init({
    required BuildContext context,
    required double size,
    required ChatRoomData room,
    required RoomPosition roomPosition,
    VoidCallback? refresh,
  }) {
    this.context = context;
    this.size = size;
    this.room = room;
    this.roomPosition = roomPosition;
    this.refresh = refresh;
  }

  void onInitState() {}

  void onDispose() {}

  List<Widget> buildWidgets() => <Widget>[];

  Widget? buildUserIcon({double borderWidth = 1}) => null;

  /// 插件是否生效
  bool get effect => room.pluginList?.contains(name) ?? false;

  /// 插件名
  String get name => '';

  void refreshUI() {
    refresh?.call();
  }

  static const String punish = 'punish'; // 惩罚
  static const String punishV2 = 'punish_v2'; // 变猪惩罚
  static const String digitbomb = 'digitbomb'; // 数字炸弹
  static const String suicide = 'suicide'; // 倒霉蛋
  static const String awardTitle = 'awardTitle'; // 冠名动效
  static const String hatPlay = 'hat_play'; // 抢帽子
  static const String micRelation = 'mic_relation'; // 麦上关系
  static const String impressTag = 'impress_tag'; // 印象标记
}

/// 数字炸弹游戏插件
class BombPlugin extends UserIconPlugin {
  DigitBombInfoData? _bombData;

  @override
  void onInitState() {
    super.onInitState();
    room.addListener(RoomConstant.Event_Digit_Bomb_Sync, _onSyncDigitBomb);
  }

  @override
  void onDispose() {
    room.removeListener(RoomConstant.Event_Digit_Bomb_Sync, _onSyncDigitBomb);
    super.onDispose();
  }

  @override
  String get name => UserIconPlugin.digitbomb;

  _onSyncDigitBomb(String type, Object? data) {
    if (data is DigitBombInfoData) {
      _bombData = data;
      refreshUI();
    }
  }

  @override
  List<Widget> buildWidgets() {
    List<Widget> res = <Widget>[];
    if (_bombData == null) return res;

    bool showBoom = _bombData!.player == roomPosition.uid &&
        roomPosition.uid != 0 &&
        (_bombData!.status == DigitBombStatus.playing || _bombData!.status == DigitBombStatus.bomb);
    if (showBoom) {
      bool isBomb = _bombData!.status == DigitBombStatus.bomb;
      if (isBomb) {
        res.add(
          SizedBox(
            width: size,
            height: size,
            child: MultiframeImage.network(
              Util.getImgUrl('bomb/bomb_burst.webp', package: ComponentManager.MANAGER_BASE_ROOM),
              'bomb',
              loop: false,
              onComplete: () {
                if (_bombData!.status == DigitBombStatus.bomb) {
                  _bombData!.status = DigitBombStatus.over;
                  refreshUI();
                }
              },
            ),
          ),
        );
      } else {
        res.add(
          IgnorePointer(
            child: CachedNetworkImage(
              imageUrl: Util.getImgUrl('bomb/wait_bomb_burst.webp', package: ComponentManager.MANAGER_BASE_ROOM),
              width: size,
              height: size,
              fit: BoxFit.fill,
            ),
          ),
        );
      }
    }
    return res;
  }
}

/// 麦位惩罚插件
class PunishPlugin extends UserIconPlugin {
  final List<UserPunish>? userPunish;

  PunishPlugin(this.userPunish);

  @override
  String get name => UserIconPlugin.punish;

  @override
  Widget? buildUserIcon({double borderWidth = 1}) {
    bool hasPunishMa = false;
    //惩罚的头像马赛克
    if ((userPunish?.length ?? 0) > 0) {
      int index = userPunish?.indexWhere((element) => element.type == SystemPunishType.mask) ?? 0;
      if (index >= 0) {
        hasPunishMa = true;
      }
    }
    if (hasPunishMa) {
      return ImageBlurWidget(
        width: size - 2 * borderWidth,
        height: size - 2 * borderWidth,
        borderRadius: (size - 2 * borderWidth) / 2,
        child: CommonAvatar(
          path: roomPosition.icon,
          size: size,
          shape: BoxShape.circle,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  List<Widget> buildWidgets() {
    List<Widget> res = <Widget>[];

    //惩罚的搞笑头像框
    if (userPunish != null && userPunish!.isNotEmpty) {
      Log.d("this.widget.userPunish is not null");
      int index = userPunish!.indexWhere((element) => element.type == SystemPunishType.header);
      if (index >= 0) {
        UserPunish userPunish = this.userPunish![index];
        String frameImage = userPunish.content;
        double overflow = -5.0;
        if (size <= 44) {
          // 小麦位的头像框适配
          overflow = -3.0;
        }
        res.add(PositionedDirectional(
          start: overflow,
          end: overflow,
          top: overflow,
          bottom: overflow,
          child: IgnorePointer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size / 2 - overflow),
              child: CachedNetworkImage(
                imageUrl: frameImage,
                errorWidget: Container(),
              ),
            ),
          ),
        ));
      }
    }

    // 贴纸条惩罚
    if (userPunish != null && userPunish!.isNotEmpty) {
      Log.d("this.widget.userPunish is not null");
      int index = userPunish!.indexWhere((element) => element.type == SystemPunishType.paper);
      if (index >= 0) {
        res.add(
          SizedBox(
            width: size,
            height: size,
            child: PunishPaperWidget(size: size, count: userPunish![index].pageCount),
          ),
        );
      }
    }

    //贴字条惩罚
    if (userPunish?.isNotEmpty ?? false) {
      UserPunish? userPunish = this.userPunish!.firstWhereOrNull((_) => _.type == SystemPunishType.stickyNote);
      if (userPunish?.content.isNotEmpty ?? false) {
        res.add(
          IgnorePointer(
            child: Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(color: Color(0x66000000), shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(
                userPunish?.content ?? '',
                style: TextStyle(fontSize: size * 16 / 80, color: Colors.white),
                maxLines: 1,
              ),
            ),
          ),
        );
      }
    }

    return res;
  }

  @override
  bool get effect => true;
}

/// 麦位冠名插件
class AwardTitlePlugin extends UserIconPlugin {
  @override
  String get name => UserIconPlugin.awardTitle;

  @override
  bool get effect => true;

  String? _awardName;

  int _level = 0;

  @override
  void onInitState() {
    super.onInitState();
    room.addListener(RoomConstant.Event_Room_Award_Title, _onReceiveAwardTitle);
  }

  @override
  void onDispose() {
    room.removeListener(RoomConstant.Event_Room_Award_Title, _onReceiveAwardTitle);
    super.onDispose();
  }

  @override
  List<Widget> buildWidgets() {
    List<Widget> res = <Widget>[];
    if (!Util.isStringEmpty(_awardName)) {
      double ratio = 16 / 60; // 超出比例
      res.add(
        PositionedDirectional(
          start: -size * ratio,
          end: -size * ratio,
          top: -size * ratio,
          bottom: -size * ratio,
          child: MicAwardNameAnim(
            name: _awardName!,
            level: _level,
            onAnimFinished: () {
              _awardName = null;
              _level = 0;
              refreshUI();
            },
          ),
        ),
      );
    }
    return res;
  }

  _onReceiveAwardTitle(String type, data) {
    if (data is Map && roomPosition.uid == Util.parseInt(data['uid'])) {
      _level = Util.parseInt(data['lv']);
      _awardName = data['name'];
      refreshUI();
    }
  }
}

/// 印象标记插件
class ImpressTagPlugin extends UserIconPlugin {
  @override
  String get name => UserIconPlugin.impressTag;

  @override
  bool get effect => true;

  List<ShowImpressTagData> _impressTagDataList = [];

  String icon = '';

  int tagUid = 0;

  Timer? _timer;

  @override
  void onInitState() {
    super.onInitState();
    room.addListener('${RoomConstant.Event_Pb_Prefix}impress.tag', _onReceiveImpressTag);
  }

  // config接口下发的是json，这里自己转换一下
  parseTagList() {
    List<ShowImpressTagData> tagDataList = [];
    for (Map<String, dynamic> data in room.impressTagList ?? []) {
      int tagId = Util.parseInt(data['tag_id']);
      int uid = Util.parseInt(data['uid']);
      int endTime = Util.parseInt(data['end_time']);
      String tagIcon = Util.parseStr(data['tag_icon']) ?? '';
      ShowImpressTagData tagData = ShowImpressTagData();
      tagData.tagIcon = tagIcon;
      tagData.endTime = endTime;
      tagData.uid = uid;
      tagData.tagId = tagId;
      tagDataList.add(tagData);
    }
    room.impressTagList = [];
    return tagDataList;
  }

  @override
  void onDispose() {
    cancelTimer();
    tagUid = 0;
    icon = '';
    _impressTagDataList = [];
    room.removeListener('${RoomConstant.Event_Pb_Prefix}impress.tag', _onReceiveImpressTag);
    super.onDispose();
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void _startTimer(int duration) {
    cancelTimer();
    _timer = Timer(Duration(seconds: duration), _removeAnim);
  }

  _removeAnim() {
    _impressTagDataList.removeWhere((element) => element.uid == tagUid);
    tagUid = 0;
    icon = '';
    _loadNextImpressTag();
    refreshUI();
  }

  // 结束后，请求下一个tag，等待消息
  _loadNextImpressTag() async {
    await noticeNextPressTag(roomPosition.uid, room.rid);
  }

  static Future<ShowImpressTagsRsp> noticeNextPressTag(int uid, int rid) async {
    String url = '${System.domain}go/yy/gift/showImpressionTag';
    try {
      XhrResponse response = await Xhr.get(url, queryParameters: {'uid': '$uid', 'rid': '$rid', 'typ': 'mic'}, pb: true);
      return ShowImpressTagsRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ShowImpressTagsRsp(msg: e.toString(), success: false);
    }
  }

  @override
  List<Widget> buildWidgets() {
    parseData(parseTagList());
    List<Widget> res = <Widget>[];
    if (_impressTagDataList.isNotEmpty) {
      if (roomPosition.uid > 0) {
        int index = _impressTagDataList.indexWhere((element) => element.uid == roomPosition.uid);
        if (index >= 0) {
          res.add(
            PositionedDirectional(
              top: -22,
              child: SizedBox(
                  width: 60,
                  height: 24,
                  child: CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(icon),
                    fit: BoxFit.cover,
                  )),
            ),
          );
        }
      } else {
        cancelTimer();
        _impressTagDataList.clear();
      }
    }
    return res;
  }

  void parseData(List<ShowImpressTagData> showDataList) {
    if (showDataList.isNotEmpty) {
      _impressTagDataList.addAll(showDataList);
      int index = _impressTagDataList.indexWhere((element) {
        return element.uid == roomPosition.uid;
      });
      if (index >= 0) {
        ShowImpressTagData tagData = _impressTagDataList[index];
        int timestamp = DateTime.now().secondsSinceEpoch;
        if (tagData.endTime > timestamp) {
          icon = tagData.tagIcon;
          tagUid = tagData.uid;
          refreshUI();
          _startTimer(tagData.endTime - timestamp);
        } else {
          // 过期了，清理掉
          cancelTimer();
          _impressTagDataList.clear();
        }
      }
    }
  }

  _onReceiveImpressTag(String type, data) {
    try {
      if (roomPosition.uid <= 0) return;
      ShowImpressTagMessage? impressTagResult;
      if (data != null && data is Uint8List) {
        Uint8List buffer = data;
        impressTagResult = ShowImpressTagMessage.fromBuffer(buffer);
        parseData(impressTagResult.showData);
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
}

/// 麦位变猪插件
///
class PigPunishPlugin extends UserIconPlugin {
  List<PigPunishData> _pigPunishList = [];

  @override
  bool get effect => true;

  @override
  String get name => UserIconPlugin.punishV2;

  Timer? _timer;
  int _pigUid = 0;

  @override
  void onInitState() {
    super.onInitState();
    room.addListener(RoomConstant.Event_Room_Mic_Punish, _onReceiveMsg);
  }

  @override
  void onDispose() {
    room.removeListener(RoomConstant.Event_Room_Mic_Punish, _onReceiveMsg);
    _stopTimer();
    super.onDispose();
  }

  _onReceiveMsg(String type, data) {
    Log.d('onReceiveMsg: $type， $data');
    if (roomPosition.uid <= 0) return;
    if (data != null && data is Map && data['effects'] != null) {
      _pigPunishList = Util.parseList(data['effects'], (e) => PigPunishData.fromJson(e));
      int index = _pigPunishList.indexWhere((element) => element.uid == roomPosition.uid);
      if (index >= 0) {
        PigPunishData pigPunish = _pigPunishList[index];
        if (pigPunish.expire > 0 && pigPunish.uid > 0) {
          _pigUid = pigPunish.uid;
          _startTimer(pigPunish.expire);
        }
        refreshUI();
      }
    }
  }

  _startTimer(int duration) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: duration), _removeAnim);
  }

  _removeAnim() {
    _pigPunishList.removeWhere((element) => element.uid == _pigUid);
    _pigUid = 0;
    refreshUI();
  }

  _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget? buildUserIcon({double borderWidth = 1}) {
    if (_pigPunishList.isNotEmpty && roomPosition.uid > 0) {
      int index = _pigPunishList.indexWhere((element) => element.uid == roomPosition.uid);
      if (index >= 0) {
        return const SizedBox.expand();
      }
    }

    return null;
  }

  @override
  List<Widget> buildWidgets() {
    List<Widget> res = <Widget>[];
    //惩罚的搞笑头像框

    if (_pigPunishList.isNotEmpty && roomPosition.uid > 0) {
      int index = _pigPunishList.indexWhere((element) => element.uid == roomPosition.uid);
      if (index >= 0) {
        PigPunishData data = _pigPunishList[index];
        String frameImage = data.url;
        double overflow = -5.0;
        if (size <= 44) {
          // 小麦位的头像框适配
          overflow = -3.0;
        }
        res.add(PositionedDirectional(
          start: overflow,
          end: overflow,
          top: overflow,
          bottom: overflow,
          child: IgnorePointer(
            child: MultiframeImage.network(
              frameImage,
              'effect',
              loop: true,
            ),
          ),
        ));
      }
    }
    return res;
  }
}
