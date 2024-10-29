import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/confess_v2/widgets/components/rule_button.dart';
import 'package:flutter/material.dart';

import 'confess_v2_square_page.dart';

class ConfessV2HeadlinePage extends StatefulWidget {
  const ConfessV2HeadlinePage({super.key});

  @override
  State<ConfessV2HeadlinePage> createState() => _ConfessV2HeadlinePageState();
}

class _ConfessV2HeadlinePageState extends State<ConfessV2HeadlinePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late ExtendedTabController _tabController;
  final List<String> _tabs = ['广场', '我的'];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = ExtendedTabController(
        vsync: this, length: _tabs.length, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        PositionedDirectional(
          top: 4.dp,
          child: R.img(
            RoomAssets.chat_room$confess_v2_bg_headline_page_webp,
            width: Util.width,
            height: 540.dp,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonTabBar(
                    tabs: _tabs.map((e) => Tab(child: Text(e))).toList(),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 0,
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white.withOpacity(0.7),
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    unselectedLabelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 16),
                    indicator: const CommonUnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 4, color: Color(0xFFFAE05A)),
                      wantWidth: 8,
                      insets: EdgeInsetsDirectional.only(bottom: 6),
                    ),
                    marginStart: 6,
                    labelPadding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                  ),
                ),
                const RuleBtn(),
                const SizedBox(width: 20),
              ],
            ),
            Expanded(
              child: ExtendedTabBarView(
                controller: _tabController,
                children: const <Widget>[
                  ConfessV2SquarePage(),
                  ConfessV2SquarePage(me: true),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
