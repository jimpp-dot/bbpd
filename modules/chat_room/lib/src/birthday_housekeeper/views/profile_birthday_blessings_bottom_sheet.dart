import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';

import 'birthday_send_blessings_page.dart';
import '../model/birthday_list_data_source.dart';
import '../model/birthday_type.dart';
import '../model/generated/gs_birthday.pb.dart';

/// 个人页祝福颂词/祝福好友

class ProfileBirthdayBlessingsBottomSheet extends StatefulWidget {
  final int uid;

  const ProfileBirthdayBlessingsBottomSheet(this.uid, {Key? key})
      : super(key: key);

  @override
  State<ProfileBirthdayBlessingsBottomSheet> createState() =>
      _ProfileBirthdayBlessingsBottomSheetState();

  static Future<bool?> show(BuildContext context, int uid, {Key? key}) async {
    return await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.4),
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return ProfileBirthdayBlessingsBottomSheet(uid);
      },
    );
  }
}

class _ProfileBirthdayBlessingsBottomSheetState
    extends State<ProfileBirthdayBlessingsBottomSheet>
    with SingleTickerProviderStateMixin<ProfileBirthdayBlessingsBottomSheet> {
  final List<String> _tabs = [K.room_bless_words, K.room_bless_friends];
  final List<Widget> _pages = [];
  late ExtendedTabController _tabController;

  @override
  void initState() {
    super.initState();
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabs.length, vsync: this),
    );
    _pages.addAll([
      KeepAliveWrapper(child: ProfileBlessWordsPageView(widget.uid)),
      KeepAliveWrapper(child: ProfileBlessFriendsPageView(widget.uid)),
    ]);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height -
          120 -
          MediaQuery.of(context).padding.top -
          kToolbarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFFFEDD4), Color(0xFFFFCCA9)],
        ),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 48,
            child: Stack(
              children: [
                PositionedDirectional(
                  start: 10,
                  child: BackButton(
                    color: const Color(0xFFD49B71),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                _buildTab(),
                PositionedDirectional(
                  top: 12,
                  end: 20,
                  child: GestureDetector(
                    onTap: () {
                      BaseWebviewScreen.show(context,
                          url: Util.getHelpUrlWithQStr('k149'));
                    },
                    child: R.img(
                      'ferris_wheel_nav_bar_question.webp',
                      width: 24,
                      height: 24,
                      color: const Color(0xFFD49B71),
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return Center(
      child: SizedBox(
        width: 180,
        child: CommonTabBar(
          tabs: [
            for (int i = 0; i < _tabs.length; i++)
              Tab(
                child: Text(_tabs[i]),
              )
          ],
          labelColor: R.color.unionRankText1,
          controller: _tabController,
          unselectedLabelColor: R.color.unionRankText1.withOpacity(0.5),
          labelStyle: TextStyle(
              color: R.color.unionRankText1,
              fontSize: 15,
              fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(
              color: R.color.unionRankText1.withOpacity(0.6),
              fontSize: 13,
              fontWeight: FontWeight.w600),
          indicator: const CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Color(0xFFD49B71)),
            insets: EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 16.0,
            draggingWidth: 16.0,
          ),
          indicatorWeight: 0,
          marginStart: 8,
          marginEnd: 60,
          labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        ),
      ),
    );
  }
}

/// 祝福颂词页面
class ProfileBlessWordsPageView extends StatefulWidget {
  final int uid;

  const ProfileBlessWordsPageView(this.uid, {Key? key}) : super(key: key);

  @override
  State<ProfileBlessWordsPageView> createState() =>
      _ProfileBlessWordsPageViewState();
}

class _ProfileBlessWordsPageViewState extends State<ProfileBlessWordsPageView> {
  late BirthdayListDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = BirthdayListDataSource();
    _dataSource.type = BirthdayType.BirthdayBlessWords;
    _dataSource.uid = widget.uid;
    _dataSource.onUpdated = _onUpdated;
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_happywords'});
  }

  void _onUpdated() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _dataSource.refresh();
            },
            child: LoadingMoreList(
              ListConfig(
                itemBuilder:
                    (BuildContext context, GsBirthdayListItem item, int index) {
                  return _buildItem(item, index);
                },
                sourceList: _dataSource,
                indicatorBuilder: _indicatorBuilder,
                lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
              ),
            ),
          ),
        ),
        if (Session.uid != widget.uid &&
            Util.parseInt(_dataSource.extra?.uid) > 0) ...[
          Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12.0),
                topEnd: Radius.circular(12.0),
              ),
            ),
            child: Row(
              children: [
                CommonAvatar(
                  path: _dataSource.extra?.icon ?? '',
                  size: 52,
                  shape: BoxShape.circle,
                  onTap: () {
                    IPersonalDataManager personalDataManager = ComponentManager
                        .instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    personalDataManager.openImageScreen(
                        context, _dataSource.extra?.uid ?? 0);
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    K.room_today_ta_birthday_hurry_bless,
                    style: const TextStyle(
                        color: Color(0xFFBC6C26), fontSize: 15.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    BirthdaySendBlessingsPage.show(
                        context,
                        _dataSource.extra?.uid ?? 0,
                        _dataSource.extra?.extra.wish.birthday ?? 0);
                  },
                  child: Container(
                    width: 72,
                    height: 32,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      ),
                    ),
                    child: Text(
                      K.room_send_wishes,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.bottom,
          )
        ]
      ],
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
          _dataSource.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _dataSource.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _dataSource.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(GsBirthdayListItem item, int index) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.only(start: 20.0, end: 20.0, top: 12.0),
      child: Stack(
        children: [
          Container(
            // height: 80,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonAvatar(
                  path: item.icon,
                  size: 48,
                  shape: BoxShape.circle,
                  onTap: () {
                    IPersonalDataManager personalDataManager = ComponentManager
                        .instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    personalDataManager.openImageScreen(context, item.uid);
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (Util.validStr(item.extra.wish.wishContent)) ...[
                        const SizedBox(height: 8),
                        Text(
                          item.extra.wish.wishContent,
                          style: const TextStyle(
                              color: Color(0xFFBC6C26), fontSize: 13.0),
                        ),
                      ]
                    ],
                  ),
                )
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: R.img(
              RoomAssets
                  .chat_room$birthday_housekeeper_bless_words_item_bg_webp,
              width: 104,
              height: 80,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
        ],
      ),
    );
  }
}

