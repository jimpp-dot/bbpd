// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:ui';

import 'package:chat_room/src/base/widget/emote/input_emote.dart';
import 'package:chat_room/src/base/widget/emote/repo/emote_repo.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../model/pb/generated/emotion.pb.dart';
import 'emote_constant.dart';

const int maxDuration = 2 * 24 * 60 * 60;

class EmotePanel extends StatefulWidget {
  final ChatRoomData room;

  final VoidCallback? onSuccess;

  final int pubMsgInterval;

  const EmotePanel({Key? key, required this.room, this.onSuccess, this.pubMsgInterval = 0}) : super(key: key);

  @override
  _EmotePanelState createState() => _EmotePanelState();

  static Future show(
    BuildContext context,
    ChatRoomData room, {
    Color? defineBarrierColor,
    VoidCallback? onSendSuccess,
    int pubMsgInterval = 0,
  }) async {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: defineBarrierColor ?? Colors.black54,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return EmotePanel(
          room: room,
          onSuccess: onSendSuccess,
          pubMsgInterval: pubMsgInterval,
        );
      },
    );
  }
}

class _EmotePanelState extends State<EmotePanel> with TickerProviderStateMixin<EmotePanel> {
  TabController? _tabController;

  List<EmoteTab> _tabList = [];

  int _currentIndex = 0;

  ResEmojiConfig? _config;

  Timer? _timer;

