import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/fansLabel.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/fans/repo/fans_group_repository.dart';

import 'join_fans_group_screen.dart';

/// 房间输入框下面的粉丝牌列表
class FansLabelPanel extends StatefulWidget {
  final int rid;

  const FansLabelPanel({Key? key, required this.rid}) : super(key: key);

  @override
  _FansLabelPanelState createState() => _FansLabelPanelState();
}

class _FansLabelPanelState extends BaseScreenState<FansLabelPanel> {
  List<FansLabelItemData>? _list;
  int _selectedIndex = 0;

  double _radio = 166 / 90;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    FansLabelListResp resp = await FansGroupRepo.getFansLabels(widget.rid);
    if (resp.success == true) {
      if (!Util.isCollectionEmpty(resp.data?.list)) {
        _list = resp.data?.list;
        setScreenReady();
      } else {
        setScreenEmpty();
      }
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:
          EdgeInsetsDirectional.only(top: 8, bottom: Util.iphoneXBottom + 8),
      child: buildStatusContent(),
    );
  }

  List<Widget> _getItems() {
    List<Widget> children = [];
    for (int i = 0; i < _list!.length; i++) {
      FansLabelItem item = FansLabelItem(
        data: _list![i],
        isCurrentRoom: _list![i].rid == widget.rid,
        selected: _selectedIndex == i,
        index: i,
        callback: _onItemSelected,
        onItemLayout: _onItemLayout,
      );
      children.add(item);
    }

    return children;
  }

  void _onItemLayout(double r) {
    Log.d('_onItemLayout = $r');
    if (r > 0 && _radio != r) {
      _radio = r;
      setState(() {});
    }
  }

  void _onItemSelected(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      setState(() {});
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GridView.count(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, bottom: 0, top: 0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: _radio,
            children: _getItems(),
          ),
        ),
        Container(
          height: 1,
          width: Util.width,
          color: R.color.dividerColor,
        ),
        _buildUserInfo()
      ],
    );
  }

  Container _buildUserInfo() {
    FansLabelItemData item = _list![_selectedIndex];

    return Container(
      height: 64,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid,
                  refer: const PageRefer('FansLabelPanel'));
            },
            child: CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
              size: 52,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              item.name ?? '',
              style: const TextStyle(color: Color(0xFF313131), fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ..._getRightButton(item),
          const SizedBox(
            width: 12,
          ),
          InkWell(
              onTap: () {
                //跳转粉丝积分和粉丝牌说明页
                BaseWebviewScreen.show(context,
                    url: Util.getHelpUrlWithQStr('k29'));
              },
              child: R.img("room_fans_question_sign.png",
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  width: 20,
                  height: 20)),
        ],
      ),
    );
  }

  List<Widget> _getRightButton(FansLabelItemData itemData) {
    List<Widget> list = [const SizedBox.shrink()];
    bool current = itemData.rid == widget.rid;
    if (current) {
      if (!itemData.isJoin && itemData.uid != Session.uid) {
        list = [
          const SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              JoinFansGroupScreen.show(context, rid: itemData.rid);
            },
            child: Container(
              width: 110,
              height: 40,
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors)),
              child: Center(
                child: Text(
                  K.room_join_fans_group_now,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ];
      }
    } else {
      if (itemData.isLive) {
        list = [
          const SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () {
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openChatRoomScreenShow(context, itemData.rid,
                  from: RoomFrom.fans_label_panel,
                  refer: "fans_label_panel",
                  uid: itemData.uid);
            },
            child: Container(
              height: 40,
              width: 110,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(
                    colors: [Color(0xFF47ABFC), Color(0xFFBD75FF)]),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RepaintBoundary(
                      child: R.img(
                        'in_room_status.webp',
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 15,
                        height: 15,
                      ),
                    ),
                    Text(
                      K.room_game_live_ing,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      }
    }

    return list;
  }
}

typedef FansLabelItemSelected = Function(int index);
typedef OnItemLayout = Function(double radio);

class FansLabelItem extends StatefulWidget {
  final FansLabelItemData data;
  final bool isCurrentRoom;
  final bool selected;
  final int index;
  final FansLabelItemSelected? callback;
  final OnItemLayout onItemLayout;

  const FansLabelItem(
      {Key? key,
      required this.data,
      this.isCurrentRoom = false,
      this.selected = false,
      required this.index,
      required this.callback,
      required this.onItemLayout})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FansLabelItemState();
  }
}

class _FansLabelItemState extends State<FansLabelItem> {
  final GlobalKey _textColumnKey = GlobalKey();

  double _containerWidth = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      if (!mounted) return;
      RenderBox? rowRenderBox =
          _textColumnKey.currentContext?.findRenderObject() as RenderBox?;

      double height = rowRenderBox?.size.height ?? 0;
      if (height > 0 && _containerWidth > 0) {
        double width = (Util.width - 16 * 2 - 12) / 2;
        widget.onItemLayout(width / (height + 5));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return _buildItem(constraints.maxWidth);
    });
  }

  Widget _buildItem(double width) {
    Widget topWidget = Container();

    _containerWidth = width;

    double padding = 0.0;
    if (widget.isCurrentRoom) {
      topWidget = _buildCurrentRoom();
    } else if (widget.data.isLive) {
      topWidget = _buildLive();
      padding = 4.0;
    }

    return InkWell(
      onTap: () {
        if (widget.callback != null) {
          widget.callback!(widget.index);
        }
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: widget.selected
                ? R.color.mainBrandColor.withOpacity(0.08)
                : Colors.white,
            border: Border.all(
                color: widget.selected
                    ? R.color.mainBrandColor
                    : const Color(0xFFF6F7F9),
                width: 1)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PositionedDirectional(
                start: padding, top: padding, child: topWidget),
            Column(
              mainAxisSize: MainAxisSize.min,
              key: _textColumnKey,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FansLabel(
                  widget.data.labelName,
                  widget.data.levelImg,
                  Util.parseColors(widget.data.colors),
                  height: 24,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  K.room_fans_today_credit(['${widget.data.creditToday}']),
                  style: TextStyle(
                      color: const Color(0xFF313131).withOpacity(0.4),
                      fontSize: 11),
                ),
                Text(
                  K.room_fans_level_credit([
                    '${widget.data.level}',
                    '${widget.data.creditTotal}',
                    '${widget.data.creditLevel}'
                  ]),
                  style: TextStyle(
                      color: const Color(0xFF313131).withOpacity(0.4),
                      fontSize: 11),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLive() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      height: 20,
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFF47ABFC), Color(0xFFBD75FF)])),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            child: R.img(
              'in_room_status.webp',
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 15,
              height: 15,
            ),
          ),
          Text(
            K.room_game_live_ing,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentRoom() {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(12),
            bottomEnd: Radius.circular(12),
          ),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors)),
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: Center(
        child: Text(
          K.room_current_room_in,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
}