/// 祝福好友页面
class ProfileBlessFriendsPageView extends StatefulWidget {
  final int uid;

  const ProfileBlessFriendsPageView(this.uid, {Key? key}) : super(key: key);

  @override
  State<ProfileBlessFriendsPageView> createState() =>
      _ProfileBlessFriendsPageViewState();
}

class _ProfileBlessFriendsPageViewState
    extends State<ProfileBlessFriendsPageView> {
  late BirthdayListDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = BirthdayListDataSource();
    _dataSource.type = BirthdayType.BirthdayBlessFriends;
    _dataSource.uid = widget.uid;
    _dataSource.onUpdated = _onUpdated;
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_wishfriend'});
  }

  void _onUpdated() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _dataSource.refresh();
            },
            child: LoadingMoreList(
              ListConfig(
                itemBuilder:
                    (BuildContext context, GsBirthdayListItem item, int index) {
                  return _buildItem(item, index);
                },
                sourceList: _dataSource,
                indicatorBuilder: _indicatorBuilder,
                lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
              ),
            ),
          ),
        ),
        if (Session.uid != widget.uid &&
            Util.parseInt(_dataSource.extra?.uid) > 0) ...[
          Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12.0),
                topEnd: Radius.circular(12.0),
              ),
            ),
            child: Row(
              children: [
                Text(
                  Util.parseInt(_dataSource.extra?.index) > 0
                      ? '${_dataSource.extra?.index ?? 0}'
                      : '-',
                  style: const TextStyle(
                      color: Color(0xFFBC6C26),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 13),
                CommonAvatar(
                  path: _dataSource.extra?.icon ?? '',
                  size: 40,
                  shape: BoxShape.circle,
                  onTap: () {
                    IPersonalDataManager personalDataManager = ComponentManager
                        .instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    personalDataManager.openImageScreen(
                        context, _dataSource.extra?.uid ?? 0);
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _dataSource.extra?.name ?? '',
                        style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const SizedBox(height: 2.0),
                      // Text(
                      //   '你当前排名490，距上一名还差12092490，距上一名还差12092490，距上一名还差12092490，距上一名还差12092',
                      //   style: TextStyle(color: Color(0xFFBC6C26), fontSize: 13.0),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.bottom,
          )
        ]
      ],
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
          _dataSource.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _dataSource.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _dataSource.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(GsBirthdayListItem item, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 20.0),
      child: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _renderIndex(item),
            CommonAvatar(
              path: item.icon,
              size: 40,
              shape: BoxShape.circle,
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid);
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${item.extra.gift.wish}',
              style: const TextStyle(
                  color: Color(0xFFFF5F7D),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderIndex(GsBirthdayListItem item) {
    int rank = item.index;
    if (rank > 0 && rank <= 3) {
      return Container(
        alignment: Alignment.center,
        width: 54.0,
        child: R.img(
          'rank/rank_big_$rank.png',
          width: 26.0,
          height: 24.0,
          package: ComponentManager.MANAGER_RANK,
        ),
      );
    } else {
      return Container(
        alignment: AlignmentDirectional.center,
        width: 54.0,
        child: Text(
          rank > 0 ? '$rank' : '-',
          style: const TextStyle(
              color: Color(0xFFBC6C26),
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
      );
    }
  }
}
