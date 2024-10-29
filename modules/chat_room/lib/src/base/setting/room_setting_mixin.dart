import 'dart:convert';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/atmosphere/atmosphere_manager.dart';
import 'package:chat_room/src/base/model/option_beans.dart';
import 'package:chat_room/src/base/page/package_settings.dart';
import 'package:chat_room/src/base/setting/room_setting_repo.dart';
import 'package:chat_room/src/base/widget/backgroundSheet.dart';
import 'package:chat_room/src/base/widget/theme_template_sheet.dart';
import 'package:chat_room/src/chat_room_screen.dart';
import 'package:chat_room/src/music/playlist/music_playlist_screen.dart';
import 'package:chat_room/src/music/widget/music_room_background_sheet.dart';
import 'package:chat_room/src/red_packet/red_packet_setting_screen.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/under/model/underData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/model/report_type.dart';
import 'package:shared/shared.dart';

import '../page/room_modify_ticket_screen.dart';
import '../room_music_control.dart';
import '../widget/room_pwd_dialog.dart';
import 'favorite_room_tips_bottom_dialog.dart';
import 'room_setting_panel.dart';
import 'room_setting_util.dart';

/// 房间设置事件常量
class RoomSettingActions {
  static const CP_LOVE_WAIT = 'cp-love-wait';
  static const CP_LOVE_REWARD = 'cp-love-reward';
  static const CP_LOVE_SWITCH = 'cp-love-switch';
  static const CP_LOVE_RESULT = 'cp-love-result';

  /// 查看个人资料
  static const PROFILE = 'profile';

  /// 分享
  static const SHARE = 'share';

  /// 关闭房间
  static const CLOSE = 'close';

  static const PACKAGE = 'package';
  static const PACKAGE_PAUSE = 'package-pause';
  static const PACKAGE_RESUME = 'package-resume';
  static const PACKAGE_STOP = 'package-stop';
  static const RED_PACKET = 'red_packet';

  static const Room_Ticket = 'room_ticket';

  /// 抢帽子玩法
  static const String HAT_PLAT = 'hat';

  /// 打开公屏
  static const OPEN_MESSAGE = 'open-message';

  /// 关闭公屏
  static const CLOSE_MESSAGE = 'close-message';

  /// 倒计时
  static const COUNTER = 'counter';
  static const COUNTER_STOP = 'counter-stop';

  /// 主题
  static const THEME = 'theme';

  /// 主题模板
  static const THEME_TEMPLATE = 'theme-template';

  /// 显示背景选择
  static const BACKGROUND_DISPLAY = 'background-display';

  /// 房间封面
  static const ROOM_COVER = 'room_cover';

  /// 音乐房主题背景
  static const LISTENSONG_THEME = 'listensong_theme';

  /// 音乐房音乐列表
  static const SONG_LIST = 'song_list';

  /// 音乐
  static const MUSIC = 'music';

  /// 房间设置-边框和角标设置
  static const BORDER_AND_CORNER = 'border-corner';

  /// 系统配置
  static const CONFIG_DISPLAY = 'config-display';
  static const ROOM_SHOW_DRAINAGE_NO_PERMISSION = 'room_show_drainage_no_permission'; //大小房：显示未赠礼用户
  static const ROOM_SHOW_ADMIN_CHAIR = 'room_show_admin_chair'; //显示房主位
  static const ROOM_IN_MIC_FREE = 'room_in_mic_free'; //自由上麦
  static const ROOM_SHOW_RANK = 'room_show_rank'; //显示排行榜
  static const ROOM_SHOW_RECEPTION = 'room_show_reception'; //显示接待位
  static const ROOM_BOSS_CHAIR_COUNT = 'room_boss_chair_count'; //房主位数量（可选0-4）
  static const ROOM_BOSS_CHAIR_NAME = 'room_boss_chair_name'; // 老板位名称
  static const ROOM_SHOW_BIG_HEADER = 'room_show_big_header'; //显示两个老板位

