import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/game_master/game_master_edit_screen.dart';
import 'package:personaldata/src/game_master/game_master_game_list_screen.dart';

import 'model/game_master_api.dart';
import 'model/pb/generated/slp_godcard.pb.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

class GameMasterCardListSceen extends StatefulWidget {
  static const RouteName = '/gameMasterGameCardList';
  ResGodCardList? gameCardList;
  int uid;

  bool get canEdit {
    return Session.uid == uid;
  }

  GameMasterCardListSceen(this.uid, {this.gameCardList, Key? key})
      : super(key: key);

  @override
  State<GameMasterCardListSceen> createState() =>
      _GameMasterCardListSceenState();

  static void show(BuildContext context, int uid,
      {ResGodCardList? gameCardList}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            GameMasterCardListSceen(uid, gameCardList: gameCardList),
        settings: const RouteSettings(name: GameMasterCardListSceen.RouteName),
      ),
    );
  }
}

class _GameMasterCardListSceenState extends State<GameMasterCardListSceen> {
  ResGodCardList? _gameCardList;
  GodLevelProgressData? _missionData;
  late RecommendMasterRepository _repository;
  var _key = GlobalKey<SliverAnimatedListState>();

  @override
  void initState() {
    super.initState();

    _repository = RecommendMasterRepository();
    _gameCardList = widget.gameCardList;
    _loadData(_gameCardList == null, true);

    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
  }

  @override
  void dispose() {
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    super.dispose();
  }

  void _onPageChanged(String type, dynamic data) {
    String topRouterName = '';

    if (data != null) {
      if (data is List) {
        List routes = data;
        topRouterName = routes.first;
      } else if (data is String) {
        topRouterName = data;
      }
    }

    if (topRouterName == GameMasterCardListSceen.RouteName) {
      _loadData(true, false);
    }
  }

