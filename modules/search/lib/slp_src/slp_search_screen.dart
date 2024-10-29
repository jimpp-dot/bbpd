import 'dart:async';

import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:search/searchManager.dart';
import 'package:search/src/model/pb/generated/pretty_user.pb.dart';
import 'package:search/src/model/search_category_controller.dart';
import 'package:search/src/search_bar.dart';
import 'package:search/src/search_category_widget.dart';
import 'package:shared/shared.dart';

import '../k.dart';
import 'slp_search_egg_widget.dart';
import 'slp_search_repo.dart';
import 'slp_search_result_KOL_item.dart';
import 'slp_search_single_type_list.dart';

/// 搜索页
class SlpSearchScreen extends StatefulWidget {
  static const routeName = '/Search';

  const SlpSearchScreen({super.key});

  static Future showSearchScreen(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SlpSearchScreen(),
        settings: const RouteSettings(name: SlpSearchScreen.routeName),
      ),
    );
  }

  @override
  _SlpSearchScreenState createState() => _SlpSearchScreenState();
}

class _SlpSearchScreenState extends State<SlpSearchScreen> with TickerProviderStateMixin {
  bool isLoading = false;

  bool isSearchContentEmpty = true;

  bool hideKOLCountdown = false;

  String? _kolKeywords;
  String _searchString = '';

  // 搜索结果
  List<JointSearchItem> resultsGiftBox = []; // 礼包
  List<JointSearchItem> results = []; // 房间
  List<JointSearchItem> resultsUser = []; // 用户
  List<JointSearchItem> resultsGroup = []; // 群组
  List<JointSearchItem> resultsKOLRoom = []; //KOL房间
  List<JointSearchItem> resultsBanner = []; //banner
  List<PrettyInfo> prettyUsers = []; // 带扩展信息的靓号用户

  Map<String, dynamic> boxStatus = {}; //礼包领取状态

  Timer? _cancelTimer;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
    eventCenter.addListener(EventConstant.EventTopLiveClick, _onTopLiveClick);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    eventCenter.removeListener(EventConstant.EventTopLiveClick, _onTopLiveClick);

