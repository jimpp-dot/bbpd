import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/intimate_card/intimate_card_main_list_widget.dart';

import '../../k.dart';

///亲密卡已解绑页
class IntimateCardUnbindPage extends StatefulWidget {
  const IntimateCardUnbindPage({super.key});

  @override
  State<IntimateCardUnbindPage> createState() => _IntimateCardUnbindPageState();

  static Future show(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/IntimacyCardUnbindPage'),
            builder: (_) => const IntimateCardUnbindPage()));
  }
}

class _IntimateCardUnbindPageState extends State<IntimateCardUnbindPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String>? _tabs;
  ResIntimateCardList? _intimateCardUnbindList;
  final bool _isLoading = false;

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
          K.had_unbind + K.intimacy_card_text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
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
                      K.my_receive_intimacy_card_number(
                          [receiveCount.toString()])
                    ];
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isUnbind: true),
              const IntimateCardMainListWidget(type: 1, isUnbind: true)
            ],
          ),
        ),
      ],
    );
  }
}
