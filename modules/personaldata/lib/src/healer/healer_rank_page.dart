import 'package:shared/assets.dart';
import 'package:flutter/services.dart';
import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/healer/healer_rank_list.dart';

/// 聊愈师助力榜
class HealerRankPage extends StatefulWidget {
  final int uid;

  const HealerRankPage({super.key, required this.uid});

  static Future launch(BuildContext context, {int uid = 0}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HealerRankPage(uid: uid),
    ));
  }

  @override
  State<HealerRankPage> createState() => _HealerRankPageState();
}

class _HealerRankPageState extends State<HealerRankPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = [K.healer_current_up, K.healer_history_up];

  late ExtendedTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = ExtendedTabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF7493EC),
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: 'static/healer/bg_healer_main_head.webp',
              width: Util.width,
              fit: BoxFit.fitWidth,
              cachedWidth: Util.width.px,
            ),
            Column(
              children: [
                SafeArea(bottom: false, child: _buildAppBar()),
                _buildTabs(),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: _tabs
                      .mapIndexed((index, item) =>
                          HealerRankList(uid: widget.uid, type: index))
                      .toList(),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 50,
            height: 44,
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: R.img(
                BaseAssets.shared$ic_titlebar_back_svg,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            K.healer_title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 44.dp,
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        tabs: _tabs.map((e) => Tab(child: Text(e))).toList(),
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(color: Colors.white, fontSize: 14),
        indicator: const BoxDecoration(),
        marginStart: 6,
        marginEnd: 6,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        tabItemAlign: const Alignment(0, 0.2),
      ),
    );
  }
}
