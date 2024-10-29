import 'dart:async';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/new_room_privilege/model/new_room_privilege_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'model/generated/privilege_rookie.pb.dart';
import 'model/new_room_privilege_tab_item.dart';
import 'new_room_choose_anchor_bottom_sheet.dart';

/// 新人房间互动权益页面

const int _t_day = 86400;
const int _t_hour = 3600;
const int _t_min = 60;

class NewRoomInteractPrivilegeBottomSheet extends StatefulWidget {
  final ChatRoomData room;

  const NewRoomInteractPrivilegeBottomSheet({Key? key, required this.room})
      : super(key: key);

  @override
  State<NewRoomInteractPrivilegeBottomSheet> createState() =>
      _NewRoomInteractPrivilegeBottomSheetState();

  /// 打开新人房间互动权益页面
  static Future<bool?> show(BuildContext context,
      {Key? key, required ChatRoomData room}) async {
    return await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black38,
      fullscreenDialog: true,
      builder: (context) =>
          NewRoomInteractPrivilegeBottomSheet(key: key, room: room),
    );
  }
}

class _NewRoomInteractPrivilegeBottomSheetState
    extends State<NewRoomInteractPrivilegeBottomSheet>
    with SingleTickerProviderStateMixin<NewRoomInteractPrivilegeBottomSheet> {
  final List<NewRoomPrivilegeTabItem> _tabs = [];
  ExtendedTabController? _tabController;
  int _curTabIndex = 0;
  int _day = 0;
  var timeText = '';
  Timer? _timer;
  int _countDown = 0;

  RookiePrivilegeConfig? _data;
  var errMsg = '';

  @override
  void initState() {
    super.initState();
    _loadData(initial: true);
  }

  void _loadData({bool initial = false}) {
    NewRoomPrivilegeRepo.privilegeConfig(widget.room.rid).then((resp) {
      errMsg = '';
      if (resp.success && resp.hasData() && mounted) {
        setState(() {
          _data = resp.data;
          _day = _data?.day ?? 0;
          _countDown = int.parse('${_data?.expireDuration ?? 0}');
          timeText = getDateDiff(_countDown, initial: initial);
          if (_tabs.isEmpty &&
              _data != null &&
              _data?.list.isNotEmpty == true) {
            for (int i = 0; i < (_data?.list.length ?? 0); i++) {
              RookiePrivilegeDayList? privilegeDayList = _data?.list[i];
              _tabs.add(NewRoomPrivilegeTabItem(
                  name: privilegeDayList?.tab ??
                      K.room_some_day([(i + 1).toString()]),
                  selected: i == (_day >= (_data?.list.length ?? 0) ? 0 : _day)
                      ? true
                      : false));
            }
          }
        });
        _initTabs();
      }
      if (!resp.success &&
          resp.hasMessage() &&
          resp.message.isNotEmpty &&
          mounted) {
        setState(() {
          errMsg = resp.message;
        });
      }
    });
  }

  String getDateDiff(int time, {bool initial = false}) {
    int diff = time;
    if (diff <= 0) {
      return '';
    } else if (diff > _t_day) {
      int day = diff ~/ _t_day;
      return K.room_few_day(['$day']);
    } else {
      int hour = diff ~/ _t_hour;
      int min = (diff ~/ _t_min) - hour * 60;
      String text =
          '${hour < 10 ? '0$hour' : '$hour'}:${min < 10 ? '0$min' : '$min'}';
      if (initial) {
        _startCountDownTask();
      }
      return text;
    }
  }

  /// 开始倒计时任务
  void _startCountDownTask() {
    _cancelTask();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countDown -= 1;
      if (_countDown <= 0) {
        _cancelTask();
        // 时间结束
        timeText = K.room_has_end;
      } else {
        timeText = getDateDiff(_countDown);
      }
      refresh();
    });
  }

  void _cancelTask() {
    if (_timer == null) return;
    if (_timer?.isActive == true) _timer?.cancel();
    _timer = null;
  }

  void _initTabs() {
    if (_tabController != null) return;
    if (_tabs.isEmpty || _data == null) return;
    safeRun(
      () => _tabController = ExtendedTabController(
        initialIndex: _day >= (_data?.list.length ?? 0) ? 0 : _day,
        length: _tabs.length,
        vsync: this,
      )..addListener(_onTabChanged),
    );
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    _cancelTask();
    super.dispose();
  }

  _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
    setState(() {
      _curTabIndex = _tabController?.index ?? 0;
      for (int i = 0; i < _tabs.length; i++) {
        _tabs[i].selected = false;
      }
      _tabs[_curTabIndex].selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height - 224 - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage(RoomAssets
              .chat_room$new_room_privilege_new_room_privilege_bg_webp),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: Util.width,
            height: 44,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// 标题
                Text(
                  K.room_new_room_interact_privilege_nav_title,
                  style: R.textStyle.medium18,
                ),

                if (timeText.isNotEmpty)
                  PositionedDirectional(
                    top: 10,
                    start: 12,
                    child: Container(
                      height: 26,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 13),
                          children: <InlineSpan>[
                            TextSpan(
                              text: timeText,
                              style: const TextStyle(color: Color(0xFFFF5F7D)),
                            ),
                            TextSpan(
                              text: K.room_how_much_time_after_disappear,
                              style: TextStyle(
                                  color:
                                      R.color.mainTextColor.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                /// 规则说明
                PositionedDirectional(
                  top: 10,
                  end: 12,
                  width: 22,
                  height: 22,
                  child: GestureDetector(
                    onTap: () {
                      String url = Util.getHelpUrlWithQStr('k122');
                      BaseWebviewScreen.show(context, url: url);
                    },
                    child: R.img(RoomAssets.chat_room$ic_info_svg,
                        color: Colors.white, width: 22, height: 22),
                  ),
                ),
              ],
            ),
          ),
          if (errMsg.isNotEmpty)
            Expanded(
              child: ErrorData(
                error: errMsg,
                onTap: () => _loadData(initial: _data == null),
              ),
            )
          else ...[
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 5, bottom: 10, start: 16, end: 16),
              child: Text(
                _data?.desc ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.6),
                    fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _buildTab(),
                  if (_tabController != null &&
                      _data != null &&
                      _tabs.isNotEmpty)
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          for (int i = 0; i < _tabs.length; i++)
                            _NewRoomInteractPrivilegeTabBarView(
                              index: i,
                              room: widget.room,
                              item: _data?.list[i],
                              isOpenAuthority: _data?.privilege == 1,
                              currentDay: _data?.day ?? 0,
                              refreshCallback: _loadData,
                            )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (_data != null && _data?.privilege == 0) ...[
              Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        _data?.tips ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: R.color.mainTextColor.withOpacity(0.6),
                            fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();

                          /// 去打开礼物面板进行打赏
                          IGiftManager giftManager = ComponentManager.instance
                              .getManager(ComponentManager.MANAGER_GIFT);
                          giftManager.showRoomGiftPanel(context,
                              room: widget.room);
                        },
                        child: Container(
                          height: 52,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            gradient: LinearGradient(
                                colors: R.color.mainBrandGradientColors),
                          ),
                          child: Text(
                            K.room_open_now,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            MediaQuery.of(context).padding.bottom > 0 ? 0 : 10),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).padding.bottom,
                color: Colors.transparent,
              )
            ]
          ]
        ],
      ),
    );
  }

  Widget _buildTab() {
    return _tabs.isNotEmpty && _tabs.length > 1
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 32,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0x4DF6F7F9),
                borderRadius: BorderRadius.circular(19),
              ),
              child: CommonTabBar(
                tabs: [
                  for (int i = 0; i < _tabs.length; i++)
                    Tab(
                      child: Container(
                        width: (Util.width - 36) / _tabs.length,
                        height: 28,
                        alignment: AlignmentDirectional.center,
                        decoration: _tabs[i].selected
                            ? BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17))
                            : null,
                        child: Text(_tabs[i].name ?? ''),
                      ),
                    ),
                ],
                isScrollable: false,
                controller: _tabController,
                labelColor: R.color.mainTextColor,
                labelStyle: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
                unselectedLabelColor: R.color.mainTextColor,
                unselectedLabelStyle:
                    TextStyle(color: R.color.mainTextColor, fontSize: 13),
                indicator: const CommonUnderlineTabIndicator(
                  borderSide: BorderSide(width: 0.0, color: Colors.white),
                  insets: EdgeInsetsDirectional.only(bottom: 0),
                  wantWidth: 12,
                  draggingWidth: 12.0,
                ),
                indicatorWeight: 0,
                marginStart: 0,
                marginEnd: 0,
                labelPadding:
                    const EdgeInsetsDirectional.only(start: 0, end: 0),
              ),
            ),
          )
        : Container();
  }
}

