import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_picture_book_widget.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_rank_widget.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_request.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_reward_page.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//帽子玩法活动页面
class HatActivityPage extends StatefulWidget {
  const HatActivityPage({Key? key}) : super(key: key);

  @override
  State<HatActivityPage> createState() => _HatActivityPageState();

  static Future<bool?> launch(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HatActivityPage(),
      // settings: RouteSettings(name: '/unionAdminPage'),
    ));
  }
}

class _HatActivityPageState extends State<HatActivityPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _tabWidgetKey = GlobalKey();
  final GlobalKey<HatRankWidgetState> _hatRankWidgetKey = GlobalKey();

  late TabController _tabController;
  final List _tabs = ['帽子图鉴', '点亮榜单'];

  late ScrollController _scrollController;

  final _headOpacity = 0.0.obs;
  final _tabAnimationValue = 0.0.obs;

  late ApiHatActivityAtlasResponse _atlasResponse;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.animation?.addListener(() {
      _tabAnimationValue.value = _tabController.animation?.value ?? 0;
    });
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double part = max((_scrollController.offset / 300), 0);
      if (part <= 1 && _headOpacity.value < 1) {
        _headOpacity.value = part > 1 ? 1 : part;
      }
    });

    _requestData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _requestData() async {
    _isLoading = true;
    ApiHatActivityAtlasResponse response = await HatRequest.getHandbookData();
    _isLoading = false;
    _atlasResponse = response;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Loading());
    } else {
      if (!_atlasResponse.success) {
        return _errorWidget();
      }
    }
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: Util.width, height: Util.height, child: _renderBody()),
          PositionedDirectional(top: 0, start: 0, end: 0, child: _headWidget())
        ],
      ),
      backgroundColor: const Color(0xff32025B),
    );
  }

  Widget _renderBody() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Stack(alignment: Alignment.center, children: [
              R.img(
                RoomAssets.chat_room$grab_hat_hat_head_bg_webp,
                width: Util.width,
                fit: BoxFit.fitWidth,
              ),
              PositionedDirectional(
                top: Util.statusHeight,
                start: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 44,
                      width: 44,
                      alignment: Alignment.center,
                      child: R.img(RoomAssets.chat_room$back_svg,
                          color: Colors.white, width: 24, height: 24)),
                ),
              ),
              Positioned(
                bottom: 28,
                child: Stack(alignment: Alignment.center, children: [
                  R.img(
                    RoomAssets.chat_room$grab_hat_hat_date_bg_webp,
                    width: 153,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    _activeTime() ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: Util.numFontFamily,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]),
              ),
              if (_atlasResponse.data.activity.helpUrl.isNotEmpty)
                PositionedDirectional(
                  top: Util.statusHeight + 60.dp,
                  end: 0,
                  child: GestureDetector(
                    onTap: () {
                      // String url = Util.getHelpUrlWithQStr('k129');
                      BaseWebviewScreen.show(context,
                          url: _atlasResponse.data.activity.helpUrl);
                    },
                    child: Container(
                      width: 63,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(50),
                              bottomStart: Radius.circular(50)),
                          gradient: LinearGradient(
                            colors: [Color(0xffFEEDD4), Color(0xffFBB989)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: Container(
                        width: 62,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(50),
                                bottomStart: Radius.circular(50)),
                            gradient: LinearGradient(
                              colors: [Color(0xffFAD7CD), Color(0xff8544C5)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                        child: const Text(
                          '规则说明',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              PositionedDirectional(
                top: Util.statusHeight + 100.dp,
                end: 0,
                child: GestureDetector(
                  onTap: () {
                    HatRewardPage.launch(context);
                  },
                  child: Container(
                    width: 63,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(50),
                            bottomStart: Radius.circular(50)),
                        gradient: LinearGradient(
                          colors: [Color(0xffFEEDD4), Color(0xffFBB989)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                    child: Container(
                      width: 62,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(50),
                              bottomStart: Radius.circular(50)),
                          gradient: LinearGradient(
                            colors: [Color(0xffFADFCD), Color(0xffC544B1)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: const Text(
                        '榜单奖励',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: _tabWidget(0, widgetKey: _tabWidgetKey),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((value) => _renderContentWidget(value)).toList(),
      ),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _atlasResponse.message,
        onTap: () {
          _requestData();
          if (mounted) {
            setState(() {});
          }
        },
      ),
    );
  }

  Widget _headWidget() {
    return Column(children: [
      Obx(() => AnimatedOpacity(
            opacity: _headOpacity.value,
            duration: const Duration(milliseconds: 100),
            child: Container(
              color: Colors.white,
              width: Util.width,
              height: Util.statusHeight + 44,
              padding: EdgeInsetsDirectional.only(top: Util.statusHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 44,
                        width: 44,
                        alignment: Alignment.center,
                        child: R.img(RoomAssets.chat_room$back_svg,
                            color: Colors.black, width: 24, height: 24)),
                  ),
                  const Text(
                    '帽王争霸赛',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 44,
                  ),
                ],
              ),
            ),
          )),
    ]);
  }

  Widget _tabWidget(double top, {Key? widgetKey}) {
    return Obx(() => Container(
          clipBehavior: Clip.none,
          key: widgetKey,
          padding: EdgeInsetsDirectional.only(
              start: 15, end: 15, top: top + 8, bottom: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff201050), Color(0xff32025B)],
          )),
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xff381E6B),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  PositionedDirectional(
                      top: -10,
                      start:
                          _tabAnimationValue.value * (Util.width - 30) / 2 - 5,
                      child: R.img(
                          RoomAssets.chat_room$grab_hat_hat_choose_bg_webp,
                          width: (Util.width - 16) / 2)),
                  TabBar(
                    controller: _tabController,
                    tabs: _tabs
                        .map(
                          (value) => Tab(
                            text: value,
                          ),
                        )
                        .toList(),
                    indicatorWeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white.withOpacity(0.7),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ]),
          ),
        ));
  }

  Widget _renderContentWidget(String value) {
    if (value == '帽子图鉴') {
      return HatPictureBookWidget(
        activityData: _atlasResponse.data,
      );
    } else if (value == '点亮榜单') {
      return HatRankWidget(
        key: _hatRankWidgetKey,
      );
    }
    return const SizedBox.shrink();
  }

  String? _activeTime() {
    if (!_atlasResponse.data.hasActivity()) {
      return null;
    }
    DateFormat format = DateFormat('MM月dd日');

    DateTime s = DateTime.fromMillisecondsSinceEpoch(
        _atlasResponse.data.activity.startAt * 1000);
    DateTime e = DateTime.fromMillisecondsSinceEpoch(
        _atlasResponse.data.activity.endAt * 1000);

    return '${format.format(s)}-${format.format(e)}';
  }
}

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar tabBar;
//
//   _SliverAppBarDelegate(this.tabBar);
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // TODO: implement build
//     return Container(
//       child: Container(
//           margin: EdgeInsetsDirectional.only(start: 15, end: 15),
//           decoration: BoxDecoration(
//             color: Color(0xff381E6B),
//             borderRadius: BorderRadius.circular(18),
//           ),
//           child: tabBar),
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Color(0xff201050), Color(0xff260C54)],
//       )),
//     );
//   }
//
//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => tabBar.preferredSize.height;
//
//   @override
//   // TODO: implement minExtent
//   double get minExtent => tabBar.preferredSize.height;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     // TODO: implement shouldRebuild
//     return false;
//   }
// }
