import 'dart:convert';
import 'dart:ui';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../assets.dart';
import '../../protobuf/generated/room_setting.pb.dart';
import '../../protobuf/generated/rpc_room_frame.pb.dart';
import '../../under/model/underData.dart';
import '../model/option_beans.dart';

final double _panelWith = 235.dp;

/// 房间设置
class RoomSettingPanel extends StatefulWidget {
  final ChatRoomData room;

  const RoomSettingPanel({required this.room, super.key});

  @override
  RoomSettingRightState createState() => RoomSettingRightState();

  static Future<SheetCallback?> showOptionsPanel(BuildContext context, ChatRoomData room) async {
    String? key = await SideSheet.show(
      context: context,
      transFormWidth: _panelWith,
      child: RoomSettingPanel(room: room),
      direction: SideSheetDirection.RIGHT,
    );

    if (Util.isStringEmpty(key)) {
      return null;
    }

    return SheetCallback(SheetCloseReason.Active, -1, SheetItem("", key!));
  }
}

class RoomSettingRightState extends State<RoomSettingPanel> {
  bool _loading = true;
  bool _success = false;
  late RoomOption _data;

  ChatRoomData get _room => widget.room;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<ResRoomOption> _getRoomSettings(int rid) async {
    try {
      XhrResponse response = await Xhr.getPb('${System.domain}go/room/room/option', queryParameters: {'rid': rid}, throwOnError: true);
      return ResRoomOption.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomOption(success: false, msg: e.toString());
    }
  }

  void _load() async {
    ResRoomOption resp = await _getRoomSettings(widget.room.realRid);
    Log.d('RoomSettingRightState _load resp=${resp.toProto3Json()}');
    if (resp.success) {
      _success = true;
      _data = resp.data;

      for (RoomOptionItem item in _data.baseItem.items) {
        if (item.key == RoomSettingActions.MUSIC && _room.role != ClientRole.Broadcaster) {
          _data.baseItem.items.remove(item);
          break;
        }
      }

      for (RoomOptionItem item in _data.roomSet.items) {
        if (item.key == RoomSettingActions.MUSIC && _room.role != ClientRole.Broadcaster) {
          _data.roomSet.items.remove(item);
          break;
        }
      }

      for (RoomOptionItem item in _data.otherFunction.items) {
        if (item.key == RoomSettingActions.MUSIC && _room.role != ClientRole.Broadcaster) {
          _data.otherFunction.items.remove(item);
          break;
        }
      }
    }
    _loading = false;
    refresh();
  }

  /// 玩法切换
  Future _doSwitchRoomType(OptionSwitchItem item) async {
    if (item.type == OptionType.SWITCH_ROOM_TYPE_APPRAISER) {
      Navigator.of(context).pop(null);
      return;
    }
    if (mounted) setState(() {});

    ChatRoomData room = _room;

    /// 游戏过程中不允许修改房间类型
    if (room.config?.game == Games.Under &&
        room.config?.underData?.gameUnderState != GameUnderState.Wait &&
        room.config?.underData?.gameUnderState != GameUnderState.End) {
      Fluttertoast.showToast(msg: K.room_modify_category_on_playing, gravity: ToastGravity.CENTER);
      return;
    }

    /// 狼人杀游戏过程不允许修改房间类型
    if (room.config != null && room.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      if (wereWolfManager.isGaming()) {
        Fluttertoast.showToast(msg: K.room_modify_category_on_playing, gravity: ToastGravity.CENTER);
        return;
      }
    }

    if (ChatRoomUtil.isLayaGame(widget.room.config)) {
      // 网关协议切房
      DataRsp dataRsp = await room.updateRoom(RPCReqCreate(
        rid: room.config?.rid,
        uid: Session.uid,
        factoryType: item.type,
        extendVersion: RoomConstant.Update_Room_RPC_Extend_Version,
      ));
      if (!dataRsp.success && dataRsp.msg?.isNotEmpty == true) {
        Fluttertoast.showCenter(msg: dataRsp.msg ?? '');
      }
      Navigator.of(context).maybePop(null);
    } else {
      // 接口切房
      await saveOption("switch_room_type", item.type);
    }
  }

