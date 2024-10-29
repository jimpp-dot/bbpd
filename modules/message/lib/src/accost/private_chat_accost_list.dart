import 'dart:math';

import 'package:message/k.dart';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:message/src/accost/widget/accost_list_msg_item.dart';
import 'package:message/src/controller/conversation_extra_info.dart';
import 'package:message/src/controller/conversation_user_info_mixin.dart';
import 'package:message/src/hilist/hilist_filter_panel.dart';
import 'package:message/src/model/private_hilist_model.dart';
import 'package:message/src/hilist/hilist_sort_util.dart';
import '../conversationOperateType.dart';
import '../messageItem.dart';
import '../../k.dart' as MsgK;

/// 私聊自动搭讪列表
class PrivateChatAccostList extends StatefulWidget {
  static const String routeName = '/PrivateChatAccostList';

  final List<Conversation> data;
  final OnConversationOperate onChanged;
  final OnAwaitRemoveList onReadAll;

  final String type;

  const PrivateChatAccostList(
      {super.key,
      required this.data,
      required this.onChanged,
      required this.onReadAll,
      required this.type});

  @override
  _PrivateChatAccostListState createState() {
    return _PrivateChatAccostListState();
  }

  static Future show(
      BuildContext context,
      List<Conversation>? data,
      OnConversationOperate onChanged,
      OnAwaitRemoveList onReadAll,
      String type) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PrivateChatAccostList(
        data: data ?? [],
        onChanged: onChanged,
        onReadAll: onReadAll,
        type: type,
      ),
      settings: const RouteSettings(name: routeName),
    ));
  }
}

