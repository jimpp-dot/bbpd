import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/src/page/webview_activity_half_screen.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'scheme/scheme_jump_map.dart';

class SchemeUrlHelper {
  SchemeUrlHelper._();

  /// 开屏广告
  static const scheme_path_open_screen_ad = 'open_screen_ad';

  /// App首页banner
  static const scheme_path_homepage_banner = 'homepage_banner';

  /// socket跳转
  static const scheme_path_online_socket = 'online_socket';

  /// 每日任务跳转
  static const scheme_path_task_url = 'task_url';

  /// 新转弹窗
  static const scheme_path_trans_invite = 'trans_invite';

  /// 通用跳转
  static const scheme_path_common_redirect = 'common_redirect';

  static const Set<String> _paths = {
    '/conversationlist',
    '/message',
    '/browser',
    '/jiguang',
    '/pushonline',
    '/iMobile',
    '/$scheme_path_online_socket',
    '/$scheme_path_open_screen_ad',
    '/$scheme_path_homepage_banner',
    '/$scheme_path_task_url',
    '/$scheme_path_trans_invite',
    '/$scheme_path_common_redirect',
  };

  static SchemeUrlHelper? _instance;

  static SchemeUrlHelper instance() {
    _instance ??= SchemeUrlHelper._();
    return _instance!;
  }

  static List<String> supportSchemes = [
    'bbpd',
    'banban',
    'peini',
    'zcp',
    'zhizhi',
    'bbxq',
    'who',
    'naitang',
    'duck',
    'teammate',
    'wolf',
    'wanpi',
    'qrql',
    'uniteam'
  ]; //android主包及渠道包以及ios支持的所有schemeUrl前缀(取值url_scheme)

  static String supportPushScheme = 'rong'; // 融云推送scheme

  // md5 加密
  String generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  bool _isSchemeSupport(String? url) {
    bool check = false;
    for (var ss in supportSchemes) {
      if (url != null && url.startsWith(ss)) {
        check = true;
      }
    }

    if (url != null && url.startsWith(supportPushScheme)) {
      check = true;
    }

    return check;
  }

  String concatSchemeUrl(String? url, String path) {
    if (url != null && url.startsWith('bbpd://')) {
      return url;
    }
    if (url != null && !url.startsWith('page=')) {
      url = 'page=$url';
    }
    return 'bbpd://com.ly.bbpd.android/$path?$url';
  }

  String concatSchemeUrlByH5(String webUrl, {String? title}) {
    String url = 'page=webview&url=${Uri.encodeComponent(webUrl)}';
    if (Util.validStr(title)) {
      url = '$url&title=$title';
    }
    return concatSchemeUrl(url, scheme_path_common_redirect);
  }