    _cancelTimer?.cancel();
    Get.delete<SearchCategoryController>();
    super.dispose();
  }

  _onUserFollow(String type, dynamic value) {
    if (SlpSearchScreen.routeName != appNavigatorObserver.getLast()) {
      if (value is Map && value.containsKey('follow') && value.containsKey('uid')) {
        bool follow = value['follow'];
        String uid = value['uid'];
        for (JointSearchItem item in resultsUser) {
          if (item.id.toString() == uid) {
            if (mounted) {
              if (follow) {
                _loadOnline([uid]);
              } else {
                _config.remove(Util.parseInt(uid));
              }
              setState(() {
                item.user.follow = follow ? JointSearchFollowType.FollowTypeFollow : JointSearchFollowType.FollowTypeNotFollow;
              });
            }
            break;
          }
        }
      }
    }
  }

  void _onTopLiveClick(String type, dynamic value) {
    // 跳转页面收起键盘，防止在其他页误显示键盘
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Container(
        color: R.colors.mainBgColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SearchBar(_onQueryChanged, suppDark: true),
              isLoading
                  ? const Padding(
                      padding: EdgeInsetsDirectional.only(top: 26.0),
                      child: Loading(),
                    )
                  : Expanded(
                      child: Listener(
                        behavior: HitTestBehavior.opaque,
                        onPointerDown: (event) => FocusScope.of(context).requestFocus(FocusNode()),
                        child: _buildSearchResult(context),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResult(BuildContext context) {
    if (isSearchContentEmpty) {
      return const SearchCategoryWidget();
    } else {
      return totalResult == 0 ? const SizedBox.expand() : _buildList();
    }
  }

  Widget _buildList() {
    List<Widget> widgets = [];
    int startIndex = 0;
    bool isKOLSearch = false;

    if (resultsBanner.isNotEmpty) {
      JointSearchKolBannerItem banner = resultsBanner.first.kolBanner;
      isKOLSearch = true;
      _kolKeywords = banner.keyword;

      if (!hideKOLCountdown && banner.second > 0) {
        //KOL自动进房倒计时横幅
        widgets.add(BbSearchKOLCountdownItem(banner.second, banner.jumpTips, () {
          setState(() {
            hideKOLCountdown = true;
          });
        }, () {
          if (mounted && (ModalRoute.of(context)?.isCurrent ?? false)) {
            gotoKOLRoom(banner.rid);
          }
        }));
      }

      //KOL banner
      widgets.add(SlpSearchKOLBannerItem(resultsBanner.first, _onTapItem));

      //KOL 房间
      if (resultsKOLRoom.isNotEmpty) {
        widgets.add(BbSearchKOLRecommendRoomItem(resultsKOLRoom, _searchString, _onTapItem));

        startIndex += resultsKOLRoom.length;
      }

      //KOL 推荐用户
      if (resultsUser.isNotEmpty) {
        widgets.add(_buildDeliver());

        widgets.add(SlpSearchSingleTypeList(
            startIndex: startIndex,
            typeName: K.search_user,
            datas: resultsUser,
            onGoRoom: _onGoRoom,
            onFollow: _onFollow,
            onTapItem: _onTapItem,
            reportItemExpose: _reportItemExpose,
            getRidByUid: getRidByUid));

        startIndex += resultsUser.length;
      }
    }

    if (resultsGiftBox.isNotEmpty) {
      widgets.add(SlpSearchSingleTypeList(
        startIndex: startIndex,
        typeName: K.search_giftbox,
        datas: resultsGiftBox,
        onTapItem: _onTapItem,
        reportItemExpose: _reportItemExpose,
        getRidByUid: getRidByUid,
        boxStatus: boxStatus,
      ));

      startIndex += resultsGiftBox.length;
    }

    if (results.isNotEmpty) {
      if (widgets.isNotEmpty) {
        widgets.add(_buildDeliver());
      }
      widgets.add(SlpSearchSingleTypeList(
          startIndex: startIndex,
          typeName: K.search_room,
          datas: results,
          onGoRoom: _onGoRoom,
          onTapItem: _onTapItem,
          reportItemExpose: _reportItemExpose,
          getRidByUid: getRidByUid));
      startIndex += results.length;
    }

    if (resultsUser.isNotEmpty && !isKOLSearch) {
      //KOL的推荐用户已经在上面的逻辑中加入了
      if (widgets.isNotEmpty) {
        widgets.add(_buildDeliver());
      }
      widgets.add(SlpSearchSingleTypeList(
          startIndex: startIndex,
          typeName: K.search_user,
          datas: resultsUser,
          onGoRoom: _onGoRoom,
          onFollow: _onFollow,
          onTapItem: _onTapItem,
          reportItemExpose: _reportItemExpose,
          getRidByUid: getRidByUid));
      startIndex += resultsUser.length;
    }

    if (resultsGroup.isNotEmpty) {
      if (widgets.isNotEmpty) {
        widgets.add(_buildDeliver());
      }
      widgets.add(SlpSearchSingleTypeList(
          startIndex: startIndex,
          typeName: K.search_group,
          datas: resultsGroup,
          onGoRoom: _onGoRoom,
          onTapItem: _onTapItem,
          reportItemExpose: _reportItemExpose,
          getRidByUid: getRidByUid));
      startIndex += resultsGroup.length;
    }

    return CustomScrollView(
      slivers: [...widgets],
    );
  }

  Widget _buildDeliver() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: Util.width,
        height: 10,
      ),
    );
  }

  final Set<int> _exposureStatistics = <int>{};

  void _reportItemExpose({required int index, int uid = 0, int rid = 0}) async {
    if (_exposureStatistics.contains(index)) return;

    _exposureStatistics.add(index);
    Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
      'keywords': _searchString,
      'rid': rid,
      'to_uid': uid,
      'position': '$index',
    });
  }

  void _onQueryChanged(String text) {
    setState(() {
      isLoading = true;
      isSearchContentEmpty = false;
      _searchString = text;
    });
    _cancelTimer?.cancel();
    _cancelTimer = Timer(Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  void clearResult() {
    _kolKeywords = null;
    hideKOLCountdown = false;
    resultsGiftBox.clear();
    results.clear();
    resultsUser.clear();
    resultsGroup.clear();
    resultsKOLRoom.clear();
    resultsBanner.clear();
    prettyUsers.clear();
  }

  int get totalResult {
    return resultsGiftBox.length + results.length + resultsUser.length + resultsGroup.length + resultsKOLRoom.length + resultsBanner.length;
  }

  void _search(String query) async {
    _kolKeywords = null;
    hideKOLCountdown = false;

    if (query.isEmpty) {
      setState(() {
        isLoading = false;
        isSearchContentEmpty = true;
        clearResult();
        _exposureStatistics.clear();
      });
      return;
    }

    /// 搜索视频彩蛋
    List<JointSearchItem> videoEggs = [];

    JointSearchResp response = await SlpSearchRepo.searchUser(query.trim());

    if (response.success && response.data.isNotEmpty) {
      clearResult();
      List<String> uids = [];
      for (var item in response.data) {
        if (item.type == JointSearchItemType.ItemTypeUser) {
          resultsUser.add(item);
          if (item.user.follow != JointSearchFollowType.FollowTypeNotFollow) {
            //已关注
            uids.add(item.id.toString());
          }
        } else if (item.type == JointSearchItemType.ItemTypeRoom) {
          results.add(item);
        } else if (item.type == JointSearchItemType.ItemTypeGroup) {
          resultsGroup.add(item);
        } else if (item.type == JointSearchItemType.ItemTypeBag) {
          resultsGiftBox.add(item);
        } else if (item.type == JointSearchItemType.ItemTypeEgg) {
          videoEggs.add(item);
        } else if (item.type == JointSearchItemType.ItemTypeKolRoom) {
          resultsKOLRoom.add(item);
        } else if (item.type == JointSearchItemType.ItemTypeKolBanner) {
          resultsBanner.add(item);
        }
      }

      /// 记录用户第一次搜索
      if (response.data.isNotEmpty) {
        JointSearchItem firstItem = response.data[0];
        String prettyId = ''; // 靓号ID
        if (firstItem.type == JointSearchItemType.ItemTypeUser) {
          prettyId = firstItem.user.prettyId;
        } else if (firstItem.type == JointSearchItemType.ItemTypeRoom) {
          prettyId == firstItem.room.prettyId;
        }
        Tracker.instance.user_setOnce({
          'first_search_key': query,
          'first_search_result_type': firstItem.type.name,
          'first_search_result_pretty_id': prettyId,
        });
      }

      //如果搜索结果有已关注的,取已关注的用户的房间状态
      await _loadOnline(uids);
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
      isSearchContentEmpty = false;
      _exposureStatistics.clear();
    });

    if (totalResult == 0 && videoEggs.isEmpty) {
      Tracker.instance.track(TrackEvent.search_not_result, properties: {
        'keywords': _searchString,
      });
    }

    if (videoEggs.isNotEmpty) {
      JointSearchItem item = videoEggs[0];

      if (item.egg.subType == 'h5') {
        if (!Util.isStringEmpty(item.egg.jumpUrl)) {
          if (item.egg.jumpUrl.startsWith("http://") || item.egg.jumpUrl.startsWith("https://")) {
            //如果是h5
            Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
              'keywords': _searchString,
              'search_type': 'Easter_egg_h5',
              'exposure_type': 'h5',
              'link': item.egg.jumpUrl,
            });
            BaseWebviewScreen.show(context, url: item.egg.jumpUrl);
          } else {
            //否则是schema
            Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
              'keywords': _searchString,
              'search_type': 'Easter_egg_h5',
              'exposure_type': 'h5',
              'link': item.egg.jumpUrl,
            });
            SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, item.egg.jumpUrl);
          }
        }
      } else if (item.egg.subType == 'egg') {
        SlpSearchEggWidget.show(context, item);
      }
    }
  }

  void _onTapItem(int position, JointSearchItem item) async {
    if (item.type == JointSearchItemType.ItemTypeUser) {
      IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
      personalDataManager.openImageScreen(context, Util.parseInt(item.id),
          refer: const PageRefer('SearchScreen'), searchContent: _searchString);
    } else if (item.type == JointSearchItemType.ItemTypeKolRoom) {
      RoomListItem roomItem = item.kolRoom;
      gotoKOLRoom(roomItem.rid, customSearchString: _kolKeywords);
    } else if (item.type == JointSearchItemType.ItemTypeKolBanner) {
      JointSearchKolBannerItem bannerItem = item.kolBanner;
      gotoKOLRoom(bannerItem.rid, customSearchString: _kolKeywords);
    }
    // 跳转页面收起键盘，防止在其他页误显示键盘
    FocusScope.of(context).requestFocus(FocusNode());

    Tracker.instance.track(TrackEvent.search_result_click, properties: {
      'keywords': _searchString,
      'rid': '0',
      'to_uid': '${Util.parseInt(item.id)}',
      'position': '$position',
    });
  }

  void gotoKOLRoom(int rid, {String? customSearchString}) {
    IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    manager.openChatRoomScreenShow(context, rid, searchString: customSearchString ?? _searchString, refer: 'kol');
  }

  /// 目前只有type为ItemTypeUser时才有关注
  void _onFollow(JointSearchItem item) async {
    if (!Session.isLogined) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    NormalNull response = await BaseRequestManager.onFollow(Util.notNullStr(item.id), searchContent: _searchString);
    if (response.success) {
      Fluttertoast.showToast(msg: K.search_followed);
      //如果搜索结果有已关注的,取已关注的用户的房间状态
      await _loadOnline([Util.parseStr(item.id) ?? '']);
      if (mounted && item.type == JointSearchItemType.ItemTypeUser) {
        setState(() {
          item.user.follow = JointSearchFollowType.FollowTypeFollow;
        });
      }
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onGoRoom({required int position, required int rid, required int uid, String? refer}) async {
    if (!Session.isLogined) {
      SearchManager.showLogin(context);
      return;
    }
    SearchManager.showRoom(context, rid, _searchString, refer: refer);
    // 跳转页面收起键盘，防止在其他页误显示键盘
    FocusScope.of(context).requestFocus(FocusNode());

    Tracker.instance.track(TrackEvent.search_result_click, properties: {
      'keywords': _searchString,
      'rid': '0',
      'to_uid': '$uid',
      'position': '$position',
    });
  }

  void _onJoinSingerClub(JointSearchItem item, int inClub) {
    if (mounted) {
      setState(() {
        item.singer.inClub = inClub;
      });
    }
  }

  int getRidByUid(int uid) {
    int rid = 0;
    if (_config.containsKey(uid)) {
      UserConfig? config = _config[uid];
      if (config != null && (config.room ?? 0) > 0) {
        rid = config.room!;
      }
    }
    return rid;
  }

  final Map<int, UserConfig> _config = {}; //列表中用户状态信息
  ///根据uid列表查询对应的userconfig列表
  _loadOnline(List<String> uids) async {
    _config.clear();
    if (uids.isNotEmpty) {
      try {
        await BaseRequestManager.cloudAll(uids, roomConfig: _config);

        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        Log.d(e);
      }
    }
  }
}
