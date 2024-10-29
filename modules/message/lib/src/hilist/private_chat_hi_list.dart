import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:message/src/controller/conversation_extra_info.dart';
import 'package:message/src/controller/conversation_user_info_mixin.dart';
import 'package:message/src/hilist/hilist_filter_panel.dart';
import 'package:message/src/hilist/hilist_message_item.dart';
import 'package:message/src/model/private_hilist_model.dart';
import 'package:message/src/hilist/hilist_sort_util.dart';

import '../conversationOperateType.dart';
import '../messageItem.dart';
import '../../k.dart' as MsgK;

typedef OnMessageListReload = Future Function();

class HiListArguments {
  final List<Conversation> data;
  final OnMessageListReload onReload;
  final String title;

  HiListArguments(this.data, this.onReload, this.title);
}

/// 私聊用户打招呼列表
class PrivateChatHiList extends StatefulWidget {
  static const String routeName = '/PrivateChatHiList';

  final List<Conversation>? data;
  final OnConversationOperate onChanged;
  final String? title;
  final OnAwaitRemoveList onReadAll;

  /// 取值为ConversationType.Hi或者ConversationType.TempGroup，标识该页面是打招呼还是临时群
  final String type;

  const PrivateChatHiList(
      {super.key,
      required this.data,
      this.title,
      required this.onChanged,
      required this.onReadAll,
      required this.type});

  @override
  _PrivateChatHiListState createState() => _PrivateChatHiListState();

  static Future show(
      BuildContext context,
      List<Conversation>? data,
      String title,
      OnConversationOperate onChanged,
      OnAwaitRemoveList onReadAll,
      String type) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PrivateChatHiList(
        data: data,
        title: title,
        onChanged: onChanged,
        onReadAll: onReadAll,
        type: type,
      ),
      settings: const RouteSettings(name: routeName),
    ));
  }
}

class _PrivateChatHiListState extends BaseScreenState<PrivateChatHiList>
    with ConversationExtraInfo, ConversationUserInfoMixin {
  bool _scrollIdle = true;

  int _firstIndex = 0; //当前屏幕内可见的第一个条目索引
  int _lastIndex = 30; //当前屏幕内可见的最后一个条目索引

  HiListFilterData _filterData = HiListFilterData.getDefault();

  final List<PrivateHiListModel> _dataList = [];

  final List<PrivateHiListModel> _originalList = [];

  int _hideCount = 0;

  bool _showDeletedTips = false;

  final int _rid = 0; //我自己所在房间id，_rid>0 表示在房间中

  static const LOG_TAG = "PrivateChatHiList";

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('MessageList.Changed', _onMessageListChanged);

    _syncWidgetData(inited: true);

    initExtra();
  }

  @override
  PreferredSizeWidget buildAppBar() {
    List<Widget> actions = getAppBarActions(context);
    return BaseAppBar.custom(
      title: Text(
        widget.title ?? K.say_hi,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: R.colors.mainTextColor),
      ),
      actions: actions,
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

  void _onMessageListChanged(String type, dynamic value) async {
    if (!mounted) return;
    _syncWidgetData();
  }

  void _syncWidgetData({bool inited = false}) async {
    if (Util.isCollectionEmpty(widget.data)) {
      _dataList.clear();
      _originalList.clear();
      setScreenEmpty(handleEmptyTap: false);
    } else {
      _originalList.clear();
      for (Conversation conv in widget.data!) {
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

  void _onReadAllMessageTaped() async {
    for (int i = 0; i < _dataList.length; i++) {
      Conversation conv = _dataList[i].conversation;
      if (conv.unreadCount > 0) {
        await Im.clearMessagesUnreadStatus(conv.type, conv.targetId);
      }
    }
    widget.onReadAll(widget.type);
  }

  List<Widget> getAppBarActions(BuildContext context) {
    List<Widget> actions = [];
    actions.add(Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Text(
            K.all_have_read,
            textAlign: TextAlign.center,
            style: TextStyle(color: R.colors.mainTextColor, fontSize: 16),
          ),
        ),
        onTap: () async {
          _onReadAllMessageTaped();
        },
      ),
    ));

    actions.add(const SizedBox(
      width: 4,
    ));

    if (!Util.isCollectionEmpty(_originalList)) {
      actions.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 18),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: R.img("messaage_filter.png",
                color: R.colors.secondTextColor,
                package: ComponentManager.MANAGER_MESSAGE,
                width: 24,
                height: 24),
          ),
          onTap: () async {
            HiListFilterData? data =
                await HiListFilterPanel.show(context, filterData: _filterData);
            if (data == null) {
              Log.d(tag: LOG_TAG, "HiListFilterData is null.....");
              return;
            }

            if (_filterData.equals(data)) {
              Log.d(tag: LOG_TAG, "HiListFilterData equals current...");
              return;
            }
            _showDeletedTips = false;
            _filterData = data;
            Log.d(tag: LOG_TAG, "HiListFilterData = ${data.toString()}");
            _filter();
            _loadOnline();
          },
        ),
      ));
    }

    return actions;
  }

  Widget _renderBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification) {
          UserScrollNotification user = notification;
          bool scrollIdle = user.direction == ScrollDirection.idle;
          Log.d(
              'PrivateChatHiList scroll state changed, scrollIdle: $_scrollIdle, newIdle: $scrollIdle');
          if (scrollIdle != _scrollIdle && mounted) {
            _scrollIdle = scrollIdle;

            if (scrollIdle) _loadOnline();
          }
        }
        return false;
      },
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          if (_hideCount > 0 || _showDeletedTips) _buildHeaderTips(),
          SliverFixedExtentList(
            itemExtent: 150,
            delegate: FixedExtentSliverChildBuilderDelegate(
              (BuildContext context, int index) {
                PrivateHiListModel model = _dataList.elementAt(index);
                return HiListMessageItem(
                  hiListModel: model,
                  onChanged: widget.onChanged,
                  onDeleteByInner: _onDeleteByInner,
                  rid: _rid,
                );
              },
              childCount: _dataList.length,
              addAutomaticKeepAlives: false,
              semanticIndexOffset: 0,
              onPositionChanged: _handlePositionChanged,
              cacheCount: 0,
            ),
          )
        ],
      ),
    );
  }

  void _onDeleteByInner(Conversation conv) {
    widget.data?.remove(conv);
    _syncWidgetData();
  }

  Widget _buildHeaderTips() {
    if (_showDeletedTips) {
      return const DeletedUserTips();
    }

    return SliverToBoxAdapter(
      child: Container(
        height: 34,
        color: R.colors.mainBrandColor.withOpacity(0.1),
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
            child: Text(
          MsgK.K.msg_hi_list_hide_count([_hideCount.toString()]),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: R.colors.mainBrandColor, fontSize: 13),
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

  void _updateHiListItem() {
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
    bool ok =
        await Im.removeConversation(ConversationType.Private, uid.toString());
    if (ok) {
      widget.onChanged(ConversationOperateType.Delete, ConversationType.Private,
          uid.toString());
    }
  }

  @override
  void onUserInfoUpdate(ImCloudAllData? cloudAllData) {
    _updateHiListItem();
    setScreenReady();
  }
}
