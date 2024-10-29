import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';

import 'cplink_help_guide.dart';
import 'cplink_help_notice.dart';

///显示 连连看 房间公告与玩法说明
showCpLinkHelpDialog(BuildContext context, ChatRoomData room) async {
  return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        // barrierDismissible true not work.
        return GestureDetector(
          onTap: () {
            Navigator.of(context).maybePop();
          },
          child: Material(
            color: Colors.transparent,
            child: CpLinkHelpWidget(room: room),
          ),
        );
      });
}

class CpLinkHelpWidget extends StatefulWidget {
  final ChatRoomData room;

  const CpLinkHelpWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  _CpLinkHelpWidgetState createState() => _CpLinkHelpWidgetState();
}

class _CpLinkHelpWidgetState extends State<CpLinkHelpWidget>
    with TickerProviderStateMixin {
  late ExtendedTabController _tabController;
  final List<Widget> _tabWidget = [];

  late List<Widget> _tabViews;

  @override
  void initState() {
    super.initState();
    _tabController = ExtendedTabController(length: 2, vsync: this)
      ..addListener(_onTabChanged);
    _initTabWidget();
    _tabViews = _initTabViews();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
  }

  void _onTabChanged() {
    Log.d(
        tag: 'cp-link',
        ' help dialog _onTabChanged index = ${_tabController.index}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: R.color.mainBgColor, //Colors.white,transparent
            borderRadius: BorderRadius.all(
              Radius.circular(8.dp),
            ),
          ),
          width: 312.dp,
          height: 260.dp,
          padding: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              _buildTabBar(),
              Divider(height: 1, color: R.color.dividerColor),
              Expanded(
                child: ExtendedTabBarView(
                  controller: _tabController,
                  children: _tabViews,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    var textStyle = TextStyle(
        color: R.color.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600);
    return SizedBox(
      width: double.infinity,
      height: 50.dp,
      child: CommonTabBar(
        controller: _tabController,
        tabs: _tabWidget,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: R.color.mainBrandColor,
        labelStyle: textStyle,
        unselectedLabelStyle: textStyle,
        indicatorWeight: 3,
        indicatorPadding: const EdgeInsets.only(top: 0),
      ),
    );
  }

  void _initTabWidget() {
    for (var element in HelpTabEnum.values) {
      _tabWidget.add(Tab(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(element.title()),
        ),
      ));
    }
  }

  List<Widget> _initTabViews() {
    return HelpTabEnum.values.map((e) {
      switch (e) {
        case HelpTabEnum.notice:
          return CpLinkHelpNoticeWidget(
            room: widget.room,
          );
        case HelpTabEnum.guide:
          return CpLinkHelpGuideWidget(
            rid: widget.room.rid,
          );
      }
    }).toList(growable: false);
  }
}

enum HelpTabEnum {
  notice, // 房间公告
  guide, // 玩法说明
}

extension HelpTamExt on HelpTabEnum {
  String title() {
    switch (this) {
      case HelpTabEnum.notice:
        return K.room_cplink_notice;
      case HelpTabEnum.guide:
        return K.room_cplink_guide;
    }
  }
}