class _NewRoomInteractPrivilegeTabBarView extends StatefulWidget {
  final int index;
  final ChatRoomData room;
  final RookiePrivilegeDayList? item;
  final bool isOpenAuthority;
  final int currentDay;
  final VoidCallback? refreshCallback;

  const _NewRoomInteractPrivilegeTabBarView({
    this.index = 0,
    required this.room,
    this.item,
    required this.isOpenAuthority,
    this.currentDay = 0,
    this.refreshCallback,
  });

  @override
  State<_NewRoomInteractPrivilegeTabBarView> createState() =>
      _NewRoomInteractPrivilegeTabBarViewState();
}

class _NewRoomInteractPrivilegeTabBarViewState
    extends State<_NewRoomInteractPrivilegeTabBarView> {
  @override
  Widget build(BuildContext context) {
    if (widget.item == null || widget.item?.list.isEmpty == true)
      return const EmptyWidget(size: 150);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: _buildItemWidget,
      itemCount: widget.item?.list.length,
    );
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    RookiePrivilegeItem? cell = widget.item?.list[index];
    return cell != null
        ? Column(
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  cell.type == 1
                                      ? K.room_single_person
                                      : K.room_all_mic,
                                  style: const TextStyle(
                                      color: Color(0xFF8369FD), fontSize: 14),
                                ),
                              ),
                              Container(
                                width: 0.5,
                                height: 12,
                                color: R.color.dividerColor.withOpacity(0.4),
                              ),
                              const SizedBox(width: 34),
                              Expanded(
                                child: Text(
                                  cell.name,
                                  style: TextStyle(
                                      color: R.color.mainTextColor,
                                      fontSize: 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          if (widget.index > widget.currentDay ||
                              cell.status == 2) return;
                          if (!widget.isOpenAuthority) {
                            Fluttertoast.showCenter(
                                msg: K
                                    .room_not_open_authority_new_room_privilege);
                            return;
                          }
                          if (cell.type == 2) {
                            // 全麦
                            var targets = '';
                            if (widget.room.positions.isNotEmpty) {
                              for (final RoomPosition item
                                  in widget.room.positions) {
                                if (item.uid == Session.uid) {
                                  continue;
                                }
                                if (item.name.isNotEmpty) {
                                  targets += '${item.uid},';
                                }
                              }
                            }
                            if (targets.isEmpty) {
                              Fluttertoast.showCenter(
                                  msg: K.room_mic_empty_tip);
                              return;
                            }
                            NormalNull resp =
                                await NewRoomPrivilegeRepo.privilegeUse(
                                    widget.room.rid, cell.id, targets);
                            if (resp.success) {
                              if (widget.refreshCallback != null) {
                                widget.refreshCallback!();
                              }
                              Fluttertoast.showCenter(msg: K.room_use_succ);
                            } else {
                              Fluttertoast.showCenter(
                                  msg: resp.msg.isNotEmpty == true
                                      ? resp.msg
                                      : K.room_use_fail);
                            }
                          } else {
                            // 单人，则去选择主播
                            bool? success =
                                await NewRoomChooseAnchorBottomSheet.show(
                              context,
                              room: widget.room,
                              privilegeId: cell.id,
                            );
                            if (success == true) {
                              widget.refreshCallback?.call();
                            }
                          }
                        },
                        child: Container(
                          width: 63,
                          height: 28,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors
                                  .map(
                                    (e) => e.withOpacity(
                                        (widget.index > widget.currentDay ||
                                                cell.status == 2)
                                            ? 0.5
                                            : 1),
                                  )
                                  .toList(),
                            ),
                          ),
                          child: Text(
                            widget.index > widget.currentDay
                                ? K.room_ununlocked
                                : (cell.status == 2
                                    ? K.room_used
                                    : K.room_topic_to_use),
                            style: TextStyle(
                              color: Colors.white.withOpacity(
                                  (widget.index > widget.currentDay ||
                                          cell.status == 2)
                                      ? 0.5
                                      : 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
