import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:loading_more_list/loading_more_list.dart';
import 'package:profile/k.dart';
import 'package:profile/src/api/api.dart';
import 'package:profile/src/model/nl_friend_recommend_model.dart';
import 'package:intl/intl.dart';

/// 新贵NL转化 好友推荐列表
class NLFriendRecommendScreen extends StatefulWidget {
  const NLFriendRecommendScreen({super.key});

  @override
  _NLFriendRecommendScreenState createState() =>
      _NLFriendRecommendScreenState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NLFriendRecommendScreen(),
      settings: const RouteSettings(name: '/NLFriendRecommendScreen'),
    ));
  }
}

class _NLFriendRecommendScreenState extends State<NLFriendRecommendScreen>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;
  late List<String> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [K.profile_nl_friend_recommend, K.profile_nl_achieve];
    safeRun(
      () => _tabController =
          ExtendedTabController(length: _tabs.length, vsync: this),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.profile_nl_friend_board,
        actionTitle: K.profile_nl_friend_rule,
        actionColor: R.color.secondTextColor,
        onPressed: () {
          _showRule();
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTab(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NLRecommendFriendsPage(),
                  NLAchieveRankPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //跳转规则h5
  _showRule() {
    BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k62'));
  }

  _buildTab() {
    return Container(
      height: 36.0,
      padding: const EdgeInsetsDirectional.only(start: 10.0),
      margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
      child: CommonTabBar(
        tabs: _tabs.map((e) => Text(e)).toList(),
        isScrollable: true,
        controller: _tabController,
        labelStyle: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      ),
    );
  }
}

/// 成就榜
class NLAchieveRankPage extends StatefulWidget {
  const NLAchieveRankPage({super.key});

  @override
  _NLAchieveRankPageState createState() => _NLAchieveRankPageState();
}

class _NLAchieveRankPageState extends State<NLAchieveRankPage>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;
  late List<String> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [
      K.profile_nl_friend_achieve_this_week,
      K.profile_nl_friend_achieve_last_week
    ];
    safeRun(
      () => _tabController =
          ExtendedTabController(length: _tabs.length, vsync: this),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        _buildTab(),
        const SizedBox(
          height: 6,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              NLAchieveList(type: 1),
              NLAchieveList(type: 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab() {
    return SubTabScrollWidget(
      controller: _tabController,
      tabLabels: _tabs,
    );
  }
}

class NLAchieveList extends StatefulWidget {
  final int type; //1 本周排名 2 上周排名

  const NLAchieveList({super.key, required this.type});

  @override
  _NLAchieveListState createState() => _NLAchieveListState();
}

class _NLAchieveListState extends State<NLAchieveList>
    with AutomaticKeepAliveClientMixin {
  late NLAchieveRankSource _source;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _source = NLAchieveRankSource(this, widget.type);
  }

  @override
  void dispose() {
    super.dispose();
  }

  refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        Expanded(
          child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _source.refresh();
            },
            child: LoadingMoreList(
              ListConfig(
                itemBuilder:
                    (BuildContext context, NLAchieveRankItem item, int index) {
                  return _buildItem(item, index);
                },
                sourceList: _source,
                indicatorBuilder: _indicatorBuilder,
                lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
              ),
            ),
          ),
        ),
        if (_source.my != null) _buildMyRank(_source.my!),
      ],
    );
  }

  Widget _buildItem(NLAchieveRankItem item, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid,
            refer: const PageRefer("/NLFriendRecommendScreen"));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 11, top: 8, end: 16, bottom: 9),
        height: 65,
        child: Row(
          children: [
            _buildRankWidget(index + 1),
            const SizedBox(
              width: 5,
            ),
            CommonAvatar(
              path: item.icon,
              size: 48,
              shape: BoxShape.circle,
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 210),
                  child: Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            NumText(
              '${nlAchieveRankWidget(item.score.toString())} ${K.profile_nl_friend_score}',
              style: TextStyle(
                  fontSize: 15,
                  color: R.color.secondTextColor,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankWidget(int index) {
    return SizedBox(
      width: 40,
      height: 27,
      child: Center(
        child: nlAchieveRankWidget(index.toString()),
      ),
    );
  }

  Widget _buildMyRank(NLAchieveRankItem userInfo) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
      height: 72,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -4.0),
            blurRadius: 4.0,
            spreadRadius: 0,
            color: Color(0x14000000),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Center(
              child: nlAchieveRankWidget(userInfo.rank),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, userInfo.uid,
                  refer: const PageRefer("/NLFriendRecommendScreen"));
            },
            child: CommonAvatar(
              path: userInfo.icon,
              size: 52,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: Util.width - 240),
            child: Text(
              userInfo.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: R.color.mainTextColor),
            ),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              //规则页
              BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k62'));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NumText(
                  '${nlAchieveRankWidget(userInfo.score.toString())} ${K.profile_nl_friend_score}',
                  style: TextStyle(
                      fontSize: 13,
                      color: R.color.secondTextColor,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  width: 32,
                  alignment: AlignmentDirectional.centerStart,
                  child: R.img('fans/fan_my_rank_arrow_right.webp',
                      color: R.color.thirdTextColor,
                      width: 16,
                      height: 16,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class NLAchieveRankSource extends LoadingMoreBase<NLAchieveRankItem> {
  final int type;
  final _NLAchieveListState achieveListState;

  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  NLAchieveRankItem? my;

  NLAchieveRankSource(this.achieveListState, this.type);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      NLAchieveRankRsp result = await Api.getNLAchieveRankData(type, page);

      if (page == 1) {
        clear();

        my = result.data?.my;
        if (my != null) achieveListState.refresh();
      }

      result.data?.list.forEach((element) {
        add(element);
      });

      _hasMore = result.data?.more ?? false;
      page++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }

    return isSuccess;
  }
}

/// 好友推荐列表
class NLRecommendFriendsPage extends StatefulWidget {
  const NLRecommendFriendsPage({super.key});

  @override
  _NLRecommendFriendsPageState createState() => _NLRecommendFriendsPageState();
}

class _NLRecommendFriendsPageState extends State<NLRecommendFriendsPage> {
  late NLRecommendFriendsSource _source;

  @override
  void initState() {
    super.initState();

    _source = NLRecommendFriendsSource();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        await _source.refresh();
      },
      child: LoadingMoreList(
        ListConfig(
          itemBuilder:
              (BuildContext context, NLRecommendFriendItem item, int index) {
            return _buildItem(item);
          },
          sourceList: _source,
          indicatorBuilder: _indicatorBuilder,
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        ),
      ),
    );
  }

  Widget _buildItem(NLRecommendFriendItem item) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 18, end: 20, top: 0, bottom: 0),
      height: 88,
      child: Row(
        children: [
          StatusAvatar(
            roomName: item.tagInfo?.show,
            roomIcon: item.tagInfo?.acuteIcon,
            colors: Util.parseColors(item.tagInfo?.bgColors),
            userAvatar: System.imageDomain + item.icon,
            uid: item.uid,
            rid: item.rid,
            online: item.online,
            onTap: () {
              if (item.rid > 0) {
                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                roomManager.openChatRoomScreenShow(context, item.rid,
                    refer: "/NLFriendRecommendScreen", uid: item.uid);
              } else if (item.online) {
                IChatManager chatManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_CHAT);
                chatManager.openUserChatScreen(
                  context,
                  type: 'private',
                  targetId: item.uid,
                  title: item.name,
                );
              } else {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid,
                    refer: const PageRefer("/NLFriendRecommendScreen"));
              }
            },
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Util.width - 230),
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor),
                ),
              ),
              Row(
                children: [
                  if (item.sex > 0)
                    UserSexAndAgeWidget(
                      sex: item.sex,
                      age: item.age,
                      width: 31,
                      height: 14,
                    ),
                  if (item.popularityLevel > 0)
                    UserPopularity(
                      popularityLevel: item.popularityLevel,
                      height: 22,
                    ),
                  if (item.vipLevel > 0)
                    UserVipWidget(
                      vip: item.vipLevel,
                      height: 22,
                    ),
                ],
              ),
              Container(
                constraints: BoxConstraints(maxWidth: Util.width - 230),
                child: Text(
                  K.profile_nl_friend_score_get(
                      [(nlScoreToString(item.score.toString()))]),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.distance,
                style: TextStyle(fontSize: 11, color: R.color.thirdTextColor),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () async {
                  if (item.follow == 0) {
                    //关注
                    NormalNull response = await BaseRequestManager.onFollow(
                        item.uid.toString(),
                        refer: '/NLFriendRecommendScreen');
                    if (response.success) {
                      if (mounted) {
                        setState(() {
                          item.follow = 1;
                        });
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: response.msg, gravity: ToastGravity.CENTER);
                    }
                  } else {
                    //去聊天
                    IChatManager chatManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_CHAT);
                    chatManager.openUserChatScreen(
                      context,
                      type: 'private',
                      targetId: item.uid,
                      title: item.name,
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 63,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  child: Text(
                    item.follow == 0
                        ? K.profile_nl_friend_follow
                        : K.profile_nl_friend_goto_chat,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class NLRecommendFriendsSource extends LoadingMoreBase<NLRecommendFriendItem> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  NLRecommendFriendsSource();

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      NLRecommendFriendRsp result = await Api.getNLRecommendFriendData(page);

      if (page == 1) {
        clear();
      }

      result.data?.list.forEach((element) {
        add(element);
      });

      _hasMore = false;
      page++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }

    return isSuccess;
  }
}

String nlScoreToString(String score) {
  double money0 = Util.parseDouble(score);
  if (money0 < 10000) return score;

  double money = Util.parseInt(score) ~/ 100 * 100 / 10000; // 取小数点时不进行四舍五入
  NumberFormat format = NumberFormat();
  format.maximumFractionDigits = 2;
  format.minimumFractionDigits = 0;

  return '${format.format(money)}W';
}

// rank 0 开始
Widget nlAchieveRankWidget(String rankStr) {
  if (rankStr.isEmpty || rankStr == '-') {
    return NumText(
      '-',
      style: TextStyle(
          fontSize: 17,
          color: R.color.thirdTextColor,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
    );
  }

  int rank = Util.parseInt(rankStr) - 1;
  if (rank < 3) {
    return R.img('fans/fan_rank_${rank + 1}.webp',
        width: 30, height: 27, package: ComponentManager.MANAGER_BASE_ROOM);
  }

  String numStr = '';

  if (rank < 9) {
    numStr = '0${rank + 1}';
  } else if (rank < 99) {
    numStr = '${rank + 1}';
  } else {
    numStr = '99+';
  }

  return NumText(
    numStr,
    style: const TextStyle(
        fontSize: 17,
        color: Color(0XFFFFD04B),
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic),
  );
}
