import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';

import 'rank_list_page.dart';

/// 拍拍世界榜
class AuctionRankPage extends StatefulWidget {
  const AuctionRankPage({Key? key}) : super(key: key);

  @override
  _AuctionRankPageState createState() {
    return _AuctionRankPageState();
  }

  static Future show({Key? key, required BuildContext context}) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return AuctionRankPage(key: key);
      }),
    );
  }
}

class _AuctionRankPageState extends State<AuctionRankPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Tab> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: K.room_rank_today),
      Tab(text: K.room_rank_total),
      Tab(text: K.room_rank_fame_hall)
    ];
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFFF5F5F5),
          alignment: Alignment.topCenter,
          child: R.img(
            RoomAssets.chat_room$auction_bg_webp,
            width: Util.width,
            fit: BoxFit.contain,
          ),
        ),
        showRankListByKey(auctionWorldKey)
            ? Scaffold(
                backgroundColor: Colors.transparent,
                appBar: BaseAppBar.custom(
                    leading: const BackButton(
                      color: Colors.white,
                    ),
                    title: Text(
                      K.room_rank_auction_world,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(44),
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        color: Colors.transparent,
                        child: CommonTabBar(
                          controller: _tabController,
                          isScrollable: true,
                          tabs: _tabs,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white70,
                          // indicatorColor: Colors.white,
                          indicator: const CommonUnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 3.0,
                              color: Colors.white,
                            ),
                            wantWidth: 16,
                            draggingWidth: 4,
                          ),
                        ),
                      ),
                    )),
                body: TabBarView(
                  controller: _tabController,
                  children: const [
                    RankListPage(rankType: RankType.today),
                    RankListPage(rankType: RankType.total),
                    RankListPage(rankType: RankType.fameHall),
                  ],
                ),
              )
            : Scaffold(
                backgroundColor: Colors.transparent,
                appBar: BaseAppBar.custom(
                  leading: const BackButton(
                    color: Colors.white,
                  ),
                  title: Text(
                    K.room_rank_auction_world,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                body: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      K.room_no_more_data,
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
