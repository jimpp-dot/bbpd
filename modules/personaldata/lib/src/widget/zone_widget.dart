import 'package:shared/dart_extensions/widget/visible_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/personaldata.dart';
import 'package:personaldata/src/achievement_wall/widget/achievement_wall_display_widget.dart';
import 'package:personaldata/src/game_master/game_master_card_list_screen.dart';
import 'package:personaldata/src/game_master/game_master_entrance.dart';
import 'package:personaldata/src/game_master/game_master_game_list_screen.dart';
import 'package:personaldata/src/game_master/model/game_master_api.dart';
import 'package:personaldata/src/game_master/model/pb/generated/slp_godcard.pb.dart';
import 'package:personaldata/src/qualifying/widget/qualifying_widget.dart';
import '../../k.dart';
import '../model/recent_playing_games.dart';
import 'group_new_widget.dart';
import 'recent_playing_widget.dart';

/// 个人主页面-空间

class ZoneWidget extends StatefulWidget {
  final int uid;
  final HomeProfileData? profile;
  final HomeProfileSyncData? profileSync;
  final RefreshCallback reload;

  const ZoneWidget(
      {Key? key,
      this.uid = 0,
      this.profile,
      this.profileSync,
      required this.reload})
      : super(key: key);

  @override
  State<ZoneWidget> createState() => _ZoneWidgetState();
}

class _ZoneWidgetState extends State<ZoneWidget>
    with AutomaticKeepAliveClientMixin<ZoneWidget> {
  List<HomeProfileGameItem> _gameInfo = [];
  ResGodCardList? _gameMasterCardList;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    Future.wait([
      if (widget.profile?.base.godcardBlock == 1)
        Future.sync(() async {
          _gameMasterCardList =
              await GameMasterAPI.getGameCardListRes(widget.uid);
        }),
      Future.sync(() async {
        _gameInfo = await RecentPlayingGamesRepository.getRecentPlayingGames(
            widget.profile?.base.uid ?? 0,
            source: RecentPlayingGamesRepository.SOURCE_PROFILE);
      })
    ]).then((value) {
      refresh();
    });
  }

  // 展示礼物图鉴入口
  Widget showGiftBookWidget() {
    if (widget.profile?.briefInfo != null) {
      IPersonalDataManager personalManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      return personalManager.getGiftWallPanelWidget(
          widget.uid,
          widget.profile?.briefInfo.lightNum ?? 0,
          widget.profile?.briefInfo.total ?? 0,
          widget.profile?.briefInfo.rank ?? 0,
          widget.profile?.briefInfo.icon ?? "",
          widget.profile?.briefInfo.levelList ?? [],
          refer:
              widget.uid == Session.uid ? 'my_home_zone' : 'other_home_zone');
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    bool isShowGift = !(widget.profile?.isCloseGiftWall == true) &&
        widget.profile?.hasGiftWall() == true;

    return RefreshIndicatorFactory.of(
        child: CustomScrollView(
          key: const PageStorageKey<String>(ImageScreenTabType.info),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                GiftWallWidget(
                  gifts: widget.profile?.gift,
                  giftWall: widget.profile?.giftWall,
                  uid: widget.profile?.base.uid ?? 0,
                  giftChange: widget.reload,
                ),

                /**
                    showGiftBookWidget(),
                    // 座驾墙
                    if (widget.profileSync?.mountSerialData.isNotEmpty == true)
                    vipManager.getPersonalMountWidget(widget.uid, widget.profileSync!.mountSerialData),

                    // 旧的礼物墙
                    if (!(widget.profile?.isCloseGiftWall == true) && widget.profile?.hasGiftWall() == true)
                    GiftWallWidget(
                    gifts: widget.profile?.gift,
                    giftWall: widget.profile?.giftWall,
                    uid: widget.profile?.base.uid ?? 0,
                    giftChange: widget.reload,
                    ),
                    // 成就墙
                    if (Util.isSLPAll() && widget.profile != null && widget.profile?.achieveBadge.isNotEmpty == true)
                    AchievementWallDisplayWidget(
                    uid: widget.profile?.base.uid ?? 0, achieveBadge: widget.profile?.achieveBadge),

                    // PK战绩
                    if (widget.profile?.hasCpkSummary() == true)
                    QualifyingWidget(uid: widget.profile?.base.uid ?? 0, qualifying: widget.profile?.cpkSummary),
                    // 甜蜜小屋
                    /*if (Util.isSLPAll())
                    CpSmallHouseEntryWidget(
                    uid: widget.uid,
                    hasCpHouse: widget.profile?.base?.hasCpHouse ?? false,
                    icon: widget.profile?.base?.icon ?? '',
                    ),*/
                    // 收藏室
                    if (Util.parseBool(widget.profile?.exhibitionDisplay) == true) _buildCollectionRoom(),
                    // 主播卡
                    if (_gameMasterCardList != null) _buildGameMasterCard(_gameMasterCardList!),
                    // 所在圈子
                    GroupNewWidget(data: widget.profile),
                    // 最近在玩
                    RecentPlayingGames(uid: widget.profile?.base.uid ?? 0, recentPlayingGames: _gameInfo),


                 *
                 * */

                const SizedBox(height: 32),
              ]),
            )
          ],
        ),
        onRefresh: widget.reload);
  }

  /// 收藏室
  Widget _buildCollectionRoom() {
    IPersonalDataManager personalManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 1),
      child: InkWell(
        onTap: () {
          if (Session.uid != widget.profile?.base.uid) return;
          personalManager.showCollectionRoomPage(context,
              targetUid: widget.profile?.base.uid ?? 0);
        },
        child: Column(
          children: [
            SizedBox(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    K.personal_cr_title,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            personalManager.getCollectionDisplayWidget(
              System.context,
              targetUid: widget.profile?.base.uid ?? 0,
              commodityItems: widget.profile?.exhibitData,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  /// 主播卡
  Widget _buildGameMasterCard(ResGodCardList cardList) {
    List<Widget> items = [];
    _gameMasterCardList?.list.forEach((element) {
      items.add(GameMasterEntranceCard(
        element,
        () {
          GameMasterCardListSceen.show(context, widget.uid);
        },
        () {},
      ));
    });
    if (widget.uid == Session.uid && cardList.list.length < 3) {
      //主播添加游戏卡片
      items.add(GameMasterEntranceAddCard(
        addGameCard: () {
          GameMasterGameListSceen.show(context);
        },
      ));
    } else if (_gameMasterCardList?.list.isEmpty ?? false) {
      //其他人看主播的空卡片
      items.add(GameMasterEntranceEmptyCard(() {
        GameMasterCardListSceen.show(context, widget.uid);
      }));
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 1),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            SizedBox(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    K.personaldata_gm_master_card,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 72,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsetsDirectional.only(end: 8),
                children: items,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
