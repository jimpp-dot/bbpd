import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

const PROFILE_VIP_MALL_KEY = 'profile_vip_mall_key';
const PROFILE_MOMENT_NEW_USER_RED_POINT_KEY = 'profile_moment_new_user_red_point_key';

class ProfilePayload extends ChangeNotifier {
  // 社交关系数量
  int _follows = 0, _fans = 0, _friends = 0, _groups = 0, _fansIncre = 0, _visitorNew = 0, _visitorTime = 0, _visitorTotal = 0;
  int _accompany = 0;
  String? _firstBannerId, _activityTitle; // 活动

  int _popularityLevel = 0;
  int _popularity = 0;
  String? _popularityLink;

  // 背包红点
  bool _showBagRedPoint = false;

  // 商城红点
  bool _showVipMallRedPoint = false;

  // 人气等级红点
  bool _showPopularityRedPoint = false;

  // VIP等级红点
  bool _showVipRedPoint = false;

  // 活跃等级红点
  bool _showActivityLevelRedPoint = false;

  // 自动搭讪红点
  bool _showAutoAccostRedPoint = false;

  int _momentMsgNum = 0; // 互动消息未读数量（已无作用废弃）
  bool _showFollowRedPoint = false;
  bool _showSmallMoodRedPoint = false;
  bool _momentNewUser = false;
  Timer? _momentRedPointTimer;
  String? _momentRecentIconUrl;
  Timer? _momentUnReadMsgTimer;
  int _contactsNew = 0; //通讯录新增好友

  static bool profileTabShowVisitor = false; // 个人tab是否显示访客

  int get follows => _follows;

  int get fans => _fans;

  int get friends => _friends;

  int get groups => _groups;

  int get fansIncre => _fansIncre;

  int get visitorNew => _visitorNew;

  int get visitorTotal => _visitorTotal;

  int get visitorTime => _visitorTime;

  int get accompany => _accompany;

  int get popularity => _popularity;

  int get popularityLevel => _popularityLevel;

  String get popularityLink => _popularityLink ?? '';

  // 获取活动标题
  String get activityTitle => _activityTitle ?? '';

  int get momentMsgNum => _momentMsgNum;

  int get contactsNew => _contactsNew;

  // 有未领取的任务、有新粉丝、有新活动时我的tab增加红点
  bool get showProfileTabRedPoint => Session.isLogined
      ? (_fansIncre > 0 ||
          (profileTabShowVisitor && _visitorNew > 0) ||
          showActivityPoint() ||
          showFunctionCenterRedPoint ||
          // showTaskCenterRedPoint ||
          showVipMalRedPoint ||
          showPopularityRedPoint ||
          showAutoAccostRedPoint ||
          showVipRedPoint ||
          showActivityLevelRedPoint)
      : showActivityPoint();

  /// 是否展示动态关注红点
  bool get showFollowRedPoint => _showFollowRedPoint;

  /// 是否展示底部动态Tab红点
  bool get showDynamicRedPoint => _showFollowRedPoint || _showSmallMoodRedPoint;

  bool get showMomentNewUser => _momentNewUser;

  bool get showBagRedPoint => _showBagRedPoint;

  bool get showVipMalRedPoint => _showVipMallRedPoint;

  bool get showPopularityRedPoint => _showPopularityRedPoint;

  bool get showVipRedPoint => _showVipRedPoint;

  bool get showActivityLevelRedPoint => _showActivityLevelRedPoint;

  bool get showFunctionCenterRedPoint => _functionCenterHasRedDot;

  bool get showAutoAccostRedPoint {
    return BaseConfig.instance.autoAccost && _showAutoAccostRedPoint;
  }

  /// 任务中心红点
  bool get showTaskCenterRedPoint => _taskCenterShowRedDot;

  String get momentRecentIconUrl => _momentRecentIconUrl ?? '';