  ///check是否schemeUrl并返回对应的页面page路径
  /*需返回pageUrl用来判断是否成功跳转*/
  String checkSchemeUrlAndGo(BuildContext context, dynamic value,
      {String fromPage = ''}) {
    String pageUrl = '';
    String? url = value;
    Log.d('url:${url}');
    if (url != null && _isSchemeSupport(url)) {
      //支持的scheme开头
      Uri uri = Uri.parse(url);
      String path = uri.path;
      Map<String, String> qps = uri.queryParameters;
      Log.d('qps:${qps}');
      if (path == '/image') {
        // 个人资料页
        if (qps.isNotEmpty &&
            qps.containsKey('sign') &&
            qps.containsKey('uid')) {
          //至少包含sing和uid
          if (checkSign(qps)) {
            //比对加密串
            pageUrl = "/image/${qps['uid']}";

            int uid = Util.parseInt(qps['uid']);
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, uid);
          }
        }
      } else if (path == '/webview') {
        // H5
        if (qps.isNotEmpty &&
            qps.containsKey('sign') &&
            qps.containsKey('url')) {
          // 需要包含sign和url
          if (checkSign(qps)) {
            //比对加密串
            pageUrl = "/webview/${qps['url']}";
            String url = Uri.decodeComponent(qps['url'] ?? '');

            Uri webUri = Uri.parse(url);
            Map<String, String> webQuerys = webUri.queryParameters;
            bool half = false; // 是否半屏WebView
            if (webQuerys.containsKey('halfScreen')) {
              half = Util.parseBool(webQuerys['halfScreen']);
            }
            if (half) {
              // 半屏WebView
              double ratio = Util.parseDouble(webQuerys['ratio']);
              Color? bgColor = Util.parseColor(webQuerys['bgColor']);
              WebviewActivityHalfScreen.show(context, url,
                  ratio: ratio, bgColor: bgColor);
              Tracker.instance.track(TrackEvent.open_half_webview_in_app,
                  properties: {'target_url': url});
            } else {
              // 全屏WebView
              BaseWebviewScreen.show(context, url: url, title: qps['title']);
              Tracker.instance.track(TrackEvent.open_webview_in_app,
                  properties: {'target_url': url});
            }
          }
        }
      } else if (path == '/TopicDetailScreen') {
        //动态-话题聚合页
        IMomentManager momentManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_MOMENT);
        if (qps.isNotEmpty) {
          int id = Util.parseInt(qps['topicId']);
          String? topicName = qps['topicName'] ?? '';
          momentManager.openTopicDetailScreen(System.context,
              tagId: id, tagName: topicName);
        }
      } else if (path == '/dress_center') {
        // 装扮中心
        IVipManager vipManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.openDressCenter(context,
            initCateId: Util.parseInt(qps['cate_id']),
            initDressId: Util.parseInt(qps['dress_id']));
      } else if (_paths.contains(path)) {
        // 推送及短信（H5）调用
        if (!Session.isLogined) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          loginManager.show(context);
          return pageUrl;
        }