  static const ONLINE = 'online';
  static const STEALTH = 'stealth';
  static const UN_STEALTH = 'unstealth';
  static const CA_SH = 'ca' 'sh';
  static const INVITE = 'invite';
  static const FORBID_ROOM = 'forbid_room';
  static const REPORT = 'report';
  static const OPERATE_H5 = 'operate-h5';
  static const ATMOSPHERE = 'atmosphere';

  ///  耳麦
  static const EAR_MONITORING = 'ear_monitoring';

  /// 收起房间
  static const FOLD = 'fold';

  static const ROOM_COLLECT = 'room_collect';

  /// 收藏房间
  static const FAVORITE = 'collect';

  /// 取消收藏房间
  static const UN_FAVORITE = 'un_collect';
}

mixin RoomSettingMixin<T extends StatefulWidget> on State<T> {
  final String _logTag = 'RoomSettingMixin';

  final Throttle throttle = Throttle();

  @override
  void dispose() {
    throttle.dispose();
    super.dispose();
  }

  onSettingClick(ChatRoomData? room) async {
    if (room == null) return;
    SheetCallback? callback = await RoomSettingPanel.showOptionsPanel(context, room);
    if (callback == null) {
      return;
    }
    setting(callback, room);
  }

  /// 设置结果回调处理
  setting(SheetCallback? result, ChatRoomData? room) async {
    if (!mounted || room == null || room.config == null) return;

    // bool refreshOptions = false;
    Log.d(tag: _logTag, "callBack key = ${result?.value?.key}");

    switch (result?.value?.key) {
      case OptionType.ROOM_LOCK:
        ChatRoomData? room = ChatRoomData.getInstance();

        /// 游戏过程中不允许修改加锁
        if (room?.config?.game == Games.Under &&
            room?.config?.underData?.gameUnderState != GameUnderState.Wait &&
            room?.config?.underData?.gameUnderState != GameUnderState.End) {
          Fluttertoast.showToast(msg: K.room_modify_pwd_on_playing, gravity: ToastGravity.CENTER);
          return;
        }

        String? pwd = await RoomPwdDialog.show(context);

        if (Util.isStringEmpty(pwd)) {
          return;
        }

        Log.d(tag: LOG_TAG, "RoomPasswordDialog pwd = $pwd");
        await saveOption(OptionType.ROOM_LOCK, pwd, room!);
        break;

      case OptionType.ROOM_UNLOCK:
        await saveOption(OptionType.ROOM_UNLOCK, "", room);
        break;

      case OptionType.ROOM_SETTING:
        RoomModifyScreenNew.open(context, room!.realRid);
        break;
      case OptionType.ROOM_EXIT:
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        Navigator.of(context).pop(null);
        roomManager.topLiveToolDestroy();
        break;

      case OptionType.ROOM_TICKET:
        RoomModifyTicketScreen.show(context, room.realRid);
        break;

      case RoomSettingActions.CP_LOVE_WAIT:
        RoomRepository.cpSetState(room.rid, 'reward', room.config?.originFactory ?? '');
        break;

      case RoomSettingActions.CP_LOVE_REWARD:
        RoomRepository.cpSetState(room.rid, 'switch', room.config?.originFactory ?? '');
        break;

      case RoomSettingActions.CP_LOVE_SWITCH:
        RoomRepository.cpSetState(room.rid, 'result', room.config?.originFactory ?? '');
        break;

      case RoomSettingActions.CP_LOVE_RESULT:
        RoomRepository.cpSetState(room.rid, 'wait', room.config?.originFactory ?? '');
        break;

      case RoomSettingActions.PROFILE:
        RoomNavUtil.openRoomModifyScreen(context, rid: room.rid, fullScreenDialog: true);
        break;

      case RoomSettingActions.SHARE:
        _onShare(room);
        break;

      case RoomSettingActions.CLOSE:
        bool closed = await ChatRoomUtil.showCloseDialog(context, room);
        if (closed == true) {
          RoomRepository.close(room.realRid);
        }
        break;

      case RoomSettingActions.PACKAGE:
        _displayPackageSheet(room);
        break;
      case RoomSettingActions.PACKAGE_PAUSE:
      case RoomSettingActions.PACKAGE_RESUME:
      case RoomSettingActions.PACKAGE_STOP:
        int value = 0;
        if (result?.value?.key == RoomSettingActions.PACKAGE_RESUME) {
          value = PackageConfig.resume;
        } else if (result?.value?.key == RoomSettingActions.PACKAGE_STOP) {
          value = PackageConfig.stop;
        } else if (result?.value?.key == RoomSettingActions.PACKAGE_PAUSE) {
          value = PackageConfig.pause;
        } else {
          return;
        }
        RoomRepository.opSetting(room.realRid, 'package', value);
        break;

      case RoomSettingActions.OPEN_MESSAGE:
      case RoomSettingActions.CLOSE_MESSAGE:
        await RoomRepository.displayMessage(room.realRid, result?.value?.key == RoomSettingActions.CLOSE_MESSAGE);
        // refreshOptions = true;
        break;

      case RoomSettingActions.COUNTER:
        _displayCounterSheet(room);
        break;

      case RoomSettingActions.COUNTER_STOP:
        RoomRepository.opSetting(room.realRid, 'counter', 0);
        break;

      case RoomSettingActions.THEME:
        _displayThemeSheet(room);
        break;

      case RoomSettingActions.BACKGROUND_DISPLAY:
        _displayBackgroundSheet(room);
        break;

      case RoomSettingActions.LISTENSONG_THEME:
        _displayMusicBackgroundSheet(room);
        break;

      case RoomSettingActions.SONG_LIST:
        MusicPlayListScreen.openMusicPlayListScreen(context, room);
        break;

      case RoomSettingActions.CONFIG_DISPLAY:
        displayConfigSheet(room);
        break;

      case RoomSettingActions.ONLINE:
        RoomNavUtil.openRoomAdminScreen(context,
            rid: room.rid, purview: room.purview, types: room.config?.types, fullScreenDialog: true, uid: room.createor?.uid ?? 0);
        break;

      case RoomSettingActions.STEALTH:
      case RoomSettingActions.UN_STEALTH:
        await RoomRepository.xhrAutoError(
            'room/roomstealth', {'rid': room.realRid.toString(), 'hide': result?.value?.key == RoomSettingActions.STEALTH ? '1' : '0'});
        await ChatRoomScreen.updateStealth(room);
        // refreshOptions = true;
        break;

      case RoomSettingActions.CA_SH:
        RoomNavUtil.openRoomIncomeScreen(context, rid: room.realRid);
        break;

      case RoomSettingActions.MUSIC:
        var canPlay = RoomMusicControl.canMusicPlay(MusicScene.backgroundMusic);
        if (false == canPlay) {
          return;
        }
        RoomNavUtil.openRoomMusicScreen(context, room: room);
        break;

      case RoomSettingActions.ATMOSPHERE:
        RoomAtmosphereManager.displaySheet(context, room.realRid);
        break;
      case RoomSettingActions.INVITE:
        _onShare(room);
        break;
      case RoomSettingActions.FORBID_ROOM:
        _displayForbidRoomSheet(room);
        break;
      case RoomSettingActions.REPORT:
        // 举报房间
        IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openReportScreen(context,
            uid: room.createor != null ? room.createor!.uid : 0, reportType: ReportType.Room, reportId: room.realRid);
        break;
      case RoomSettingActions.OPERATE_H5:
        // 操作选项支持跳转h5
        BaseWebviewScreen.show(context, url: room.operateH5?['url'] ?? '');
        break;
      case RoomSettingActions.RED_PACKET:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RedPacketSettingScreen(room.realRid, describeEnum(room.purview), room),
        ));
        break;
      case RoomSettingActions.EAR_MONITORING:
        ChatRoomUtil.changeEarMonitoringEnable();
        break;
      case RoomSettingActions.FOLD:
        Navigator.of(context).pop();
        break;
      case RoomSettingActions.HAT_PLAT:
        RoomSettingRepo.mateRoomOption(room.rid, RoomSettingActions.HAT_PLAT);
        break;
      case RoomSettingActions.THEME_TEMPLATE:
        _displayThemeTemplateRoomSheet(room);
        break;
      case RoomSettingActions.ROOM_COLLECT:
        var rsp = await RoomSettingRepo.mateRoomCollectOption(room.rid);
        if (rsp?.success == true) {
          eventCenter.emit('RoomCollect.Change');
        }
        break;
      case RoomSettingActions.FAVORITE:

        /// 收藏房间
        bool hasShowFavoriteTips = Config.getBool('has_show_favorite_room_tips', false);
        if (!hasShowFavoriteTips) {
          Config.setBool('has_show_favorite_room_tips', true);
          bool? suc = await FavoriteRoomTipsBottomDialog.show(context);
          if (suc != true) {
            return;
          }
        }
        RoomSettingRepo.favoriteRoomOption(room.rid, 1);
        Tracker.instance.track(TrackEvent.collect_room, properties: {
          'collect': '1',
        });
        Fluttertoast.showCenter(msg: K.room_favorite_room_suc);
        break;
      case RoomSettingActions.UN_FAVORITE:

        /// 取消收藏房间
        RoomSettingRepo.favoriteRoomOption(room.rid, 0);
        Tracker.instance.track(TrackEvent.collect_room, properties: {
          'collect': '0',
        });
        break;

      case RoomSettingActions.BORDER_AND_CORNER:
        IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        manager.openBorderAndCornerSettingPanel(context, room.rid);
        break;
    }
  }

  Future saveOption(String type, dynamic value, ChatRoomData room) async {
    List<dynamic> p = [];
    p.add({'type': type, 'value': value});
    await RoomOptionSaveHelper.saveOptions(room.realRid, json.encode(p));
  }

  /// 系统配置
  displayConfigSheet(ChatRoomData? room) async {
    if (!mounted || room == null || room.config == null) return;
    List<SheetItem> res = [];

    if (room.drainagePreviewData != null) {
      int showNoPermission = await RoomRepository.getDrainagePreferences(room.realRid);
      if (showNoPermission > 0) {
        /// 大小房的大房：支持设置创建的小房，邀请列表是否展示未赠礼用户
        /// showNoPermission:0 不能设置，1 开启， 2 关闭
        res.add(SheetItem(
          K.room_show_drainage_no_permission,
          RoomSettingActions.ROOM_SHOW_DRAINAGE_NO_PERMISSION,
          {'type': 'drainage', 'value': (showNoPermission == 1) ? 1 : 0},
        ));
      }
    }

    if (RoomSettingUtil.showAdminChair(room)) {
      res.add(SheetItem(
        K.room_show_admin_chair,
        RoomSettingActions.ROOM_SHOW_ADMIN_CHAIR,
        {'type': 'nine', 'value': (room.config?.nine == false) ? 1 : 0},
      ));
    }

    if (RoomSettingUtil.showInMicFree(room)) {
      res.add(SheetItem(
        K.room_in_mic_free,
        RoomSettingActions.ROOM_IN_MIC_FREE,
        {'type': 'mode', 'value': (room.config?.mode == RoomMode.Auto) ? 1 : 0},
      ));
    }

    if (RoomSettingUtil.showRank(room)) {
      res.add(SheetItem(
        K.room_show_rank,
        RoomSettingActions.ROOM_SHOW_RANK,
        {'type': 'display_rank', 'value': (room.config!.displayRank) ? 1 : 0},
      ));
    }

    if (RoomSettingUtil.showReception(room)) {
      res.add(SheetItem(
        K.room_show_reception,
        RoomSettingActions.ROOM_SHOW_RECEPTION,
        {'type': 'reception', 'value': (room.config?.reception == true) ? 1 : 0},
      ));
    }

    if (RoomSettingUtil.showBossChairNum(room)) {
      res.add(SheetItem(
        K.room_boss_chair_count,
        RoomSettingActions.ROOM_BOSS_CHAIR_COUNT,
        {'type': 'paier', 'value': room.config?.paier ?? false},
      ));
    }

    /// 老板位名称
    if (room.config!.paier > 0) {
      List<RoomPosition> bossPositionList = ChatRoomUtil.getBossChairPositions();
      if (bossPositionList.isNotEmpty) {
        int value = bossPositionList.last.positionRole == RoomPositionRole.guest ? 1 : 0;
        res.add(SheetItem(
          K.room_boss_name,
          RoomSettingActions.ROOM_BOSS_CHAIR_NAME,
          {'first': K.room_boss, 'second': K.room_guest_title, 'value': value, 'type': 'paier_type'},
        ));
      }
    }

    if (RoomSettingUtil.showBigHeader(room)) {
      res.add(SheetItem(
        K.room_show_big_header,
        RoomSettingActions.ROOM_SHOW_BIG_HEADER,
        {'type': 'birthday_extra_mic', 'value': (room.config!.showExtraMic) ? 1 : 0},
      ));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              data: res,
              enabledAutoClick: false,
              render: (context, item, index, {VoidCallback? callback}) {
                return _buildConfigSheetItem(context, room, item, index, callback: callback);
              });
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    setting(result, room);
  }

  Widget _buildConfigSheetItem(BuildContext context, ChatRoomData room, SheetItem? item, int index, {VoidCallback? callback}) {
    Widget child;
    if (item?.key == RoomSettingActions.ROOM_BOSS_CHAIR_COUNT) {
      child = _buildConfigSheetSelect(context, room, item, callback: callback);
    } else if (item?.key == RoomSettingActions.ROOM_BOSS_CHAIR_NAME) {
      child = _buildConfigSheetTextSwitch(context, room, item, callback: callback);
    } else {
      child = _buildConfigSheetSwitch(context, room, item, callback: callback);
    }
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: R.color.dividerColor, width: 0.0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item?.label ?? '',
            maxLines: 1,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildConfigSheetSwitch(BuildContext context, ChatRoomData room, SheetItem? item, {VoidCallback? callback}) {
    Map extra = item?.extra ?? {};
    String type = extra['type'] ?? '';
    int curValue = extra['value'] ?? 0;
    return CupertinoSwitch(
      value: (curValue == 1),
      activeColor: R.color.mainBrandColor,
      trackColor: R.color.switchInActiveColor,
      onChanged: (bool value) async {
        if (type != 'mode' && room.config?.game != Games.None) {
          Fluttertoast.showToast(msg: K.room_the_room_not_support_modify_setting, gravity: ToastGravity.CENTER);
          return;
        }
        if (type == 'birthday_extra_mic' && !value && room.positions.last.uid > 0) {
          Fluttertoast.showToast(msg: K.room_close_big_header_tips, gravity: ToastGravity.CENTER);
          return;
        }
        extra['value'] = value ? 1 : 0;
        callback?.call();
        bool result = await _onOptConfigSheetItem(room, type, value ? 1 : 0);
        if (!result) {
          extra['value'] = curValue;
          callback?.call();
        }
      },
    );
  }

  Widget _buildConfigSheetSelect(BuildContext context, ChatRoomData room, SheetItem? item, {VoidCallback? callback}) {
    Map extra = item?.extra ?? {};
    String type = extra['type'] ?? '';
    int curValue = extra['value'] ?? 0;
    return Container(
      width: 86,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFD6D6D6), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              throttle.call(() async {
                int value = curValue - 1;
                if (value < 0) {
                  return;
                }
                extra['value'] = value;
                callback?.call();
                bool result = await _onOptConfigSheetItem(room, type, value);
                if (!result) {
                  extra['value'] = curValue;
                  callback?.call();
                }
              });
            },
            child: const Icon(
              Icons.remove,
              size: 24,
              color: Color(0xFFD6D6D6),
            ),
          ),
          const VerticalDivider(color: Color(0xFFD6D6D6), width: 1),
          Expanded(
            child: Center(
              child: Text(
                '$curValue',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const VerticalDivider(color: Color(0xFFD6D6D6), width: 1),
          GestureDetector(
            onTap: () {
              throttle.call(() async {
                int value = curValue + 1;
                if (value > 4) {
                  return;
                }
                extra['value'] = value;
                callback?.call();
                bool result = await _onOptConfigSheetItem(room, type, value);
                if (!result) {
                  extra['value'] = curValue;
                  callback?.call();
                }
              });
            },
            child: const Icon(
              Icons.add,
              size: 24,
              color: Color(0xFFD6D6D6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigSheetTextSwitch(BuildContext context, ChatRoomData room, SheetItem? item, {VoidCallback? callback}) {
    Map extra = item?.extra ?? {};
    String type = extra['type'] ?? '';
    String first = extra['first'] ?? '';
    String second = extra['second'] ?? '';
    int selectIndex = Util.parseInt(extra['value']);
    Widget itemBuild(String text, int index) {
      bool selected = index == selectIndex;
      return GestureDetector(
        onTap: () {
          if (selected) return;
          throttle.call(() async {
            int currentSelectedIndex = selectIndex;
            extra['value'] = index;
            callback?.call();
            bool result = await _onOptConfigSheetItem(room, type, index);
            if (!result) {
              extra['value'] = currentSelectedIndex;
              callback?.call();
            }
          });
        },
        child: Container(
          width: 41.5,
          height: 28,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: selected ? const Color(0xFF926AFE) : null,
          ),
          child: Text(
            text,
            style: TextStyle(color: selected ? Colors.white : const Color(0x4D000000), fontSize: 12),
          ),
        ),
      );
    }

    return Container(
      width: 85,
      height: 30,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          itemBuild(first, 0),
          itemBuild(second, 1),
        ],
      ),
    );
  }

  Future<bool> _onOptConfigSheetItem(ChatRoomData room, String type, int value) async {
    if (room.isBusinessBirthday && type == 'birthday_extra_mic') {
      NormalNull resp = await RoomRepository.birthdayExtraMic(room.realRid, value);
      return resp.success;
    } else if (type == 'drainage') {
      /// 大小房，设置是否展示未赠礼用户
      NormalNull resp = await RoomRepository.showDrainagNoPermission(room.realRid, value == 1 ? 1 : 2);
      return resp.success;
    } else {
      Map? resp = await RoomRepository.opSetting(room.realRid, type, value);
      return (resp != null && resp['success'] == true);
    }
  }

  _displayBackgroundSheet(ChatRoomData? room) async {
    if (!mounted || room == null) return;
    String? background = await displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        builder: (BuildContext context) {
          return BackgroundSheet(
            rid: room.rid,
            title: room.isBusinessBirthday ? K.room_theme_template : null,
          );
        });
    if (background == null) return;
    await RoomRepository.opbgswitch(room.realRid, background);
  }

  _displayMusicBackgroundSheet(ChatRoomData? room) async {
    if (!mounted || room == null) return;
    String? background = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return MusicRoomBackgroundSheet(rid: room.rid);
        });
    if (background == null) return;
    await RoomRepository.opbgswitch(room.rid, background);
  }

  _displayThemeSheet(ChatRoomData? room) async {
    if (!mounted || room == null || room.config == null) return;
    List<SheetItem> res = [];
    if (room.config?.types != RoomTypes.Auction && room.config?.types != RoomTypes.Wedding) {
      // 拍卖房不支持修改背景

      if (room.isBusinessBirthday) {
        res.add(SheetItem(K.room_theme_template, RoomSettingActions.THEME_TEMPLATE));
      } else {
        res.add(SheetItem(K.room_set_background, RoomSettingActions.BACKGROUND_DISPLAY));
      }
    }

    if (room.config?.types != RoomTypes.RadioDefend && !room.isBusinessCpLove && !(room.isKtvRoom || room.isKtvChorusRoom)) {
      res.add(SheetItem(K.room_system_config, RoomSettingActions.CONFIG_DISPLAY));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    setting(result, room);
  }

  _displayCounterSheet(ChatRoomData? room) async {
    if (!mounted || room == null) return;

    List<SheetItem> res = List.generate(10, (int i) {
      return SheetItem(K.room_few_mins(["${i + 1}"]), "counter-$i", i + 1);
    });
    res.insert(0, SheetItem(K.room_second_fifteen, "counter-15-s", -15));
    res.insert(1, SheetItem(K.room_second_thirty, "counter-15-s", -30));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    RoomRepository.opSetting(room.realRid, 'counter', result.value?.extra);
  }

  _displayPackageSheet(ChatRoomData? room) async {
    if (!mounted || room == null || room.config == null) return;
    List<SheetItem> res = [];
    if (room.config?.package == PackageConfig.stop) {
      PackageSettingsScreenV2.show(room.rid, packageConfig: room.config!.package);
      return;
    } else if (room.config?.package == PackageConfig.startGift ||
        room.config?.package == PackageConfig.startCoin ||
        room.config?.package == PackageConfig.startDistinct ||
        room.config?.package == PackageConfig.startCoinAndDistinct ||
        room.config?.package == PackageConfig.startMicWithMoney ||
        room.config?.package == PackageConfig.startUserWithMoney ||
        room.config?.package == PackageConfig.startUserWithUserCount ||
        room.config?.package == PackageConfig.startMicWithUserCount) {
      res.add(SheetItem(K.room_package_pause, RoomSettingActions.PACKAGE_PAUSE));
      res.add(SheetItem(K.room_package_stop, RoomSettingActions.PACKAGE_STOP));
    } else if (room.config?.package == PackageConfig.pause) {
      res.add(SheetItem(K.room_package_resume, RoomSettingActions.PACKAGE_RESUME));
      res.add(SheetItem(K.room_package_stop, RoomSettingActions.PACKAGE_STOP));
    } else {
      return;
    }
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    setting(result, room);
  }

  _displayForbidRoomSheet(ChatRoomData? room) async {
    if (!mounted || room == null) return;
    Map<int, String> durations = {
      600: R.array('room_forbid_durations')[0],
      1800: R.array('room_forbid_durations')[1],
      3600: R.array('room_forbid_durations')[2],
      7200: R.array('room_forbid_durations')[3],
      14400: R.array('room_forbid_durations')[4],
      28800: R.array('room_forbid_durations')[5],
      43200: R.array('room_forbid_durations')[6],
      86400: R.array('room_forbid_durations')[7],
      259200: R.array('room_forbid_durations')[8],
      604800: R.array('room_forbid_durations')[9],
      2592000: R.array('room_forbid_durations')[10],
      315360000: R.array('room_forbid_durations')[11],
    };

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: durations.entries.map((element) => SheetItem(element.value, '${element.key}')).toList());
        });

    if (result != null) {
      String? duration = durations[Util.parseInt(result.value?.key)];
      String content = K.room_forbid_confirm_content(['', '$duration']);
      if (result.value?.key == '315360000') {
        content = K.room_forbid_confirm_content(['$duration', '']);
      }
      bool? confirm = await showDialog(
          context: context,
          builder: (context) {
            return ConfirmDialog(
              content: content,
            );
          });

      if (confirm == true) {
        RoomRepository.forbidRoom(room.realRid, Util.parseInt(result.value?.key));
      }
    }
  }

  void _onShare(ChatRoomData room) async {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, room.realRid,
        tp: 1, needInApp: true, newShareInRoom: true, rid: room.realRid, title: K.room_invite_friend);
  }

  _displayThemeTemplateRoomSheet(ChatRoomData? room) async {
    if (!mounted || room == null) return;
    String? themeTemplate = await displayModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return RoomSettingThemeTemplateSheet(rid: room.rid);
      },
    );
    if (themeTemplate == null) return;
    await RoomRepository.opbgswitch(room.realRid, themeTemplate);
  }
}