  int leftSeconds = 0;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventEmojiPaySucess, updateEmojiConfig);
    _load();
  }

  _load() async {
    _config = await EmoteRepo.getEmotionConfig(widget.room.rid);
    _currentIndex = await _getLastTabIndex();
    if (_config == null) return;
    List<EmojiTab>? emotionTab = _config?.data.emojiTabList;
    if (emotionTab?.isNotEmpty == true) {
      if (_currentIndex < emotionTab!.length) {
        leftSeconds = emotionTab[_currentIndex].leftSeconds;
        if (leftSeconds > 0 && leftSeconds < maxDuration) {
          _startCountDownTask();
        }
      }
    }
    _initTab();
    refresh();
  }

  _initTab() async {
    _tabList = _getTabsConfig();
    _disposeTabController();
    safeRun(() {
      _tabController = TabController(initialIndex: _currentIndex, length: _tabList.length, vsync: this);
      _tabController!.addListener(_onTabChanged);
    });
  }

  void _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
    int index = _tabController?.index ?? 0;
    if (_currentIndex != index) {
      _currentIndex = index;
      _setLastTabIndex(index);
      List<EmojiTab>? emotionTab = _config?.data.emojiTabList;
      if (emotionTab?.isNotEmpty == true) {
        if (index < emotionTab!.length) {
          leftSeconds = emotionTab[index].leftSeconds;
          if (leftSeconds > 0 && leftSeconds < maxDuration) {
            _startCountDownTask();
          }
        }
      }
      refresh();
    }
  }

  void updateEmojiConfig(String type, dynamic data) {
    _load();
  }

  @override
  void dispose() {
    _cancelTask();
    _disposeTabController();
    eventCenter.removeListener(EventConstant.EventEmojiPaySucess, updateEmojiConfig);
    HiveUtil.closeBox<int>('${Session.uid}_${HiveBoxConstant.emoji_tab}');
    super.dispose();
  }

  void _disposeTabController() {
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChanged);
      _tabController!.dispose();
      _tabController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  void _cancelTask() {
    _timer?.cancel();
    _timer = null;
  }

  /// 开始倒计时任务
  void _startCountDownTask() {
    _cancelTask();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      leftSeconds -= 1;
      if (leftSeconds <= 0) {
        _cancelTask();
      }
      refresh();
    });
  }

  Widget _buildBody() {
    if (_tabController?.length == null || _tabController?.length == 0) {
      return const SizedBox.shrink();
    }

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          // height: _currentIndex != 0 && leftSeconds > 0 ? (278.dp + Util.iphoneXBottom) : (234.dp + Util.iphoneXBottom),
          height: 200.dp + Util.iphoneXBottom,
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          decoration: BoxDecoration(
            color: const Color(0xFF171621).withOpacity(0.7),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16.dp),
              topEnd: Radius.circular(16.dp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ExtendedTabBarView(
                  controller: _tabController,
                  children: _tabList.map((e) => _buildEmotePage(e, _tabList.indexOf(e))).toList(),
                ),
              ),
              // Container(
              //   height: 52.dp,
              //   padding: EdgeInsetsDirectional.only(start: 16.dp),
              //   child: buildTabWidget(),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmotePage(EmoteTab e, int index) {
    List<EmojiTab>? emotionTab = _config!.data.emojiTabList;
    if (emotionTab.isNotEmpty == true) {
      List<EmojiPrice>? priceList = emotionTab[index].price;
      return InputEmote(
          room: widget.room,
          emotionList: emotionTab[index].list,
          priceList: e.type == EmoteTabType.VIP ? priceList : [],
          emoteTabType: e.type,
          onSuccess: widget.onSuccess,
          title: emotionTab[index].tabName,
          defaultIcon: emotionTab[index].iconKey,
          emojiGroupId: emotionTab[index].esId,
          background: emotionTab[index].background,
          emojiDesc: emotionTab[index].desc,
          pubMsgInterval: e.type == EmoteTabType.VIP ? 2 : widget.pubMsgInterval,
          leftSeconds: leftSeconds);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildTabWidget() {
    List<Widget> tabs = [];
    TextStyle style = TextStyle(color: Colors.white, fontSize: 13.dp, fontWeight: FontWeight.w600);
    for (int i = 0; i < _tabList.length; i++) {
      double textWidth = TextUtils.getTextSize(context, _tabList[i].name, style, (Util.width - 100.dp) / 2, 1).width;
      Tab tab = Tab(
        icon: null,
        child: Stack(
          children: [
            Container(
              height: 32.dp,
              padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
              decoration: ShapeDecoration(
                color: _currentIndex == i ? const Color(0x66000000) : Colors.transparent,
                shape: const StadiumBorder(),
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(EmoteUtil.emoteImgUrl(_tabList[i].icon), width: 22.dp, height: 22.dp),
                  SizedBox(width: 6.dp),
                  Text(
                    _tabList[i].name,
                    style: style,
                  )
                ],
              ),
            ),
            // 未选中盖蒙层
            Container(
              height: 32.dp,
              width: 36.dp + textWidth.dp + 8.dp,
              padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
              decoration: ShapeDecoration(
                color: _currentIndex == i ? Colors.transparent : const Color(0x33000000),
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      );
      tabs.add(tab);
    }

    return CommonTabBar(
      showSplash: false,
      labelPadding: EdgeInsetsDirectional.only(end: 12.dp),
      controller: _tabController,
      isScrollable: true,
      tabs: tabs,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.5),
      labelStyle: TextStyle(fontSize: 13.dp, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
        fontSize: 13.dp,
        fontWeight: FontWeight.w400,
      ),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 1.0, color: Colors.transparent),
      ),
    );
  }

  List<EmoteTab> _getTabsConfig() {
    List<EmoteTab> tabList = [];
    if (_config?.data.emojiTabList.isNotEmpty == true && _currentIndex < _config!.data.emojiTabList.length) {
      for (EmojiTab tab in _config!.data.emojiTabList) {
        tabList.add(
          EmoteTab(_config!.data.emojiTabList.indexOf(tab) == 0 ? EmoteTabType.NORMAL : EmoteTabType.VIP, tab.tabName, tab.iconKey),
        );
      }
    }
    return tabList;
  }

  bool get inMic => ClientRole.Broadcaster == widget.room.role;

  Future<int> _getLastTabIndex() async {
    int tabIndex = await HiveUtil.get<int>('${Session.uid}_${HiveBoxConstant.emoji_tab}') ?? 0;
    return tabIndex;
  }

  void _setLastTabIndex(int index) {
    HiveUtil.put<int>('${Session.uid}_${HiveBoxConstant.emoji_tab}', index);
  }
}