        if (qps.isNotEmpty && qps.containsKey('page')) {
          String? page = Util.parseStr(qps['page']);
          pageUrl = "/$page";

          // 只有离线PUSH和极光拉活本地通知过来的点击事件才做数据上报（数数）
          if (path == '/conversationlist' ||
              path == '/jiguang' ||
              path == '/pushonline' ||
              path == '/$scheme_path_online_socket') {
            Tracker.instance.track(TrackEvent.push_click, properties: {
              'push_channel': Platform.operatingSystem,
              'push_type': qps['push_type'],
              'content_id': qps['content_id'],
              'push_type_id': qps['push_type_id'],
              'is_online_socket': path == '/online_socket' ? 1 : 0,
              'target_uid': Util.parseInt(qps['target_uid']),
            });
          }

          if (SchemeJumpMap.jumpSchemes.containsKey(page)) {
            return SchemeJumpMap.jumpSchemes[page]!.jumpToPage(context, qps);
          }


          switch (page) {
            case 'home':
              // 首页 此处需要app自己实现,一般为在boot中先保证当前最上层页面在boot,然后在boot中切换tab
              Navigator.popUntil(context, ModalRoute.withName('/'));
              if (qps.containsKey('tab')) {
                pageUrl = '$pageUrl/${qps['tab']}';
                if ('home' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToHomePage');
                  if (qps['header'] != null) {
                    // 跳转首页第一个TAB下的推荐TAB（顶部）
                    eventCenter.emit('HomePage.JumpToPushTab', qps['header']);
                  }
                } else if ('room' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToRoomPage');
                  if (qps['header'] != null) {
                    Constant.roomTabCurrentKey = qps['header'];
                    eventCenter.emit(
                        EventConstant.EventHomePageJumpToCurrentTab,
                        Constant.roomTabCurrentKey);
                  }
                  if (qps['filter'] != null) {
                    // 跳转到指定的tab的filter
                    eventCenter.emit(
                        EventConstant.EventHomePageJumpToCurrentTab,
                        qps['filter']);
                  }
                } else if ('message' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToMessagePage');
                } else if ('dynamic' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToMomentPage');
                } else if ('profile' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpProfilePage');
                } else if ('discovery' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToDiscoveryPage');
                } else if ('cloud_game' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToPartyPage');
                  eventCenter.emit('HomePage.cloud_game');
                } else if ('hot_feed' == qps['tab'] || 'music' == qps['tab']) {
                  //兼容旧版本协议
                  eventCenter.emit('HomePage.JumpToMusicPage', qps);
                } else if ('singer_club' == qps['tab']) {
                  eventCenter.emit('HomePage.JumpToSingerClubPage', qps);
                }
              }
              break;
            case 'private':
            case 'circle': //跳转到朋友圈，如果tab为topic，强制跳转到朋友圈的关注
              bool showAttention = false;
              if (qps.containsKey('tab')) {
                if ('topic' == qps['tab']) {
                  showAttention = true;
                }
              }
              eventCenter.emit('HomePage.JumpToCirclePage', showAttention);

              break;
            case 'contact':
              if (qps.containsKey('tab')) {
                if ('friend' == qps['tab']) {
                  IMessageManager manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_MESSAGE);
                  manager.openContactPage(context);
                }
              }
              break;
            case 'room':
              // 房间
              if (qps.containsKey('rid')) {
                pageUrl = '$pageUrl/${qps['rid']}';

                int rid = Util.parseInt(qps['rid']);
                String? pushType = Util.parseStr(qps['push_type']);
                String refer = qps['push_type_id'] ?? 'repost';
                int targetUid = Util.parseInt(qps['target_uid']);
                bool keepRoom =
                    Util.parseBool(qps['keep_room'], false); //如果当前在房间，是否保持不跳转
                bool showKeyboard = Util.parseBool(qps['show_keyboard'], false);
                if (pushType != null && pushType == 'channel_user') {
                  refer = pushType;
                }
                if (refer == 'live_extention') {
                  Tracker.instance.track(TrackEvent.live_iOS_activity_click,
                      properties: {'rid': rid});
                }

                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                if (roomManager.chatRoomDataExists() && keepRoom) {
                  //当前在房间，不跳转
                  pageUrl = '';
                } else {
                  roomManager.openChatRoomScreenShow(context, rid,
                      refer: refer,
                      targetUid: targetUid,
                      showKeyboardAfterLoaded: showKeyboard);
                }
              }
              break;
            case 'create_room':
              {
                String? type = Util.parseStr(qps['type']);
                bool keepRoom =
                    Util.parseBool(qps['keep_room'], false); //如果当前在房间，是否保持不跳转
                if (type == 'mine') {
                  IRoomManager roomManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_BASE_ROOM);
                  if (roomManager.chatRoomDataExists() && keepRoom) {
                    //当前在房间，不跳转
                    pageUrl = '';
                  } else {
                    roomManager.openPersonalRoomDisplayDirect(context, 0);
                  }
                }
              }
              break;
            case 'create_my_room':
              {
                bool keepRoom =
                    Util.parseBool(qps['keep_room'], false); //如果当前在房间，是否保持不跳转
                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                if (roomManager.chatRoomDataExists() && keepRoom) {
                  //当前在房间，不跳转
                  pageUrl = '';
                } else {
                  roomManager.openInitOperateDisplay(context,
                      refer: 'activity_level_mission');
                }
              }
              break;
            case 'image':
              // 个人资料页
              if (qps.containsKey('uid')) {
                int uid = Util.parseInt(qps['uid']);
                pageUrl = '$pageUrl/$uid';
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                if ('moment' == qps['tab']) {
                  /// 各App的个人页，跳转到个人页的动态
                  personalDataManager.openImageScreen(context, uid,
                      showMoment: true,
                      initialTab: ImageScreenTabType.moment,
                      initialTabName: 'rush_moment');
                } else {
                  personalDataManager.openImageScreen(context, uid);
                }
              }
              break;
            case 'messageList':
              IMomentManager momentManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_MOMENT);
              momentManager.openMomentImMsgListScreen(context);
              break;
            case 'visitor':
              IMessageManager messageManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_MESSAGE);
              messageManager.openVisitorPage(context, 0);
              break;
            case 'moment_detail':
              if (qps.containsKey('topicId') && qps.containsKey('topicUid')) {
                pageUrl = '$pageUrl/${qps['topicId']}/${qps['topicUid']}';
                IMomentManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                manager.openMomentDetailScreen(context,
                    parentPage: MomentFlowPage.WebView,
                    topicId: Util.parseInt(qps['topicId']),
                    topicUid: Util.parseInt(qps['topicUid']));
              }
              break;
            case 'moment_tag':
              if (qps.containsKey('tagId') && qps.containsKey('tagName')) {
                pageUrl = '$pageUrl/${qps['tagId']}/${qps['tagName']}';
                IMomentManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                manager.openTagListScreenScreen(context,
                    title: qps["tagName"]!, tagId: Util.parseInt(qps["tagId"]));
              }
              break;
            case 'moment_broadcast':
              IMomentManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_MOMENT);
              manager.openGlobalMomentListScreen(context);
              break;
            case 'webview':
              if (qps.containsKey('url')) {
                String url = Uri.decodeComponent(qps['url']!);
                pageUrl = '$pageUrl/$url';

                Uri webUri = Uri.parse(url);
                Map<String, String> webQuerys = webUri.queryParameters;
                bool half = false; // 是否半屏WebView
                if (webQuerys.containsKey('halfScreen')) {
                  half = Util.parseBool(webQuerys['halfScreen']);
                }

                if (half) {
                  // 半屏WebView
                  double ratio = Util.parseDouble(webQuerys['ratio']);
                  Color? bgColor = Util.parseColor(webQuerys['bgColor']);
                  WebviewActivityHalfScreen.show(context, url,
                      ratio: ratio, bgColor: bgColor);
                  Tracker.instance.track(TrackEvent.open_half_webview_in_app,
                      properties: {'target_url': url});
                } else {
                  // 全屏WebView
                  BaseWebviewScreen.show(context,
                      url: url, title: qps['title']);
                  Tracker.instance.track(TrackEvent.open_webview_in_app,
                      properties: {'target_url': url});
                }
              }
              break;

            case 'moment_topic_list':
              if (qps.containsKey('tag_id') && qps.containsKey('tag_name')) {
                //动态-话题聚合页
                IMomentManager momentManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                Map<String, String> params = uri.queryParameters;
                int id = Util.parseInt(params['tag_id']);
                String topicName = Util.notNullStr(params['tag_name']);
                momentManager.openTopicDetailScreen(System.context,
                    tagId: id, tagName: topicName);
              }
              break;
            case 'case_tag':
              //迷案的话题页
              if (qps.containsKey('tagId') &&
                  qps.containsKey('tagName') &&
                  qps.containsKey('icon')) {
                pageUrl =
                    '$pageUrl/${qps['tagId']}/${qps['tagName']}/${qps['icon']}';
                IMomentManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                manager.openCaseTagListScreenScreen(
                  context,
                  tagId: Util.parseInt(qps["tagId"]),
                  title: Util.notNullStr(qps["tagName"]),
                  icon: Util.notNullStr(qps["icon"]),
                );
              }
              break;
            case 'gotoAppStore':
              AppReviewDialog.doKillerAppReview();
              break;
            case 'myLevel':
              // 我的等级
              MyLevelTab defaultTab = MyLevelTab.Popularity;
              if (qps.containsKey('tab')) {
                if ('popularity' == qps['tab']) {
                  defaultTab = MyLevelTab.Popularity;
                } else if ('vip' == qps['tab']) {
                  defaultTab = MyLevelTab.Vip;
                } else if ('title' == qps['tab']) {
                  defaultTab = MyLevelTab.Title;
                }
              }
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.showMyLevelScreen(context, initialTab: defaultTab);
              break;
            case 'mall':
              // 商城：一级页或者二级页
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              if (qps.containsKey('title') && qps.containsKey('type')) {
                vipManager.showSecondPage(context, qps['type']!,
                    title: qps['title']);
              } else {
                vipManager.show(context);
              }
              break;
            case 'bag':
              // 背包
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.showBagPage(context, tabType: qps['type']);
              break;
            case 'shop_buy_panel':
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.openBuyPanel(
                  context, Util.parseInt(qps['cid']), qps['type'] ?? '');
              break;
            case 'collection_buy_panel':
              int bagId = Util.parseInt(qps['bagId']);
              if (bagId > 0) {
                IVipManager vipManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_VIP);
                vipManager.openCollectionPanel(context, bagId);
              }

              break;
            case 'dress_center': // 装扮中心
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.openDressCenter(context,
                  initCateId: Util.parseInt(qps['cate_id']),
                  initDressId: Util.parseInt(qps['dress_id']));
              break;
            case 'nobility_center': // 贵族中心
              int? defaultLevel;
              if (qps.containsKey('level')) {
                defaultLevel = Util.parseInt(qps['level'], 0);
              }
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.openNobilityCenterScreen(context,
                  defaultNobilityLevel: defaultLevel);
              break;
            case 'message':
              IMainManager mainManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_MAIN);
              mainManager.openMessageScreen(context);
              break;
            case 'room_list':
              IRankManager rankManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_RANK);
              rankManager.showRoomList(context);
              break;
            case 'super_gift_pack':
              IGiftManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_GIFT);
              manager.showSuperGiftPack(context);
              break;
            case 'gift_pack_center':
              IGiftManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_GIFT);
              manager.showRechargePackCenter(
                  context, Util.notNullStr(qps['type']));
              break;
            case 'recharge': //充值页
              bool goToDetail = false;
              if (qps.containsKey('goto')) {
                if ('detail' == Util.parseStr(qps['goto'])) {
                  goToDetail = true;
                }
              }
              String refer0 = 'task';
              if (qps.containsKey('refer')) {
                refer0 = Util.parseStr(qps['refer']) ?? '';
              }
              ISettingManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              manager.openRechargeScreen(context,
                  refer: refer0, goToDetail: goToDetail);
              break;
            case 'auth': //实名认证
              ISettingManager settingManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              settingManager.openIdAuth(context);
              break;
            case 'web_auth_login': //登录授权
              ISettingManager settingManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              settingManager.openWebAuthLogin(
                  context, Util.notNullStr(qps['url']));
              break;
            case 'recommend_top': //充值推荐置顶
              ISettingManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              manager.openRecommendTopDialog(context);
              break;
            case 'homeRecommend': // 跳转首页推荐玩友
              eventCenter.emit('HomePage.JumpToHomePage');
              break;
            case 'preMadeMatch': //征兆匹配
              if (qps.containsKey('type')) {
                IPremadeManager pManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PREMADE);
                pManager.openPremadeGameScreen(Constant.context,
                    type: qps['type'] ?? '');
              }
              break;
            case 'syswebview': //系统浏览器
              if (qps.containsKey('url')) {
                String url = Uri.decodeComponent(qps['url']!);
                pageUrl = '$pageUrl/$url';
                Log.d("syswebview url=$url");
                launch(url, forceSafariVC: false);
              }
              break;
            case 'account_setting': // 账号与安全页
              ISettingManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              manager.openAccountSettingScreen(context);
              break;
            case 'image_modify': // 修改个人资料页
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              manager.openImageModifyScreen(context);
              break;
            case 'statement': // 账目明细
              ISettingManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              manager.openStatementScreen(context);
              break;
            case 'phone_friend': // 手机通讯录页
              IMessageManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_MESSAGE);
              manager.openPhoneFriendPage(context);
              break;
            case 'chat': // targetId用户id,或者群id, type: private 私聊， group：群聊
              if (qps.containsKey('targetId') && qps.containsKey('type')) {
                String? pushType = Util.parseStr(qps['push_type']);
                int targetId = Util.parseInt(qps['targetId']);
                if (pushType != null && pushType == 'channel_user') {
                  targetId = Util.parseInt(qps['target_uid']);
                }
                int panelState = Util.parseInt(qps['showPanel']);
                int giftId = Util.parseInt(qps['giftId']);
                IChatManager chatManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_CHAT);
                chatManager.openUserChatScreen(
                  context,
                  type: Util.notNullStr(qps['type']),
                  targetId: targetId,
                  refer: pushType,
                  onPageLoad: () {
                    if (panelState == 1) {
                      IGiftManager giftManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_GIFT);
                      giftManager.showPrivateGiftPanel(context,
                          uid: targetId,
                          defaultTab: DisplayPage.gift,
                          defaultId: giftId);
                    }
                  },
                );
              }
              break;
            case 'gift_wall': // 礼物墙
              int uid = Util.parseInt(qps['uid']);
              if (uid <= 0) {
                uid = Session.uid;
              }
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.showGiftWall(context, uid);
              break;
            case 'room_rank':
              // 'page=room_rank&rid=200055579&charmType=activity&tabType=week_star'
              if (qps.containsKey('rid') &&
                  qps.containsKey('charmType') &&
                  qps.containsKey('tabType')) {
                pageUrl =
                    '$pageUrl/${qps['rid']}/${qps['charmType']}/${qps['tabType']}';
                IRankManager rankManager0 = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_RANK);
                int rid = Util.parseInt(qps['rid']);
                String? charmType = Util.parseStr(qps['charmType']);
                String? tabType = Util.parseStr(qps['tabType']);
                rankManager0.showRoomRankMainTabScreen(context,
                    rid: rid, charmType: charmType ?? '', tabType: tabType);
              }
              break;
            case 'publish_moment':
              IMomentManager momentManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_MOMENT);
              momentManager.openMomentPublishScreen(context);
              break;

            case 'achieve_wall': // 成就墙
              if (qps.containsKey('uid')) {
                int uid = Util.parseInt(qps['uid']);
                pageUrl = '$pageUrl/$uid';
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openAchieveWallPage(context, uid);
              }
              break;
            case 'companion_rank': // 陪伴榜-亲密关系
              if (qps.containsKey('uid')) {
                int uid = Util.parseInt(qps['uid']);
                String? refer = Util.parseStr(qps['refer']);
                IRankManager rankManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_RANK);
                rankManager.showCompanionRankPage(
                    Constant.context, uid, refer ?? '');
              }
              break;
            case 'game_master_rank': //游戏主播榜
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              manager.showGameMasterRankPage(context);
              break;
            case 'task_center': // 任务中心
              IProfileManager profileManager0 = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PROFILE);
              profileManager0.openTaskCenter(context);
              break;
            case 'dynamic_publish_moment': // 切到动态一级页面--》打开发动态页面
              eventCenter.emit('HomePage.JumpToMomentPage');
              Future.delayed(const Duration(milliseconds: 500), () {
                IMomentManager momentManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                momentManager.openMomentPublishScreen(context,
                    showPlaySelect: false);
              });
              break;
            case 'show_fans_list': // 消息tab中粉丝列表
              eventCenter.emit('HomePage.JumpToFanList');
              break;
            case 'confess': // 表白墙
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openVindicateActivityBottomSheetPage(context, 0);
              break;
            case 'guess_gift': // 礼物猜猜乐
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openGuessGiftBottomSheetPage(context);
              break;
            case 'love_test_index': // 恋爱人格测试
              IProfileManager profileManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PROFILE);
              profileManager.openLoveTestIndexPage(context);
              break;
            case 'today_fate': //今日缘分
              // IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
              // manager.openFateDialog(context);
              break;
            case 'anchor_task': // 主播任务平台
              IProfileManager profileManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PROFILE);
              profileManager.openAnchorTaskScreen(context);
              break;
            case 'global_horn': // 全服喇叭
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openGlobalHornPanel(context);
              break;
            case 'handbook_page': //星际图鉴主页
              int uid = Util.parseInt(qps['uid']);
              if (uid <= 0) {
                uid = Session.uid;
              }
              int initIndex = Util.parseInt(qps['index']);
              if (initIndex <= 0) {
                initIndex = 0;
              }
              int gid = Util.parseInt(qps['giftId']);
              if (gid <= 0) {
                gid = 0;
              }
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openGiftWallScreen(context, uid,
                  giftId: gid, initIndex: initIndex);
              break;
            default:
              pageUrl =
                  Utility.navigateToUrl(context, qps['page'] ?? '', qps) ?? '';
              break;
          }
        }
      }
    }

    //语音通话被呼叫点击push打开app
    if (value != null && value is String) {
      try {
        Map<String, dynamic>? res = json.decode(value);
        if (res != null &&
            res['__page'] != null &&
            res['__page'] == 'phonecall' &&
            res['touid'] != null) {
          Tracker.instance.track(TrackEvent.push_click, properties: {
            'push_channel': Platform.operatingSystem,
            'push_touid': res['touid'],
            'push_type': 'notification',
            'content_id': '001',
            'push_type_id': '100024',
          });
        }
      } catch (e) {
        Log.d('push_channel: $e');
      }
    }

    return pageUrl;
  }

  bool checkSign(Map<String, String>? qps) {
    if (qps == null || qps.isEmpty || qps['sign'] == null) {
      return false;
    }
    List<String> keys = qps.keys.toList();
    keys.sort((a, b) {
      return a.compareTo(b);
    });
    String testSign = '';
    for (int i = 0; i < keys.length; i++) {
      if (keys[i] != 'sign') {
        testSign = "$testSign${keys[i]}=${qps[keys[i]]!}";
        if (i < keys.length - 1) {
          testSign = "$testSign&";
        }
      }
    }
    testSign = '&S#${Constant.testSign}_6?!pFA$testSign';
    testSign = generateMd5(testSign);
    testSign = testSign.substring(0, 8);
    if (qps['sign'] == testSign) {
      return true;
    } else {
      return false;
    }
  }

  /// 通用跳转，支持根据type类型跳转指定的页面
  /// 不推荐使用，新增跳转逻辑建议写到checkSchemeUrlAndGo方法中
  String jump(String? url, {String? type, String? title}) {
    if (url == null || url.isEmpty) return '';
    if (type != null && type == 'web') {
      return _jumpToWebPage(url, title);
    } else if (type != null && type == 'app') {
      return _jumpToAppPage(url);
    } else {
      if (url.startsWith(RegExp(r'http(s?)://'))) {
        return _jumpToWebPage(url, title);
      } else {
        return _jumpToAppPage(url);
      }
    }
  }

  /// 跳转到web页面
  String _jumpToWebPage(String? url, String? title) {
    if (url == null || url.isEmpty) return '';
    return SchemeUrlHelper.instance().checkSchemeUrlAndGo(
      System.context,
      SchemeUrlHelper.instance().concatSchemeUrlByH5(url, title: title),
    );
  }

  /// 跳转到app内部页面
  String _jumpToAppPage(String? url) {
    if (url == null || url.isEmpty) return '';
    return SchemeUrlHelper.instance().checkSchemeUrlAndGo(
      System.context,
      SchemeUrlHelper.instance()
          .concatSchemeUrl(url, SchemeUrlHelper.scheme_path_common_redirect),
    );
  }
}
