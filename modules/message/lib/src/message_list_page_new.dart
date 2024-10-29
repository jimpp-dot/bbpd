import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:message/k.dart';
import 'package:message/message.dart';
import 'package:message/src/hilist/private_chat_hi_list.dart';
import 'package:message/src/widget/message_empty_widget.dart';
import 'package:message/src/widget/msg_item_etc_widget.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'accost/private_chat_accost_list.dart';
import 'controller/message_page_controller.dart';

typedef MessageItemBuilder = Widget Function(
  Conversation conv,
  bool isLast, {
  Key? key,
  UserConfig? config,
  OnConversationOperate? onChanged,
  OnAwaitRemoveList? onRemoveHiList,
  OnHiTap? onHiTap,
  Map? userTagMap,
});

/// 消息列表页
class NewMessagePageScreen extends StatefulWidget {
  final MessageItemBuilder? itemBuilder;
  final Color? emptyColor;
  final double? paddingBottom;
  final double? itemPandding; // item 的前/后 pandding; 仅在非自定义 itemBuilder 时有效
  final VoidCallback? onRefreshCallback;

  const NewMessagePageScreen({super.key, this.itemBuilder, this.emptyColor, this.paddingBottom, this.itemPandding, this.onRefreshCallback});

  @override
  NewMessagePageScreenState createState() => NewMessagePageScreenState();
}