  ProfilePayload() {
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  /// 首页展示后，刷新下数据
  void firstLoad() {
    reload();
    loadMomentsInfo();
    loadPopularityRedPoint();
    loadVipRedPoint();
    loadAcitvityLevelRedPoint();
    functionCenterHasRedDot();
    taskCenterShowRedDot();
    loadMomentsSmallMood(loadApi: true);

    _momentRedPointTimer = Timer.periodic(const Duration(seconds: 60), (timer) => loadMomentsInfo());
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    _momentRedPointTimer?.cancel();
    _momentUnReadMsgTimer?.cancel();
    super.dispose();
  }

  void _onLogin(String type, dynamic data) {
    reload();
    loadMomentsInfo();
    loadPopularityRedPoint();
    loadVipRedPoint();
    loadAcitvityLevelRedPoint();
    functionCenterHasRedDot();
    taskCenterShowRedDot();
    loadMomentsSmallMood(loadApi: true);
  }

  reload() {
    if (!Session.isLogined) return;
    loadFirstBanner();
    loadRelationNum();
    loadBagRedPoint();
  }

  reset() {
    _follows = _fans = _friends = _groups = _fansIncre = _visitorNew = _visitorTotal = _visitorTime = _accompany = 0;
    _popularity = 0;
    _popularityLevel = 0;
    _follows = _fans = _friends = _groups = _fansIncre = _visitorNew = _visitorTotal = _visitorTime = 0;
    _showFollowRedPoint = false;
    _showSmallMoodRedPoint = false;
    _momentMsgNum = 0;
    _contactsNew = 0;
    notifyListeners();
  }

  resetFansIncre() {
    _fansIncre = 0;
    notifyListeners();
  }

  resetMomentFollow() {
    _showFollowRedPoint = false;
    notifyListeners();
  }

  resetMomentNewUser() {
    _momentNewUser = false;
    Config.setBool('${Session.uid}_$PROFILE_MOMENT_NEW_USER_RED_POINT_KEY', false);
    notifyListeners();
  }

  resetMomentSmallMood() {
    _showSmallMoodRedPoint = false;
    notifyListeners();
  }

  resetMomentMessage({int num = 0}) {
    if (_momentMsgNum != num) {
      _momentMsgNum = num;
      notifyListeners();
    }
  }

  void resetBagRedPoint() {
    if (_showBagRedPoint) {
      _showBagRedPoint = false;
      notifyListeners();
    }
  }

  void resetVipMallRedPoint() {
    _showVipMallRedPoint = false;
    Config.setBool('${Session.uid}_$PROFILE_VIP_MALL_KEY', false);
    notifyListeners();
  }

  void setAutoAccostRedPoint(bool show) {
    if (_showAutoAccostRedPoint != show) {
      _showAutoAccostRedPoint = show;
      notifyListeners();
    }
  }

  /// 关系数量
  loadRelationNum() async {
    if (!Session.isLogined) return;

    ResFriendsNum resp = await RelationshipApi.getFriendsNum();
    if (resp.success) {
      _follows = resp.hasFollow() ? resp.follow : 0;
      _fans = resp.hasFans() ? resp.fans : 0;
      _friends = resp.hasFriends() ? resp.friends : 0;
      _groups = resp.hasGroup() ? resp.group : 0;
      _fansIncre = resp.hasFansIncre() ? resp.fansIncre : 0;
      _accompany = resp.hasAccompanyNum() ? resp.accompanyNum : 0;
      _contactsNew = resp.hasContactsNew() ? resp.contactsNew : 0;

      if (resp.hasVisitor()) {
        _visitorNew = resp.visitor.hasNew_1() ? resp.visitor.new_1 : 0;
        _visitorTime = resp.visitor.hasTime() ? resp.visitor.time : 0;
        _visitorTotal = resp.visitor.hasTotal() ? resp.visitor.total : 0;
      }

      if (resp.hasPopularity()) {
        _popularityLevel = resp.popularity.hasLevel() ? resp.popularity.level : 0;
        _popularity = resp.popularity.hasPopularity() ? resp.popularity.popularity : 0;
        _popularityLink = resp.popularity.hasLink() ? resp.popularity.link : '';
      }

      notifyListeners();
    }
  }

  /// 活动相关
  loadFirstBanner() async {
    String url = '${System.domain}go/yy/profile/banner';
    try {
      XhrResponse response = await Xhr.post(url, {}, pb: true);
      HomeProfileBannerResp res = HomeProfileBannerResp.fromBuffer(response.bodyBytes);
      if (res.success && res.hasData()) {
        _firstBannerId = res.data.firstBannerId;
        _activityTitle = res.data.title;
        notifyListeners();
      } else {
        Log.d(res.msg);
      }
    } catch (e) {
      return HomeProfileBannerResp(msg: e.toString(), success: false);
    }
  }

  /// 是否展示活动红点
  bool showActivityPoint() {
    if (Util.isVerify || _firstBannerId == null || _firstBannerId!.isEmpty || _firstBannerId == '0') return false;

    // 未点击第一条banner需要显示小红点
    return (!(Config.get(BannerScreen.keyBannerTap, '').contains(_firstBannerId!)));
  }

  void hideActivityPoint() {
    String hasTapIDs = Config.get(BannerScreen.keyBannerTap, '');
    if (!hasTapIDs.contains('$_firstBannerId')) {
      Config.set(BannerScreen.keyBannerTap, '$hasTapIDs$_firstBannerId,');
    }
  }

  /// 加载朋友圈状态红点（是否有人发布动态）
  void loadMomentsInfo() async {
    if (!Session.isLogined) return;

    // 最近一个动态发表人的icon
    bool showFollowRedPoint = await BaseRequestManager.hasRecentTopic();
    bool momentNewUser = false;
    if (!showFollowRedPoint) {
      //没有动态红点,确认下是否新用户
      momentNewUser = Config.getBool('${Session.uid}_$PROFILE_MOMENT_NEW_USER_RED_POINT_KEY', true);
      Log.d("MessageRedDot _momentNewUser=$_momentNewUser");
    }
    if (showFollowRedPoint != _showFollowRedPoint || momentNewUser != _momentNewUser) {
      _showFollowRedPoint = showFollowRedPoint;
      _momentNewUser = momentNewUser;
      if (showFollowRedPoint) {
        //有新动态
      } else {
        _momentRecentIconUrl = null;
      }
      notifyListeners();
    }
  }

  /// 加载动态热门页面的小心情，看是否动态tab需要展示小红点
  void loadMomentsSmallMood({bool loadApi = false, bool show = false}) async {
    if (!Session.isLogined) return;
    if (loadApi) {
      try {
        IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        bool showSmallMood = await manager.showSmallMoodEntryRedPoint();
        if (_showSmallMoodRedPoint != showSmallMood) {
          _showSmallMoodRedPoint = showSmallMood;
          notifyListeners();
        }
      } catch (e) {
        Log.d(e.toString());
      }
    } else {
      if (_showSmallMoodRedPoint != show) {
        _showSmallMoodRedPoint = show;
        notifyListeners();
      }
    }
  }

  /// 背包红点
  void loadBagRedPoint() async {
    bool show = await BaseRequestManager.hasBagRedPoint();
    if (_showBagRedPoint != show) {
      _showBagRedPoint = show;
      notifyListeners();
    }
  }

  void loadPopularityRedPoint() {
    if (!Session.isLogined) return;
    bool oldState = _showPopularityRedPoint;
    _showPopularityRedPoint = Session.showPopularityRedPoint;
    if (oldState != _showPopularityRedPoint) {
      notifyListeners();
    }
  }

  void loadVipRedPoint() {
    if (!Session.isLogined) return;
    bool oldState = _showVipRedPoint;
    _showVipRedPoint = Session.showVipRedPoint;
    if (oldState != _showVipRedPoint) {
      notifyListeners();
    }
  }

  void loadAcitvityLevelRedPoint() {
    if (!Session.isLogined) return;
    bool oldState = _showActivityLevelRedPoint;
    _showActivityLevelRedPoint = Session.showActivityLevelRedPoint;
    if (oldState != _showActivityLevelRedPoint) {
      notifyListeners();
    }
  }

  bool _functionCenterHasRedDot = false;

  bool functionCenterHasRedDot() {
    bool oldState = _functionCenterHasRedDot;
    IProfileManager profileManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
    _functionCenterHasRedDot = profileManager.functionCenterShowRedDot();
    if (oldState != _functionCenterHasRedDot) {
      notifyListeners();
    }
    return _functionCenterHasRedDot;
  }

  bool _taskCenterShowRedDot = false;

  /// 任务中心是否展示红点
  bool taskCenterShowRedDot() {
    bool oldState = _taskCenterShowRedDot;
    IProfileManager profileManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
    _taskCenterShowRedDot = profileManager.taskCenterShowRedDot();
    if (oldState != _taskCenterShowRedDot) {
      notifyListeners();
    }
    return _taskCenterShowRedDot;
  }
}
