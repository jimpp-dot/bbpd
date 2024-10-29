import 'dart:math';
import 'dart:convert';
import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../../../../k.dart';
import '../../../chatRoomData.dart';
import '../../../protobuf/generated/drainage.pb.dart';
import '../../../protobuf/generated/relate_room_msg.pb.dart';
import '../../config.dart';
import '../../message/throttle_queue.dart';
import '../fade_animation_widget.dart';
import 'common_message_item.dart';
import 'common_message_tab_change.dart';
import 'new_message_logic.dart';
import 'relate_room_option.dart';

/// 关联房间公屏
class CommonMessageListRelate extends StatefulWidget {
  final ChatRoomData room;

  /// 关联房间rid
  final int relateRid;
  final int pullMsgInterval;

  /// 当前Tab房间信息：type/permission等
  final RoomDrainageData drainageData;

  const CommonMessageListRelate({
    required Key key,
    required this.room,
    required this.relateRid,
    required this.pullMsgInterval,
    required this.drainageData,
  }) : super(key: key);

  @override
  CommonMessageListRelateState createState() {
    return CommonMessageListRelateState();
  }
}

class CommonMessageListRelateState extends State<CommonMessageListRelate>
    with CommonMessageTabChange
    implements QueueConsumer {
  late ScrollController _controller;
  final ThrottleQueue _messageQueue = ThrottleQueue();
  bool _scrollLock = false;
  bool _scrolling = false;
  static const int _scrollEndAnimationDuration = 250;

  late Timer timer;

  int lastMsgId = 0;
  int onLineNum = 0;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(_onScroll);

    _messageQueue.setThrottleDuration(widget.room.msgAppearRate,
        _scrollEndAnimationDuration, widget.room.msgAppearFlushNum);
    _messageQueue.queueConsumer = this;

    load();

    /// 轮询时间服务端下发（最小5s），再加本地500ms随机
    int interval = widget.pullMsgInterval;
    if (interval < 5) {
      interval = 5;
    }
    int duration = interval * 1000 + Random().nextInt(500);
    timer = Timer.periodic(Duration(milliseconds: duration), (timer) {
      load();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _messageQueue.dispose();
    timer.cancel();
    super.dispose();
  }

  bool isLoading = false;
  void load() async {
    if (isLoading || !mounted) {
      return;
    }

    if (Util.appState != AppLifecycleState.resumed) {
      /// app在后台不拉取
      return;
    }

    isLoading = true;

    bool isEmpty = _messageQueue.widgetDataListLength == 0;
    String url = '${System.domain}go/room/room/historyMsg';
    try {
      XhrResponse response = await Xhr.postPb(
          url, {'rid': '${widget.relateRid}', 'msgid': '$lastMsgId'});
      if (!mounted) {
        return;
      }
      ResRoomHistoryMsg msgs = ResRoomHistoryMsg.fromBuffer(response.bodyBytes);
      if (msgs.success == true) {
        if (onLineNum != msgs.onlineNum) {
          setState(() {
            onLineNum = msgs.onlineNum;
          });
        }
      }

      if (Util.validList(msgs.data)) {
        List<MessageContent> list = [];
        for (RoomHistoryMsg msg in msgs.data) {
          MessageContent? content = await changeMessages(msg.content);
          if (content != null) {
            list.add(content);
          }
          lastMsgId = msg.msgId.toInt();
        }

        if (Util.validList(list)) {
          if (isEmpty) {
            _messageQueue.initMsgList(list);
          } else {
            if (!_messageQueue.hasStartConsumer()) {
              if (Get.isRegistered<NewMessageLogic>()) {
                NewMessageLogic newMessageLogic = Get.find<NewMessageLogic>();
                newMessageLogic.change(widget.relateRid, true);
              }
            }
            for (MessageContent con in list) {
              _messageQueue.addLastThrottleMsg(con);
            }
          }
        }
      }
    } catch (e) {
      Log.d('BbMessageListRelateState load, id: $lastMsgId, error: $e');
    }

    isLoading = false;
  }

  Future<MessageContent?> changeMessages(String jsonString) async {
    try {
      Map content = json.decode(jsonString);
      Map extra;
      if (content['extra'] is String) {
        extra = json.decode(content['extra']);
      } else {
        extra = content['extra'];
      }
      if (!content.containsKey('content') || extra['subType'] == 'image') {
        return null;
      }
      if (extra.containsKey('emote_position') &&
          extra['emote_position'] > 0 &&
          extra['emote_sender'] > 0) {
        return null;
      }

      MessageContent message = MessageContent.from(
          content['content'], extra, content['user'], content['messageId'],
          mounts: extra['mounts']);

      /// 初始化公屏通用标签
      await message.checkCommonTagData();
      return message;
    } catch (e) {
      Log.d("MessageList error ");
      Log.d(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTop(),
        Expanded(
          child: Stack(
            children: [
              _renderExpanded(context),
              if (_messageQueue.freezeFrame)
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: _renderUnreadMsg(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderExpanded(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification) {
          UserScrollNotification user = notification;
          _scrollLock = user.direction.toString() != 'ScrollDirection.idle';
        }
        return false;
      },
      child: Listener(
        onPointerUp: (PointerUpEvent event) {
          // 手动滑动后（除公屏滚到底），公屏不再自动滚
          freezeFrame();
        },
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black,
                Colors.transparent,
                Colors.transparent
              ],
              stops: [0.0, 0.1, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.builder(
            cacheExtent: 100.0,
            physics: const AlwaysScrollableScrollPhysics(),
            addAutomaticKeepAlives: false,
            padding: const EdgeInsetsDirectional.only(top: 6),
            controller: _controller,
            itemCount: _messageQueue.widgetDataListLength,
            itemBuilder: (BuildContext context, int index) {
              MessageContent message = _messageQueue.elementAt(index);
              return _renderBody(message, index);
            },
          ),
        ),
      ),
    );
  }

  Widget _renderBody(MessageContent message, int index) {
    return CommonMessageItem(
      room: widget.room,
      message: message,
      index: index,
      isMainRoom: false,
    );
  }

  // 未读消息数展示
  Widget _renderUnreadMsg() {
    if (_messageQueue.unreadMsg == 0) {
      return const SizedBox.shrink();
    } else {
      String unreadNum = '${_messageQueue.unreadMsg}';
      if (_messageQueue.unreadMsg > 99) {
        unreadNum = '99+';
      }
      return FadeAnimationWidget(
        child: GestureDetector(
          onTap: () {
            _scrollToEnd();
            setFreezeFrame(false);
          },
          child: Container(
            height: 32,
            padding: const EdgeInsetsDirectional.only(start: 28, end: 29),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.room_unread_msg([unreadNum]),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                R.img(
                  'ic_expand.svg',
                  width: 16,
                  height: 16,
                  color: Colors.white,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget buildTop() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 8),
      width: Util.width - 24,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.white.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: showTileButton ? 16 : 20,
          ),
          if (showTileButton) ...[
            Text(
              K.room_go_relate_room_title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
          Expanded(
            child: Text(
              showTileButton
                  ? K.room_go_relate_room_online(['$onLineNum'])
                  : K.room_go_relate_room_online_2(['$onLineNum']),
              style: TextStyle(
                fontSize: showTileButton ? 12 : 15,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(showTileButton ? 0.8 : 1),
                height: 1.1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (Util.validList(widget.drainageData.permission))
            GestureDetector(
              onTap: () {
                goRelateRoom();
              },
              child: Container(
                width: 56,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  showTileButton ? K.room_join_anchor_room : K.room_more,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  bool get showTileButton {
    return widget.drainageData.showType == 0;
  }

  bool going = false;
  void goRelateRoom() async {
    if (going) {
      return;
    }

    going = true;

    if (showTileButton) {
      /// 平铺展示【前往】
      String url = '${System.domain}go/room/room/saveMic';
      try {
        await Xhr.postPb(url, {
          'rid': '${widget.room.rid}',
          'drid': '${widget.relateRid}',
        });
      } catch (e) {
        Log.d('goRelateRoom error: $e');
      }
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);

      manager.openChatRoomScreenShow(System.context, widget.relateRid,
          refer: 'room_relate_message');
    } else {
      /// 更多-弹出
      await RelateRoomOption.moreOption(widget.drainageData.permission,
          widget.relateRid, widget.room.realRid);
    }

    going = false;
  }

  _onScroll() {
    if (!_controller.hasClients) return;
    if (_controller.position.pixels >= _controller.position.maxScrollExtent &&
        _messageQueue.freezeFrame == true) {
      setFreezeFrame(false);
    }
  }

  void freezeFrame() {
    if (!_controller.hasClients) return;
    if (_controller.position.pixels < _controller.position.maxScrollExtent &&
        _messageQueue.freezeFrame == false) {
      setFreezeFrame(true);
    }
  }

  // 用户滑动过公屏之后（不在最底部），公屏不再随着消息的接收自动滑到底部，而显示未读消息数
  void setFreezeFrame(bool freeze) {
    if (mounted) {
      setState(() {
        _messageQueue.freezeFrame = freeze;
        if (!freeze) {
          _messageQueue.unreadMsg = 0;
        }
      });
    }
  }

  /// setState 更新数据再post一个scrollEnd task
  _setStateAndPostScrollEnd() {
    if (!mounted) return;
    setState(() {});
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _handleScrollEnd();
    });
  }

  ///当前有触摸时不滚动，触摸释放时5秒后可以滚动
  void _handleScrollEnd() {
    if (!_controller.hasClients) return;

    if (_messageQueue.freezeFrame) return;

    // Log.d('Message list timer scroll, maxScrollExtent: ${_controller.position.maxScrollExtent}, offset: ${_controller.offset}');
    if (_controller.position.maxScrollExtent > _controller.offset) {
      _scrollToEnd();
      return;
    }
    //一次触发滚动实际上先后滚动了两次以确保滚动到底，因为maxScrollExtent有时并不准确
    // _scrollToEnd();
  }

  void _scrollToEnd() {
    if (_scrollLock) return;
    if (!_controller.hasClients) return;
    Log.d(
        '_MessageListState._scrollToEnd value = ${_controller.position.maxScrollExtent}');
    if (_scrolling) return;
    _scrolling = true;
    _controller.position
        .moveTo(_controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: _scrollEndAnimationDuration),
            curve: Curves.easeInOut)
        .then((v) {
      _scrolling = false;
    });
  }

  @override
  handleEndFrame() {
    if (!mounted) return;
    if (Util.appState == AppLifecycleState.resumed) {
      _setStateAndPostScrollEnd();
    }
  }

  @override
  handleFlushEndFrame() {
    if (!mounted) return;
    if (Util.appState == AppLifecycleState.resumed) {
      _setStateAndPostScrollEnd();
    }
  }

  @override
  void changeMessageTab(int currentRid) {
    if (currentRid == widget.relateRid) {
      /// 切换到当前关联房间TAB，消除红点，并开始消费消息
      _messageQueue.startConsumer();
      _setStateAndPostScrollEnd();
      if (Get.isRegistered<NewMessageLogic>()) {
        NewMessageLogic newMessageLogic = Get.find<NewMessageLogic>();
        newMessageLogic.change(widget.relateRid, false);
      }
    } else {
      /// 切换到其他TAB，需要记录红点，并暂停消费消息
      _messageQueue.pauseConsume();
    }
  }
}
