import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/intimate_card/intimate_card_main_list_widget.dart';
import 'package:personaldata/src/intimate_card/intimate_card_unbind_page.dart';

import '../../k.dart';

///亲密卡入口页
class IntimateCardMainPage extends StatefulWidget {
  const IntimateCardMainPage({super.key});

  @override
  State<IntimateCardMainPage> createState() => _IntimateCardMainPageState();

  static Future show(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/IntimacyCardMainPage'),
            builder: (_) => const IntimateCardMainPage()));
  }
}

class _IntimateCardMainPageState extends State<IntimateCardMainPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String>? _tabs;
  String? _docUrl; //说明文档地址

  @override
  void initState() {
    super.initState();
    _tabs = [
      K.my_send_intimacy_card_number(['0']),
      K.my_receive_intimacy_card_number(['0'])
    ];
    _tabController = TabController(length: _tabs!.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          K.intimacy_card_text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
        actions: [
          if (_docUrl != null && _docUrl!.isNotEmpty)
            GestureDetector(
              onTap: () {
                BaseWebviewScreen.show(context, url: _docUrl ?? '');
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: 6),
                width: 44,
                alignment: Alignment.center,
                child: R.img(
                  Assets.personaldata$ic_intimacy_card_help_webp,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
        ],
      ),
      backgroundColor: const Color(0xffF5F5F5),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.dp),
          child: CommonTabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const BoxDecoration(),
            indicatorWeight: 0,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black.withOpacity(0.4),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            tabs: _tabs!.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              IntimateCardMainListWidget(
                type: 0,
                finishRequest:
                    (int sendCount, int receiveCount, String? docUrl) {
                  _tabs = [
                    K.my_send_intimacy_card_number([sendCount.toString()]),
                    K.my_receive_intimacy_card_number([receiveCount.toString()])
                  ];
                  _docUrl = docUrl;
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              IntimateCardMainListWidget(
                type: 1,
                finishRequest:
                    (int sendCount, int receiveCount, String? docUrl) {
                  _tabs = [
                    K.my_send_intimacy_card_number([sendCount.toString()]),
                    K.my_receive_intimacy_card_number([receiveCount.toString()])
                  ];
                  _docUrl = docUrl;
                  if (mounted) {
                    setState(() {});
                  }
                },
              )
            ],
          ),
        ),
        _unbindPageButton(),
      ],
    );
  }

  Widget _unbindPageButton() {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: Util.bottomMargin),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          IntimateCardUnbindPage.show(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.jump_to_unbind_card_list,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
            R.img(Assets.personaldata$ic_next_small_svg,
                width: 14, height: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