  void _loadData(bool refreshCards, bool refreshRecommends) async {
    if (refreshCards) {
      ResGodCardList? res;

      await Future.wait([
        Future(() async {
          res = await GameMasterAPI.getGameCardListRes(widget.uid);
        }),
        if (widget.uid == Session.uid)
          Future(() async {
            ResGodLevelProgress missionRes =
                await GameMasterAPI.getMissionRes();
            if (!missionRes.success && missionRes.msg.isNotEmpty) {
              Fluttertoast.showCenter(msg: missionRes.msg);
            } else if (missionRes.success &&
                !Util.isNullOrEmpty(missionRes.data.level)) {
              _missionData = missionRes.data;
            }
          }),
        Future(() async {
          await _repository.refresh();
        }),
      ]);

      if (res!.success) {
        _key = GlobalKey<SliverAnimatedListState>();
        _gameCardList = res;
      } else {
        Fluttertoast.showCenter(msg: res!.msg);
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<bool> _deleteGameCard(int gameId) async {
    ResGodCardList res = await GameMasterAPI.deleteGameMasterCardRes(gameId);
    return res.success;
  }

  @override
  Widget build(BuildContext context) {
    Widget? stateWidget;
    List<Widget> slivers = [];

    if (_gameCardList == null) {
      stateWidget = const Center(
        child: Loading(),
      );
    } else if (!_gameCardList!.success) {
      stateWidget = Center(
        child: ErrorData(
          error: _gameCardList!.msg,
          onTap: () => _loadData(_gameCardList == null, true),
        ),
      );
    } else if (_gameCardList!.list.isEmpty &&
        _repository.isEmpty &&
        _missionData == null) {
      stateWidget = const Center(
        child: EmptyWidget(),
      );
    }

    if (stateWidget == null) {
      //主播卡卡片
      if (_gameCardList!.list.isNotEmpty) {
        slivers.add(
          SliverPadding(
            padding: const EdgeInsetsDirectional.all(10),
            sliver: SliverAnimatedList(
              key: _key,
              initialItemCount: _gameCardList!.list.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return _buildGameCard(index, animation);
              },
            ),
          ),
        );
      } else {
        slivers.add(_buildEmptyCard());
      }

      if (_missionData != null) {
        //主播卡任务
        slivers.addAll([
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  R.img(
                    'game_master/game_master_recommend_star.webp',
                    package: ComponentManager.MANAGER_PERSONALDATA,
                    width: 13,
                    height: 13,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    K.personaldata_gm_mission_title,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  R.img(
                    'game_master/game_master_recommend_star.webp',
                    package: ComponentManager.MANAGER_PERSONALDATA,
                    width: 13,
                    height: 13,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsetsDirectional.all(10),
              sliver: SliverToBoxAdapter(
                child: _buildMissionWidget(),
              ))
        ]);
      }

      if (_repository.isNotEmpty) {
        //推荐主播
        slivers.addAll([
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  R.img(
                    'game_master/game_master_recommend_star.webp',
                    package: ComponentManager.MANAGER_PERSONALDATA,
                    width: 13,
                    height: 13,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    K.personaldata_gm_recommend,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  R.img(
                    'game_master/game_master_recommend_star.webp',
                    package: ComponentManager.MANAGER_PERSONALDATA,
                    width: 13,
                    height: 13,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.all(10),
            sliver: LoadingMoreSliverList(
              SliverListConfig<RecommendGodList>(
                  itemBuilder:
                      (BuildContext context, RecommendGodList item, int index) {
                    return _buildRecommendMaster(index);
                  },
                  sourceList: _repository,
                  indicatorBuilder: _indicatorBuilder,
                  autoRefresh: false),
            ),
          ),
        ]);
      }

      slivers.add(
        const SliverSafeArea(
            sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: 0,
          ),
        )),
      );
    }

    return Scaffold(
      appBar: BaseAppBar(
        K.personaldata_gm_game_card,
        actionTitle: (_gameCardList != null &&
                _gameCardList!.list.length < 3 &&
                widget.canEdit)
            ? K.personaldata_gm_create_card
            : '',
        onPressed: () {
          GameMasterGameListSceen.show(context,
              fromRouteName: GameMasterCardListSceen.RouteName);
        },
      ),
      body: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: RefreshIndicatorFactory.of(
          onRefresh: () async {
            _loadData(true, true);
          },
          child: stateWidget ??
              CustomScrollView(
                slivers: slivers,
              ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildEmptyCard() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 10, bottom: 20),
        child: SizedBox(
          height: 154,
          child: Stack(
            alignment: Alignment.center,
            children: [
              R.img(
                'game_master/game_master_card_empty.webp',
                package: ComponentManager.MANAGER_PERSONALDATA,
                fit: BoxFit.cover,
              ),
              Text(K.personaldata_gm_no_card,
                  style:
                      const TextStyle(color: Color(0x4D313131), fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard(int index, Animation animation,
      {GodCardList? removingData}) {
    GodCardList data = removingData ?? _gameCardList!.list[index];
    Container cardContent = Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: R.color.thirdBgColor,
              ),
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: double.infinity,
              ),
              child: CachedNetworkImage(
                imageUrl: '${System.imageDomain}${data.cardBg}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          child: CachedNetworkImage(
                            imageUrl: '${System.imageDomain}${data.icon}',
                            width: 58,
                            height: 58,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: InkWell(
                            onTap: () {
                              Tracker.instance
                                  .track(TrackEvent.click, properties: {
                                'click_page': 'god_card_copy',
                              });
                              Clipboard.setData(
                                  ClipboardData(text: data.gameId));
                              Toast.show(context, K.personaldata_gm_did_copy);
                            },
                            child: Row(
                              children: [
                                LimitedBox(
                                  maxWidth: Util.width - 180,
                                  child: Text(data.gameId,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                R.img(
                                  'game_master/game_master_copy.webp',
                                  width: 16,
                                  height: 16,
                                  package:
                                      ComponentManager.MANAGER_PERSONALDATA,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (widget.canEdit)
                        Container(
                          height: 58,
                          alignment: AlignmentDirectional.topEnd,
                          child: InkWell(
                            onTap: () {
                              GameMasterEditScreen.show(
                                context,
                                data.gameId,
                                data.id,
                                fromRouteName:
                                    GameMasterCardListSceen.RouteName,
                              );
                            },
                            child: R.img(
                              'game_master/game_master_card_edit.webp',
                              width: 24,
                              height: 24,
                              package: ComponentManager.MANAGER_PERSONALDATA,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: List.generate(data.gameSubCate.length, (index) {
                        return Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.gameSubCate[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white.withAlpha(122),
                                  fontSize: 11),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              data.gameSubCate[index].value,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (widget.canEdit) {
      return SlideTransition(
        position: animation.drive(CurveTween(curve: Curves.easeIn)).drive(
            Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))),
        child: Container(
          height: 170,
          padding: const EdgeInsetsDirectional.only(bottom: 16),
          child: Slidable(
            closeOnScroll: true,
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              extentRatio: 0.25,
              children: [
                CustomSlidableAction(
                  onPressed: (context) async {
                    GodCardList removingData = _gameCardList!.list[index];
                    _gameCardList!.list.removeAt(index);
                    _key.currentState!.removeItem(
                        index,
                        (context, animation) => _buildGameCard(index, animation,
                            removingData: removingData),
                        duration: const Duration(milliseconds: 300));
                    bool success = await _deleteGameCard(data.id);
                    if (success) {
                      //成功刷新新建按钮和空卡片的状态
                      if (mounted) setState(() {});
                    } else {
                      //失败重新刷新数据源
                      _loadData(true, false);
                    }
                  },
                  child: Container(
                    width: 68,
                    height: 68,
                    alignment: AlignmentDirectional.centerEnd,
                    child: R.img(
                      'game_master/game_master_card_delete.webp',
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            child: cardContent,
          ),
        ),
      );
    } else {
      return Container(
          height: 170,
          padding: const EdgeInsetsDirectional.only(bottom: 16),
          child: cardContent);
    }
  }

  Widget _buildMissionWidget() {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(colors: [
                  Color(0xFF130800),
                  Color(0xFF241811),
                  Color(0xFF49392E)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: CachedNetworkImage(
              imageUrl: 'static/personal/game_master_mission_bg.webp',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  CommonAvatar(
                    path: Session.icon,
                    size: 48,
                    shape: BoxShape.circle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Text(Session.name,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFFFEAD3),
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis))),
                  R.img(
                      _missionData!.level == 'S+'
                          ? 'game_master/game_master_level_s_plus.webp'
                          : 'game_master/game_master_level_s.webp',
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      width: 36,
                      height: 36,
                      color: const Color(0xFFFFD87C)),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Divider(
                height: 1,
                color: const Color(0xFFFFFCFC).withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      _missionData!.level,
                      style: const TextStyle(
                          color: Color(0xFFFFD76B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(K.personaldata_gm_mission_level,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFFCDAE9E).withOpacity(0.9)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(K.personaldata_gm_mission_gift,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFFCDAE9E).withOpacity(0.9))),
                    Text(
                        '${_missionData!.giftNum}/${_missionData!.upgradeGiftNum}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFEAD3),
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(K.personaldata_gm_mission_money,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFFCDAE9E).withOpacity(0.9))),
                    Text('${_missionData!.money}/${_missionData!.upgradeMoney}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFEAD3),
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(K.personaldata_gm_mission_mactime,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFFCDAE9E).withOpacity(0.9))),
                    Text(
                        '${_missionData!.macTime}/${_missionData!.upgradeMacTime}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFEAD3),
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(K.personaldata_gm_mission_boss,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFFCDAE9E).withOpacity(0.9))),
                    Text(
                        '${_missionData!.bossNum}/${_missionData!.upgradeBossNum}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFEAD3),
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRecommendMaster(int index) {
    RecommendGodList item = _repository[index];
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: InkWell(
        onTap: () {
          if (item.rid > 0) {
            //主播在房间就跳转去房间
            IRoomManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            manager.openChatRoomScreenShow(context, item.rid,
                refer: 'god_card_recommend');
          } else {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, item.uid,
                refer: const PageRefer('god_card_recommend'));
          }
        },
        child: Container(
          height: 80,
          alignment: AlignmentDirectional.centerStart,
          child: Stack(
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: R.img(
                  'game_master/game_master_recommend_bg.webp',
                  package: ComponentManager.MANAGER_PERSONALDATA,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  RoundNetIcon(
                    url: item.icon,
                    size: 48.0,
                    inRoom: item.rid > 0,
                    isOnline: item.onlineStatus == 1,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(children: [
                          UserSexAndAgeWidget(sex: item.sex, age: item.age),
                          SizedBox(
                            height: 22,
                            child: CachedNetworkImage(
                              imageUrl: "${System.imageDomain}${item.tagIcon}",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(end: 15),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      children: [
                        Text(K.personaldata_gm_master_level,
                            style: const TextStyle(
                                color: Color(0xFFBC6C26), fontSize: 13)),
                        const SizedBox(width: 3),
                        R.img(
                          item.level == 'S+'
                              ? 'game_master/game_master_level_s_plus.webp'
                              : 'game_master/game_master_level_s.webp',
                          package: ComponentManager.MANAGER_PERSONALDATA,
                          width: 36,
                          height: 36,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(
        hasMore: false,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
            onTap: () => _loadData(_gameCardList == null, true),
            fontColor: Colors.white.withOpacity(0.4)),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: R.string('data_error'),
        loadMore: _repository.loadMore,
        textColor: Colors.white.withOpacity(0.4),
      );
    } else if (status == IndicatorStatus.empty) {
      //空数据不展示
      return const SliverToBoxAdapter();
    }
    return const LoadingFooter(hasMore: true);
  }
}

class RecommendMasterRepository extends LoadingMoreBase<RecommendGodList> {
  bool _hasMore = true;
  int _page = 1;

  RecommendMasterRepository();

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    await loadData();
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    bool isSuccess = false;

    if (!isLoadMoreAction) {
      clear();
      _hasMore = true;
      _page = 1;
    }

    ResRecommendGodList recommendRes =
        await GameMasterAPI.getRecommendMastertRes(_page);

    if (recommendRes.success) {
      addAll(recommendRes.list);
      _page++;
      isSuccess = true;
      _hasMore = recommendRes.list.isNotEmpty;
    } else {
      isSuccess = false;
    }

    return isSuccess;
  }
}