  Future saveOption(String type, dynamic value) async {
    List<dynamic> p = [];
    p.add({'type': type, 'value': value});
    Navigator.of(context).maybePop(null);
    await RoomOptionSaveHelper.saveOptions(widget.room.realRid, json.encode(p));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(25)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: _panelWith,
          height: Util.height,
          color: const Color(0xFF171621).withOpacity(0.7),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading || !_success) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.dp),
            // 基础设置
            _buildOptions(_data.baseItem),
            // 好友在玩
            _buildPlaying(_data.recommendList),
            // 玩法切换
            _buildRoomTypeSwitch(_data.switchRoom),
            // 派对设置
            _buildGridOptions(_data.roomSet),
            // 其他功能
            _buildGridOptions(_data.otherFunction),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    if (title.isNotEmpty) {
      return Align(
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 12.dp, bottom: 10.dp),
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 14.dp, fontWeight: FontWeight.w500)),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildOptions(RoomOptionData optionData) {
    if (optionData.items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSectionTitle(optionData.title),
        SizedBox(
          width: _panelWith,
          height: 74.dp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 6.dp),
            itemBuilder: (context, index) {
              return SizedBox(width: 72.dp, child: _buildOptionItem(optionData.items[index]));
            },
            itemCount: optionData.items.length,
          ),
        ),
        SizedBox(height: 32.dp),
      ],
    );
  }

  Widget _buildGridOptions(RoomOptionData optionData) {
    if (optionData.items.isEmpty) {
      return const SizedBox.shrink();
    }

    int rowNum = (optionData.items.length / 4).ceil();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSectionTitle(optionData.title),
        SizedBox(
          width: _panelWith,
          height: 74.dp * rowNum + 10.dp * (rowNum - 1),
          child: GridView.count(
            padding: const EdgeInsetsDirectional.only(start: 9, end: 2),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 10.dp,
            crossAxisCount: 4,
            childAspectRatio: 58 / 74,
            children: optionData.items.map((e) => SizedBox(width: 58.dp, height: 74.dp, child: _buildOptionItem(e))).toList(),
          ),
        ),
        SizedBox(height: 32.dp),
      ],
    );
  }

  Widget _buildOptionItem(RoomOptionItem item) {
    if (item.key == RoomSettingActions.EAR_MONITORING) {
      bool earMonitoringEnable = ChatRoomUtil.earMonitoringEnable();
      // 耳返的状态保存在本地
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          ChatRoomUtil.changeEarMonitoringEnable();
          Navigator.of(context).pop(null);
        },
        child: _buildOptionItemUI(
          earMonitoringEnable
              ? RoomAssets.chat_room$setting_ic_ear_monitoring_close_webp
              : RoomAssets.chat_room$setting_ic_ear_monitoring_open_webp,
          earMonitoringEnable ? K.room_ear_monitoring_disable : K.room_ear_monitoring_enable,
          isLocal: true,
        ),
      );
    } else if (item.key == RoomSettingActions.COUNTER) {
      bool alreadyCountTimer = (_room.config?.counter ?? 0) > _room.serverTime;
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (alreadyCountTimer) {
            Navigator.of(context).pop(RoomSettingActions.COUNTER_STOP);
          } else {
            Navigator.of(context).pop(RoomSettingActions.COUNTER);
          }
        },
        child: _buildOptionItemUI(
          alreadyCountTimer
              ? RoomAssets.chat_room$setting_ic_count_timer_close_webp
              : RoomAssets.chat_room$setting_ic_count_timer_open_webp,
          alreadyCountTimer ? K.room_stop_down_timer : K.room_count_timer,
          isLocal: true,
        ),
      );
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(item.key),
      child: _buildOptionItemUI(item.icon, item.name),
    );
  }

  Widget _buildOptionItemUI(String icon, String name, {bool isLocal = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        isLocal
            ? R.img(icon, width: 50.dp, height: 50.dp, package: ComponentManager.MANAGER_BASE_ROOM)
            : CachedNetworkImage(imageUrl: icon, width: 50.dp, height: 50.dp),
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 10.dp))
      ],
    );
  }

  /// 好友在玩
  Widget _buildPlaying(RoomRcmdPlayingData playingData) {
    if (playingData.items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(playingData.title),
        SizedBox(
          width: _panelWith,
          height: 54.dp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsetsDirectional.only(start: 4.dp, end: 4.dp),
            itemBuilder: (context, index) => _buildPlayingItem(playingData.items[index]),
            itemCount: playingData.items.length,
          ),
        ),
        SizedBox(height: 32.dp),
      ],
    );
  }

  Widget _buildPlayingItem(RoomRcmdPlayingDataItem item) {
    return GestureDetector(
      onTap: () => _onPlayingTap(item),
      child: Container(
        width: 54.dp,
        height: 54.dp,
        margin: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CommonAvatar(
              path: item.icon,
              size: 54.dp,
              shape: BoxShape.circle,
              onTap: () => _onPlayingTap(item),
            ),
            if (item.inRoom > 0)
              Container(
                width: 54.dp,
                height: 54.dp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF926AFF), width: 1.5),
                ),
              ),
            if (item.inRoom > 0)
              PositionedDirectional(
                bottom: 0,
                child: Container(
                  padding: EdgeInsetsDirectional.only(start: 4.dp, end: 4.dp, top: 0.5.dp, bottom: 0.5.dp),
                  decoration: BoxDecoration(
                    color: const Color(0xFF926AFF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    item.miniIcon.boardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10.dp, color: Color(0xFF6CFFFF), fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            if (item.inRoom <= 0 && item.onlineStatus > 0)
              PositionedDirectional(
                end: 6.dp,
                bottom: 0,
                child: Container(
                  width: 10.dp,
                  height: 10.dp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF00FFCB),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onPlayingTap(RoomRcmdPlayingDataItem item) {
    Navigator.of(context).pop(null);
    if (item.inRoom > 0) {
      int rid = item.inRoom;
      int uid = item.uid;
      IRoomManager? roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager?.openChatRoomScreenShow(context, rid, uid: uid, refer: 'FriendsPlayingHeader');
    } else {
      IChatManager? chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager?.openUserChatScreen(
        context,
        type: 'private',
        targetId: item.uid,
        title: item.name,
      );
    }
  }

  /// 玩法切换
  Widget _buildRoomTypeSwitch(OptionSwitchData switchData) {
    if (switchData.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(switchData.title),
        SizedBox(
          width: _panelWith,
          height: 88.dp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsetsDirectional.only(start: 10.dp, end: 10..dp),
            itemBuilder: (context, index) => _buildRoomTypeSwitchItem(switchData.items[index]),
            itemCount: switchData.items.length,
          ),
        ),
        SizedBox(height: 32.dp),
      ],
    );
  }

  Widget _buildRoomTypeSwitchItem(OptionSwitchItem item) {
    return GestureDetector(
      onTap: () {
        _doSwitchRoomType(item);
      },
      child: Container(
        width: 76.dp,
        height: 88.dp,
        margin: EdgeInsetsDirectional.only(start: 4.dp, end: 4.dp),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CachedNetworkImage(imageUrl: item.icon, width: 76.dp, height: 88.dp),
            PositionedDirectional(
              bottom: 8.dp,
              child: Text(item.name, style: TextStyle(color: Colors.white, fontSize: 14.dp, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