class _PrivateChatAccostListState extends BaseScreenState<PrivateChatAccostList>
    with ConversationExtraInfo, ConversationUserInfoMixin {
  bool _scrollIdle = true;

  int _firstIndex = 0; //当前屏幕内可见的第一个条目索引
  int _lastIndex = 30; //当前屏幕内可见的最后一个条目索引

  final HiListFilterData _filterData = HiListFilterData.getDefault();

  final List<PrivateHiListModel> _dataList = [];

  final List<PrivateHiListModel> _todayList = [];
  final List<PrivateHiListModel> _historyList = [];

  final List<PrivateHiListModel> _originalList = [];

  int _hideCount = 0;

  final bool _showDeletedTips = false;

  final int _rid = 0; //我自己所在房间id，_rid>0 表示在房间中

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('MessageList.Changed', _onMessageListChanged);

    _syncWidgetData(inited: true);

    initExtra();
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar(
      K.msg_accost_remind,
      titleColor: R.colors.mainTextColor,
      statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      backColor: R.colors.mainTextColor,
      backgroundColor: R.colors.homeBgColor,
    );
  }

  @override
  Widget buildContent() => _renderBody();

  @override
  void onTapErrorWidget() => _loadOnline();

  @override
  Color getBgColor() => R.colors.homeBgColor;

  @override
  void dispose() {
    eventCenter.removeListener('MessageList.Changed', _onMessageListChanged);
    disposeExtra();
    super.dispose();
  }

  _onMessageListChanged(String type, dynamic value) async {
    if (!mounted) return;
    await _syncWidgetData();
  }

  Future _syncWidgetData({bool inited = false}) async {
    if (Util.isCollectionEmpty(widget.data)) {
      _dataList.clear();
      _todayList.clear();
      _historyList.clear();
      _originalList.clear();
      setScreenEmpty(handleEmptyTap: false);
    } else {
      _originalList.clear();
      for (Conversation conv in widget.data) {
        int targetId = Util.parseInt(conv.targetId);
        ImUserData? uData = getUserData(targetId);
        if (uData == null) {
          UserInfo? info = await CachedNames.instance()
              .get(targetId, conv.type, onlyCache: true);
          uData = UserInfo.toImUserData(info);
        }
        PrivateHiListModel model =
            PrivateHiListModel(conv, uData, getUserConfig(conv));
        _originalList.add(model);
      }
      _filter();
    }
    if (inited) _loadOnline();
  }

  void _filter() {
    List<PrivateHiListModel> list =
        HiListSortUtil.sortAndFilter(_filterData, _originalList);

    _dataList.clear();
    _dataList.addAll(list);

    _todayList.clear();
    _historyList.clear();
    for (PrivateHiListModel item in _dataList) {
      if (_isTodayMsg(item)) {
        _todayList.add(item);
      } else {
        _historyList.add(item);
      }
    }

    if (Util.isCollectionEmpty(_dataList)) {
      setScreenEmpty(handleEmptyTap: false);
    } else {
      if (_dataList.length < _originalList.length) {
        _hideCount = _originalList.length - _dataList.length;
      } else {
        _hideCount = 0;
      }
      setScreenReady();
    }
  }

  bool _isTodayMsg(PrivateHiListModel item) {
    DateTime time =
        DateTime.fromMillisecondsSinceEpoch(item.conversation.sentTime);
    DateTime now = DateTime.now();
    return time.year == now.year &&
        time.month == now.month &&
        time.day == now.day;
  }

  Widget _renderBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification) {
          UserScrollNotification user = notification;
          bool scrollIdle = user.direction == ScrollDirection.idle;
          if (scrollIdle != _scrollIdle && mounted) {
            _scrollIdle = scrollIdle;

            if (scrollIdle) _loadOnline();
          }
        }
        return false;
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 14),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            if (_hideCount > 0 || _showDeletedTips) _buildHeaderTips(),
            if (_todayList.isNotEmpty)
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: Text(
                    K.msg_today_accost,
                    style: TextStyle(
                        fontSize: 13,
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            if (_todayList.isNotEmpty)
              SliverFixedExtentList(
                itemExtent: 72,
                delegate: FixedExtentSliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    PrivateHiListModel model = _todayList.elementAt(index);
                    return AccostListMsgItem(
                      hiListModel: model,
                      onChanged: widget.onChanged,
                      onDeleteByInner: _onDeleteByInner,
                      rid: _rid,
                    );
                  },
                  childCount: _todayList.length,
                  addAutomaticKeepAlives: false,
                  semanticIndexOffset: 0,
                  onPositionChanged: _handlePositionChanged,
                  cacheCount: 0,
                ),
              ),
            if (_historyList.isNotEmpty)
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                    top: _todayList.isNotEmpty ? 25 : 0,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        K.msg_history_accost,
                        style: TextStyle(
                            fontSize: 13,
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          for (PrivateHiListModel item in _historyList) {
                            bool ok = await Im.removeConversation(
                                item.conversation.type,
                                item.conversation.targetId);
                            if (ok) {
                              widget.onChanged(
                                  ConversationOperateType.Delete,
                                  item.conversation.type,
                                  item.conversation.targetId);
                            }
                          }
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 1),
                          child: R.img(
                            'ic_accost_delete.svg',
                            package: ComponentManager.MANAGER_MESSAGE,
                            width: 16,
                            height: 16,
                            color: R.color.thirdTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (_historyList.isNotEmpty)
              SliverFixedExtentList(
                itemExtent: 72,
                delegate: FixedExtentSliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    PrivateHiListModel model = _historyList.elementAt(index);
                    return AccostListMsgItem(
                      hiListModel: model,
                      onChanged: widget.onChanged,
                      rid: _rid,
                    );
                  },
                  childCount: _historyList.length,
                  addAutomaticKeepAlives: false,
                  semanticIndexOffset: 0,
                  onPositionChanged: _handlePositionChanged,
                  cacheCount: 0,
                ),
              )
          ],
        ),
      ),
    );
  }

  void _onDeleteByInner(Conversation conv) {
    widget.data.remove(conv);
    _syncWidgetData();
  }

  Widget _buildHeaderTips() {
    if (_showDeletedTips) {
      return const DeletedUserTips();
    }

    return SliverToBoxAdapter(
      child: Container(
        height: 34,
        color: R.color.mainBrandColor.withOpacity(0.1),
        child: Center(
            child: Text(
          MsgK.K.msg_hi_list_hide_count([_hideCount.toString()]),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: R.color.mainBrandColor, fontSize: 13),
        )),
      ),
    );
  }

  void _handlePositionChanged(int firstIndex, int lastIndex) {
    _firstIndex = firstIndex;
    _lastIndex = lastIndex;
  }

  // 获取对应数据的用户或者群组的状态信息
  _loadOnline() async {
    if (!Util.isAppActive || !_scrollIdle || _dataList.isEmpty) {
      return;
    }
    _firstIndex = max(0, _firstIndex);
    _lastIndex = min(_dataList.length - 1, _lastIndex);

    Set<int> uids = {};
    for (int i = _firstIndex; i <= _lastIndex; i++) {
      Conversation conv = _dataList[i].conversation;
      if (conv.type == ConversationType.Private) {
        uids.add(Util.parseInt(conv.targetId));
      }
    }

    scheduleLoadUserInfo(uids, null, useCache: true);
  }

  void _updateHiListItem(ImCloudAllData? cloudAllData) {
    if (_originalList.isEmpty) return;

    for (var item in _originalList) {
      int uid = Util.parseInt(item.conversation.targetId);
      ImUserData? uData = getUserData(uid);
      if (uData != null) {
        item.userInfo = uData;
      }
      item.userConfig = getUserConfig(item.conversation);
    }
  }

  Future<void> deleteForbiddenConv(int uid) async {
    bool? ok =
        await Im.removeConversation(ConversationType.Private, uid.toString());
    if (ok == true) {
      widget.onChanged(ConversationOperateType.Delete, ConversationType.Private,
          uid.toString());
    }
  }

  @override
  void onUserInfoUpdate(ImCloudAllData? cloudAllData) {
    _updateHiListItem(cloudAllData);
    setScreenReady();
  }
}