class NewMessagePageScreenState extends State<NewMessagePageScreen>
    with AutomaticKeepAliveClientMixin<NewMessagePageScreen>, TabStateMixin {
  static const LOG_TAG = "MessagePageScreen_State";

  final MessagePageController messagePageController = Get.put<MessagePageController>(MessagePageController());

  final ScrollController _scrollController = ScrollController();

  Timer? _timer;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventLogout, _logout);

    _startTimer();
  }

  _onPageVisible(bool visible) {
    Log.d('_onPageVisible:$visible');
    if (visible) {
      messagePageController.isCurrentPage = true;
    } else {
      messagePageController.isCurrentPage = false;
    }
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _startTimer() {
    _cancelTimer();
    _timer = Timer(const Duration(seconds: 10), () {
      if (mounted && messagePageController.loading == true) {
        PulseLog.instance.console('NewMessagePageScreen Complete by timer', tag: 'msgLoading');
        setState(() {
          messagePageController.loading = false;
        });
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _dispose() {
    Log.d("message list dispose");
    eventCenter.removeListener(EventConstant.EventLogout, _logout);
    _cancelTimer();
  }

  reload(bool jumpToTop) {
    Log.d("Message Reload");
    messagePageController.load(clear: false, refreshExtra: true);
  }

  resetData() {}

  /// 打招呼点击
  _onHiTap(String type) {
    if (type == ConversationType.Hi) {
      IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
      bool useDingDongAsHiConvName = messageManager.useDingDongAsHiConvName();
      if (useDingDongAsHiConvName) {
        Tracker.instance.track(TrackEvent.dingdong, properties: {
          'dingdong_click': true,
        });
      }

      String title = useDingDongAsHiConvName ? K.msg_dingdong : BaseK.K.say_hi;
      PrivateChatHiList.show(context, messagePageController.hiConvs, title, messagePageController.onConversationOperate,
          messagePageController.onMarkHiListAllRead, type);

      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'home_message_ConversationType.Hi',
      });
    } else if (type == ConversationType.TempGroup) {
      HiList.show(context, messagePageController.tempConvs, BaseK.K.temp_group, messagePageController.onConversationOperate,
          messagePageController.onMarkTempGroupListAllRead, type);
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'home_message_ConversationType.TempGroup',
      });
    } else if (type == ConversationType.Accost) {
      PrivateChatAccostList.show(context, messagePageController.accostConvs, messagePageController.onConversationOperate,
          messagePageController.onMarkAccostListAllRead, type);
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'home_message_ConversationType.Accost',
      });
    } else if (type == ConversationTypeExt.Fate) {
      PrivateChatHiList.show(context, messagePageController.fateConvs, K.msg_fate, messagePageController.onConversationOperate,
          messagePageController.onMarkFateListAllRead, type);
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'home_message_ConversationType.Fate',
      });
    }
  }

  /// 创建messageItem
  Widget _buildMessageItem(Conversation conv, bool isLast, bool isFirst) {
    double? msgPadding = widget.itemPandding;

    UserConfig? config = messagePageController.getUserConfig(conv);

    if (widget.itemBuilder != null) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 6, bottom: 6),
        child: widget.itemBuilder!(
          conv,
          isLast,
          config: config,
          onChanged: messagePageController.onConversationOperate,
          onRemoveHiList: messagePageController.onRemoveHiList,
          onHiTap: (type) {
            _onHiTap(type);
          },
        ),
      );
    }

    int topFlag = 0; //0不能置顶取消置顶 1取消置顶 2置顶
    if (conv.type != ConversationType.Hi &&
        conv.type != ConversationType.Accost &&
        conv.type != ConversationTypeExt.Fate &&
        conv.type != ConversationType.TempGroup) {
      if (conv.isTop) {
        topFlag = 1;
      } else {
        topFlag = 2;
      }
    }

    bool isMute = conv.notify == 2 ? true : false; //免打扰

    /// 从 messagePageController 获取 conv 对应的额外信息
    Map? extraInfo = _getExtraInfoIfExist(conv);
    List<Widget> actions = [
      if (topFlag == 1 || topFlag == 2)
        CustomSlidableAction(
          backgroundColor: Colors.blue,
          autoClose: false,
          onPressed: (context) async {
            bool ok = await Im.setConversationToTop(conv.type, conv.targetId, topFlag == 2);

            ///置顶操作（1.消息会话列表item中 2.消息会话进入的2级列表的item中）成功，需要消息(会话)列表合成操作结果并刷新
            if (ok) {
              if (topFlag == 2) {
                messagePageController.onConversationOperate(ConversationOperateType.Top, conv.type, conv.targetId);
              }
              if (topFlag == 1) {
                messagePageController.onConversationOperate(ConversationOperateType.UnTop, conv.type, conv.targetId);
              }
              Slidable.of(context)?.close();
            }
            PulseLog.instance.event('click_event', properties: {
              'click_tag': 'home_message_ConversationToTop_${conv.targetId}',
            });
          },
          child: Text(
            topFlag == 1 ? K.msg_cancel_set_top : K.msg_set_top,
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      if (conv.type == ConversationType.Group)
        CustomSlidableAction(
          backgroundColor: const Color(0xFFFF7D52),
          padding: EdgeInsets.zero,
          autoClose: false,
          onPressed: (context) async {
            await Im.setConversationNotificationStatus(ConversationType.Group, conv.targetId, !isMute);
            messagePageController.onConversationOperate(ConversationOperateType.Mute, conv.type, conv.targetId);
            Slidable.of(context)?.close();
          },
          child: Text(
            isMute ? K.message_mute_cancel : K.message_mute,
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      CustomSlidableAction(
        backgroundColor: Colors.red,
        autoClose: false,
        onPressed: (context) async {
          if (conv.type == ConversationType.Hi ||
              conv.type == ConversationType.Accost ||
              conv.type == ConversationTypeExt.Fate ||
              conv.type == ConversationType.TempGroup) {
            ///删除打招呼，需要消息(会话)列表遍历遍历打招呼列表中item，并删除会话后，更新消息(会话)列表
            messagePageController.onRemoveHiList(conv.type);
            Slidable.of(context)?.close();
          } else {
            bool ok = await Im.removeConversation(conv.type, conv.targetId);

            ///删除操作（1.消息会话列表item中 2.消息会话进入的2级列表的item中）成功，需要消息(会话)列表合成操作结果并刷新
            if (ok) {
              messagePageController.onConversationOperate(ConversationOperateType.Delete, conv.type, conv.targetId);
              Slidable.of(context)?.close();
            }
          }
        },
        child: Text(K.msg_delete, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
      ),
    ];
    double extentRatio = 0.25 * actions.length;
    if (extentRatio == 0.0) {
      extentRatio = 0.01;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 6, bottom: 6),
      child: Slidable(
        direction: Axis.horizontal,
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: extentRatio,
          children: actions,
        ),
        child: MessageItem(
          key: ValueKey(conv.key),
          conv: conv,
          config: config,
          isLast: isLast,
          onChanged: messagePageController.onConversationOperate,
          onRemoveHiList: messagePageController.onRemoveHiList,
          onLongTap: () {},
          padding: msgPadding,
          onHiTap: (type) {
            _onHiTap(type);
          },
          refer: const PageRefer('MessagePageScreen'),
          extraInfo: extraInfo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<MessagePageController>(builder: (_) {
      if (messagePageController.loading) {
        return _renderLoading();
      }
      return VisibilityDetector(
        key: const ValueKey('message_list_page_key'),
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction == 0.0) {
            _onPageVisible(false);
          } else if (visibilityInfo.visibleFraction == 1.0) {
            _onPageVisible(true);
          }
        },
        child: _renderBody(),
      );
    });
  }

  Widget _renderLoading() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _renderBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification) {
          UserScrollNotification user = notification;
          bool scrollIdle = user.direction == ScrollDirection.idle;
          if (scrollIdle != messagePageController.scrollIdle && mounted) {
            messagePageController.setScrollIdle(scrollIdle);
          }
        }
        return false;
      },
      child: RefreshIndicatorFactory.of(
          child: (messagePageController.data == null || messagePageController.data!.isEmpty) && messagePageController.kaTouchData == null
              ? SingleChildScrollView(
                  child: MessageEmptyWidget(
                    desc: K.msg_nothing_here,
                    paddingBottom: widget.paddingBottom ?? 110,
                    textColor: widget.emptyColor ?? R.colors.secondTextColor,
                    onTap: () {
                      messagePageController.load();
                    },
                  ),
                )
              : CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  shrinkWrap: false,
                  slivers: <Widget>[
                    if (messagePageController.kaTouchData != null)
                      SliverToBoxAdapter(
                        child: MsgItemEtcWidget(
                          title: messagePageController.kaTouchData!.title ?? '',
                          subTitle: messagePageController.kaTouchData!.subTitle ?? '',
                        ),
                      ),
                    SliverFixedExtentList(
                      delegate: FixedExtentSliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          bool isLast = index == messagePageController.data!.length - 1;
                          bool isFirst = index == 0;
                          return _buildMessageItem(messagePageController.data!.elementAt(index), isLast, isFirst);
                        },
                        childCount: messagePageController.data!.length,
                        addAutomaticKeepAlives: false,
                        semanticIndexOffset: 15,
                        onPositionChanged: _handlePositionChanged,
                      ),
                      itemExtent: MessageItem.ITEM_EXTENT + 12,
                    ),
                  ],
                ),
          onRefresh: () async {
            reload(true);
            if (widget.onRefreshCallback != null) {
              widget.onRefreshCallback!();
            }
          }),
    );
  }

  void setCurrentBootTab(bool isCurrent) {
    messagePageController.isCurrentBootTab = isCurrent;
  }

  void _handlePositionChanged(int firstIndex, int lastIndex) {
    messagePageController.firstIndex = firstIndex;
    messagePageController.lastIndex = lastIndex;
  }

  _logout(String type, dynamic data) {
    Get.delete<MessagePageController>();
    _dispose();
  }

  Map? _getExtraInfoIfExist(Conversation conv) {
    if (conv.type != ConversationType.Group) {
      return null;
    }

    var groupId = Util.parseInt(conv.targetId);
    var groupData = messagePageController.getGroupData(groupId);
    if (groupData == null) {
      return null;
    }

    if (groupData.singerClubId > 0) {
      var extra = {"singerClubId": groupData.singerClubId};
      return extra;
    }

    return null;
  }
}
