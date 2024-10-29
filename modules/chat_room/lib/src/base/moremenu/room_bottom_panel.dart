import 'dart:ui';

import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/moremenu/room_more_menu_repos.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../k.dart';
import '../../protobuf/generated/room_bottom_panel.pb.dart';
import 'constant.dart';

/// 房间更多菜单弹窗
class RoomBottomPanel extends StatefulWidget {
  final ChatRoomData room;

  const RoomBottomPanel({Key? key, required this.room}) : super(key: key);

  static Future openRoomBottomMenu(BuildContext context, ChatRoomData room, {Key? key}) {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.transparent,
      disableTapDismissible: true,
      maxHeightRatio: 0.7,
      builder: (BuildContext context) {
        return RoomBottomPanel(key: key, room: room);
      },
    );
  }

  @override
  RoomBottomPanelState createState() => RoomBottomPanelState();
}

class RoomBottomPanelState extends State<RoomBottomPanel> {
  bool _isLoading = true;
  final List<ResRoomPluginPanel_PanelConf> panelList = [];
  final ValueNotifier<bool> _closeEffectState = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _load();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadGeneralSettingData();
    });
  }

  void _load() async {
    ResRoomPluginPanel rsp = await RoomMoreMenuRepos.getRoomBottomPanelData(widget.room.rid);
    if (rsp.success) {
      _isLoading = false;
      panelList.clear;
      panelList.addAll(rsp.data.list);
    } else {}
    refresh();
  }

  /// 加载获取通用设置
  void _loadGeneralSettingData() async {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    bool closeSpecialEffectsScene = await settingManager.getCloseSpecialEffectsSceneFromGeneralSetting();
    _closeEffectState.value = closeSpecialEffectsScene;
  }

  /// 开启/关闭特效
  _handleSpecialEffect(BuildContext context, ChatRoomData room, ResRoomPluginPanel_PanelItem item) async {
    try {
      ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
      NormalNull resp = await settingManager.setGeneralSetting(0, _closeEffectState.value == true ? 0 : 1);
      if (resp.success) {
        _loadGeneralSettingData();
        Session.sync({});
        Fluttertoast.showCenter(msg: K.room_set_success);
        Future.delayed(const Duration(milliseconds: 500), () {
          room.emit(RoomConstant.Event_Refresh);
        });
      } else {
        Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    double spacing = (Util.width - 20 * 2 - 5 * 48) / 4;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: Util.width,
          constraints: BoxConstraints(minHeight: 238, maxHeight: Util.height * 0.75),
          decoration: BoxDecoration(
            color: const Color(0xFF171621).withOpacity(0.7),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: IntrinsicHeight(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildMenuContent(spacing),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuContent(double spacing) {
    List<Widget> widgetList = <Widget>[];
    if (_isLoading) {
      widgetList.add(const SizedBox.shrink());
      return widgetList;
    }

    if (panelList.isNotEmpty) {
      for (var menu in panelList) {
        List<Widget> menuWidgetList = createMenuList(menu.itemList);
        widgetList.add(_buildCategoryTitle(menu.title));
        for (var i = 0; i < menuWidgetList.length; i += 5) {
          final isLast = i + 5 >= menuWidgetList.length;
          final end = isLast ? menuWidgetList.length : i + 5;
          widgetList.add(_buildMenuRow(menuWidgetList.sublist(i, end), spacing));
        }
      }
    }
    return widgetList;
  }

  Widget _buildMenuRow(List<Widget> menuList, double spacing) {
    List<Widget> children = [];
    for (int i = 0; i < menuList.length; i++) {
      children.add(menuList[i]);
      if (i != menuList.length - 1) {
        children.add(SizedBox(width: spacing));
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _buildCategoryTitle(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 15, bottom: 5),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  List<Widget> createMenuList(List<ResRoomPluginPanel_PanelItem> itemList) {
    return itemList
        .map((item) => (item.key == ConstantMenu.SPECIAL_EFFECT)
            ? ValueListenableBuilder<bool>(
                valueListenable: _closeEffectState,
                builder: (context, value, child) {
                  return _MenuItem(
                    icon: value == true
                        ? RoomAssets.chat_room$room_more_close_room_special_effect_webp
                        : RoomAssets.chat_room$room_more_open_room_special_effect_webp,
                    text: value == true ? K.room_open_special_effect : K.room_close_special_effect,
                    type: item.key,
                    onTaped: () => _handleSpecialEffect(context, widget.room, item),
                  );
                })
            : _MenuItem(
                icon: Util.getRemoteImgUrl(item.icon),
                text: item.name,
                type: item.key,
                showRedDot: widget.room.moreMenuController.showRedDot(widget.room, item),
                onTaped: () => widget.room.moreMenuController.handleTapItem(item, context, widget.room)))
        .toList();
  }
}

class _MenuItem extends StatelessWidget {
  final String? icon;
  final String? text;
  final GestureTapCallback? onTaped;
  final bool showRedDot;
  final String type;

  const _MenuItem({Key? key, required this.type, this.icon, this.text, this.onTaped, this.showRedDot = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: [
              R.img(icon, width: 68, height: 68),
              if (showRedDot == true)
                const PositionedDirectional(
                  end: 0,
                  top: 0,
                  child: RedDot(width: 10, height: 10),
                ),
            ],
          ),
          const SizedBox(height: 8),
          LimitedBox(
            maxWidth: 70,
            child: Text(
              text ?? '',
              style: const TextStyle(color: Colors.white, fontSize: 12, height: 1.1),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
