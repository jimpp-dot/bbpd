import 'dart:async';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/vote_result_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_replay_result.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/wolf_manager.dart';

import '../../../../k.dart';
import '../wolfOpUtil.dart';
import 'high_light_item_widget.dart';
import 'vote_result.dart';
import 'wolf_notice_rule_widget.dart';

///
/// 狼人游戏消息处理展示
///
class WolfNoticeMessageWidget extends StatefulWidget {
  final ChatRoomData room;

  const WolfNoticeMessageWidget({super.key, required this.room});

  @override
  _WolfNoticeMessageWidgetState createState() =>
      _WolfNoticeMessageWidgetState();
}

class _WolfNoticeMessageWidgetState extends State<WolfNoticeMessageWidget>
    with TickerProviderStateMixin<WolfNoticeMessageWidget> {
  late ScrollController _controller;
  final List<MessageContent> _data = [];

  late Timer _timer;

  bool _scrollLock = false;

  bool _needScrollMsgList = true;
  bool _msgListTouchingDown = false;
  int _suspendingScrollCountDown = 0;

  bool _scrolling = false;
  static const int _maxCacheCount = 1000;
  List? list;
  WereWolfManager manager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
  late String wolfType;
  String? publishDeal;
  final IGiftManager _giftManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  @override
  void initState() {
    super.initState();
    widget.room.addListener(RoomConstant.Event_Message, _onMessageReceived);
    _controller = ScrollController(keepScrollOffset: true);
    _timer = Timer.periodic(const Duration(milliseconds: 500), _onScrollTimer);
    wolfType = manager.getTypeLabel();
    publishDeal = manager.getPublishDeal();
    _load();
  }

  @override
  void dispose() {
    _timer.cancel();
    widget.room.removeListener(RoomConstant.Event_Message, _onMessageReceived);
    super.dispose();
  }

  ///当前有触摸时不滚动，触摸释放时5秒后可以滚动
  void _onScrollTimer(Timer timer) {
    _suspendingScrollCountDown--;

    if (!_controller.hasClients) return;

    if (_msgListTouchingDown) return;
    if (!_needScrollMsgList) return;
    if (_suspendingScrollCountDown > 0) return;

    if (_controller.position.maxScrollExtent > _controller.offset) {
      _scrollToEnd();
      return;
    }

    //一次触发滚动实际上先后滚动了两次以确保滚动到底，因为maxScrollExtent有时并不准确
    _scrollToEnd();
    _needScrollMsgList = false;
  }

  void _load() async {
    try {
      String url = "${System.domain}roomwolfv2/initBoard"; //获取板子数据
      final Map<String, String> params = {
        "rid": widget.room.rid.toString(),
        'type': wolfType,
      };
      if (publishDeal != null && publishDeal!.isNotEmpty) {
        params['is_open_card'] = publishDeal!;
      }

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      if (res['data'] == null) {
        return;
      }
      list = res['data'];
    } catch (e) {
      Log.d('roomwolfv2/initBoard error: ${e.toString()}');
    }
    if (!mounted) {
      return;
    }
    setState(() {
      Map extra = {'subType': 'rule'};
      MessageContent content =
          MessageContent.from(null, extra, null, -1, list: list);
      _data.insert(0, content);
    });
  }

  void _scrollToEnd() {
    if (_scrollLock) return;
    if (!_controller.hasClients) return;
    if (_scrolling) return;
    _scrolling = true;
    _controller.position
        .moveTo(_controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutExpo)
        .then((v) {
      _scrolling = false;
    });
  }

  _onMessageReceived(String type, dynamic data) {
    try {
      MessageContent message = data;

      // 忽略非狼人消息
      if (message.type != MessageType.Wolf) {
        return;
      }

      _needScrollMsgList = true;
      if (Util.appState == AppLifecycleState.resumed) {
        setState(() {
          _data.add(message);
          if (_data.length > _maxCacheCount) {
            _data.removeRange(0, _data.length - (_maxCacheCount - 50));
          }
        });
      } else {
        _data.add(message);
      }
    } catch (e) {
      Log.d('_WolfNoticeMessageWidgetState receive msg error: ${e.toString()}');
    }
  }

  @override
  void didUpdateWidget(WolfNoticeMessageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (manager.getTypeLabel() != wolfType ||
        manager.getPublishDeal() != publishDeal) {
      _data.clear();
      wolfType = manager.getTypeLabel();
      publishDeal = manager.getPublishDeal();
      _load();
    }
  }

  Widget _renderBody(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    switch (extra['subType']) {
      case 'rule':
        return Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(4.0)),
            color: const Color(0xFF3C3659).withOpacity(0.75),
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 4, end: 5, top: 4, bottom: 6),
          child: MessageRuleWidget(list: message.list),
        );
      case 'wolfStart': //开局

        WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
          Future.delayed(const Duration(milliseconds: 100)).then((value) {
            _data.clear();
            if (list != null) {
              Map extra = {'subType': 'rule'};
              MessageContent content =
                  MessageContent.from(null, extra, null, -1, list: list);
              _data.add(content);
            }
            if (mounted) {
              setState(() {});
            }
          });
        });
        break;
      case 'wolfNormal':
        String message0 = message.message ?? '';
        List? highLightContent = extra['highLightContent']; //标识高亮的文字
        Map<dynamic, dynamic>? map;
        if (extra['btnData'] is Map) {
          map = extra['btnData']; //标识按钮类型
        }
        double left = message0.startsWith("【") ? 4 : 12;
        if (highLightContent != null && highLightContent.isNotEmpty) {
          return Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(4.0)),
              color: const Color(0xFF3C3659).withOpacity(0.75),
            ),
            padding: EdgeInsetsDirectional.only(
                start: left, end: 8, top: 8, bottom: 8),
            child: WolfHighLightWidget(message0, highLightContent),
          );
        } else if (map != null && map.isNotEmpty) {
          return _renderButtonWidget(map, message0, left,
              voteMap: ('vote' == map['type'] || 'police.vote' == map['type'])
                  ? extra['msgData']
                  : null); //投票结果 或 复盘
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            color: const Color(0xFF3C3659).withOpacity(0.75),
          ),
          padding: EdgeInsetsDirectional.only(
              start: left, end: 12, top: 8, bottom: 8),
          child: _renderDefault(message0),
        );

      case 'wolfMenu': //标识哪一天
        String message0 = message.message ?? '';
        return Container(
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              R.imagePath("icon_wolf_notice_date.png",
                  package: ComponentManager.MANAGER_WERE_WOLF),
            ),
            fit: BoxFit.fill,
          )),
          child: Text(
            message0,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      default:
        return const SizedBox.shrink();
    }

    return const SizedBox.shrink();
  }

  Widget _renderButtonWidget(Map btnData, String message, double left,
      {Map? voteMap}) {
    switch (btnData['type']) {
      case 'vote': //投票结果
      case 'police.vote': //警长竞选结果
        if (voteMap == null) {
          return const SizedBox.shrink();
        }
        Map<int, List<int>> votes = {};
        List voteList = voteMap['newVoteResultPosMap'];
        for (var element in voteList) {
          if (element['key'] is! int) continue;
          votes[element['key']] = [];
          List? value = element['value'];
          if (value != null && value.isNotEmpty) {
            for (var vl in value) {
              votes[element['key']]!.add(vl);
            }
          }
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(4.0)),
            color: const Color(0xFF3C3659).withOpacity(0.75),
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 4, end: 4, top: 8, bottom: 8),
          child: _renderVoteResult(votes, btnData),
        );
      case 'replay': //复盘
        return Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(4.0)),
            color: const Color(0xFF3C3659).withOpacity(0.75),
          ),
          padding: EdgeInsetsDirectional.only(
              start: left, end: 12, top: 12, bottom: 12),
          child: _renderReplay(message, btnData),
        );
    }
    return const SizedBox.shrink();
  }

  Widget _renderVoteResult(
      Map<int, List<int>> votes, Map<dynamic, dynamic> btnData) {
    int rid = Util.parseInt(btnData['rid']);
    String id = '${btnData['id']}';
    String type = '${btnData['type']}';
    String text = '${btnData['text']}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            'vote' == type
                ? K.wolf_vote_result
                : K.wolf_police_vote_result, //放逐投票和警长竞选投票
            style: const TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4),
          child: VoteResultWidget(votes, showAvatar: false),
        ),
        const SizedBox(height: 12),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              showVoteDetailDialog(rid.toString(), id);
            },
            child: Container(
              width: 63,
              height: 22,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(R.imagePath("wolf_notice_item_btn.png",
                    package: ComponentManager.MANAGER_WERE_WOLF)),
                fit: BoxFit.fill,
              )),
              child: Text(text,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
        )
      ],
    );
  }

  Widget _renderReplay(String message, Map<dynamic, dynamic> map) {
    int rid = Util.parseInt(map['rid']);
    String permanentVvc = '${map['permanent_vvc']}';
    String text = map['text'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showReplayDialog(rid.toString(), permanentVvc);
          },
          child: Container(
            width: 63,
            height: 22,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.imagePath("wolf_notice_item_btn.png",
                    package: ComponentManager.MANAGER_WERE_WOLF)),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderDefault(String message) {
    return Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 12),
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
        onPointerDown: (PointerDownEvent event) {
          _msgListTouchingDown = true;
        },
        onPointerUp: (PointerUpEvent event) {
          _msgListTouchingDown = false;
          _suspendingScrollCountDown = 10;
        },
        child: ListView.builder(
          cacheExtent: 100.0,
          shrinkWrap: false,
          physics: const ClampingScrollPhysics(),
          addAutomaticKeepAlives: false,
          padding: const EdgeInsets.all(0.0),
          controller: _controller,
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            MessageContent message = _data.elementAt(index);
            return Container(
              margin: EdgeInsetsDirectional.only(
                top: index == 0 ? 0 : 4,
                bottom: index == _data.length - 1 ? 0 : 4,
              ),
              child: _renderBody(context, message),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WolfConfigData? wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData?;
    WolfState? wolfState = wolfConfigData?.state;

    RoomPosition? rp = WolfOpUtil.getDescPlayer(widget.room);
    WolfPositionData? rpWolfPositionData =
        rp?.positionExpendData as WolfPositionData?;

    bool showGift = false;
    if (wolfState == WolfState.DaytimeDesc ||
        wolfState == WolfState.DaytimeLastWords ||
        wolfState == WolfState.PoliceDesc) {
      showGift = true;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(6.0)),
        color: Colors.black.withOpacity(0.4),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Expanded(
            child: _renderExpanded(context),
          ),
          showGift &&
                  rpWolfPositionData?.origin != null &&
                  rpWolfPositionData?.origin != Session.uid
              ? _giftManager.showGiftPanelRow(context,
                  room: widget.room, uid: rpWolfPositionData?.origin ?? 0)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future<void> showVoteDetailDialog(String rid, String id) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return VoteResultDialog(rid, id, widget.room.positions);
      },
    );
  }

  Future<void> showReplayDialog(String rid, String permanentVvc) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReplayReslutWidget(
            rid, '1', permanentVvc, widget.room.positions);
      },
    );
  }
}
