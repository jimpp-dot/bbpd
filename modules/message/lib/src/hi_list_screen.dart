import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:message/src/controller/conversation_extra_info.dart';
import 'package:message/src/controller/conversation_user_info_mixin.dart';

import 'conversationOperateType.dart';
import 'messageItem.dart';

typedef OnMessageListReload = Future Function();

class HiListArguments {
  final List<Conversation> data;
  final OnMessageListReload onReload;
  final String title;

  HiListArguments(this.data, this.onReload, this.title);
}

/// 临时群页面
class HiList extends StatefulWidget {
  static const String routeName = '/HiList';

  final List<Conversation> data;
  final OnConversationOperate? onChanged;
  final String? title;
  final OnAwaitRemoveList? onReadAll;

  /// 取值为ConversationType.Hi或者ConversationType.TempGroup，标识该页面是打招呼还是临时群
  final String? type;

  const HiList(
      {super.key,
      required this.data,
      this.title,
      this.onChanged,
      this.onReadAll,
      this.type});

  @override
  _HiListState createState() {
    return _HiListState();
  }

  static Future show(
      BuildContext context,
      List<Conversation>? data,
      String title,
      OnConversationOperate onChanged,
      OnAwaitRemoveList onReadAll,
      String type) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HiList(
        data: data ?? [],
        title: title,
        onChanged: onChanged,
        onReadAll: onReadAll,
        type: type,
      ),
      settings: const RouteSettings(name: routeName),
    ));
  }
}

class _HiListState extends State<HiList>
    with ConversationExtraInfo, ConversationUserInfoMixin {
  bool _scrollIdle = true;

  int _firstIndex = 0; //当前屏幕内可见的第一个条目索引
  int _lastIndex = 30; //当前屏幕内可见的最后一个条目索引

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('MessageList.Changed', _onMessageListChanged);

    //首次加载完，加载online数据
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadOnline();
    });

    initExtra();
  }

  @override
  void dispose() {
    eventCenter.removeListener('MessageList.Changed', _onMessageListChanged);
    disposeExtra();
    super.dispose();
  }

  _onMessageListChanged(String type, dynamic value) {
    if (!mounted) return;
    setState(() {});
  }

  void _onReadAllMessageTaped() async {
    for (int i = 0; i < widget.data.length; i++) {
      Conversation conv = widget.data[i];
      if (conv.unreadCount > 0) {
        await Im.clearMessagesUnreadStatus(conv.type, conv.targetId);
      }
    }

    if (widget.onReadAll != null) {
      widget.onReadAll!(widget.type ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        widget.title ?? K.say_hi,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        actionTitle: widget.type == ConversationType.Hi ? K.all_have_read : '',
        onPressed: () async {
          _onReadAllMessageTaped();
        },
      ),
      body: ScaffoldBody(
        child: widget.data.isEmpty
            ? EmptyWidget(
                desc: K.base_nothing_in_here,
                textColor: R.colors.secondTextColor,
              )
            : _renderBody(),
      ),
    );
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
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: MessageItem.ITEM_EXTENT,
              delegate: FixedExtentSliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Conversation conv = widget.data.elementAt(index);
                  UserConfig? config = getUserConfig(conv);

                  bool isLast = index == widget.data.length - 1;
                  return MessageItem(
                    conv: conv,
                    config: config,
                    isLast: isLast,
                    onChanged: widget.onChanged,
                    onDeleteByInner: _onDeleteByInner,
                    inHiList: true,
                    refer: const PageRefer('HiList'),
                  );
                },
                childCount: widget.data.length,
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
    refresh();
  }

  void _handlePositionChanged(int firstIndex, int lastIndex) {
    _firstIndex = firstIndex;
    _lastIndex = lastIndex;
  }

  // 获取对应数据的用户或者群组的状态信息
  Future<void> _loadOnline() async {
    if (!Util.isAppActive || !_scrollIdle || (widget.data.isEmpty)) {
      return;
    }
    _firstIndex = max(0, _firstIndex);
    _lastIndex = min(widget.data.length - 1, _lastIndex);

    Set<int> uids = {};
    Set<int> gids = {};
    for (int i = _firstIndex; i <= _lastIndex; i++) {
      if (_firstIndex < 0 || _lastIndex >= widget.data.length) continue;
      Conversation conv = widget.data[i];
      if (conv.type == ConversationType.Private) {
        uids.add(Util.parseInt(conv.targetId));
      } else if (conv.type == ConversationType.Group) {
        gids.add(Util.parseInt(conv.targetId));
      }
    }

    await scheduleLoadUserInfo(uids, gids, useCache: true);
  }

  @override
  void onUserInfoUpdate(ImCloudAllData? cloudAllData) {
    if (mounted) setState(() {});
  }
}
