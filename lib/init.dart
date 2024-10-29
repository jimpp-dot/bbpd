import 'dart:convert';
import 'dart:io';

import 'package:category_selector/category_selector.dart';
import 'package:certificate/certificate.dart';
import 'package:chat/chat.dart';
import 'package:chat_room/chat_room.dart' hide MessageContent;
import 'package:draw_guess/draw_guess.dart';
import 'package:gift/gift.dart';
import 'package:group/group.dart';
import 'package:login/login.dart';
import 'package:message/message.dart';
import 'package:moment/moment.dart';
import 'package:pay/pay.dart';
import 'package:personaldata/personaldata.dart';
import 'package:platform_apple/apple_platform.dart';
// import 'package:platform_qq/platform_qq.dart';
import 'package:platform_wechat/platform_wechat.dart';
import 'package:premade/premade.dart';
import 'package:profile/profile.dart';
import 'package:rank/rank.dart';
import 'package:search/search.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';
import 'package:video/video.dart';
import 'package:vip/vip.dart';
import 'package:web_game_core/web_game_core_manager.dart';
import 'package:web_game_room/web_game_room_manager.dart';
import 'package:were_wolf/were_wolf.dart';

import 'main_manager.dart';

const String IAP_PRODUCT_PREFIX = 'com.ly.bbpd.android';
const String IAP_PRODUCT_VIP_PREFIX = 'com.ly.bbpd.android.vip';
const String IAP_PRODUCT_SUB_PREFIX = 'com.ly.bbpd.android.sub';
const String IAP_PRODUCT_AUTO_PREFIX = 'com.ly.bbpd.android.subscription';

void initComponents() {
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_LOGIN, LoginManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_MAIN, MainManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_SETTINGS, SettingsManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_CHAT, ChatManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_RANK, RankManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_SEARCH, SearchManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_VIDEO, VideoManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_PAY, PayManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_GROUP, GroupManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_VIP, VipManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_CERTIFICATE, CertificateManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_BASE_ROOM, RoomManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_CATEGORY_SELECTOR, CategorySelectorManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_PERSONALDATA, PersonalDataManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_GIFT, GiftManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_PREMADE, PremadeManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_MOMENT, MomentManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_MESSAGE, MessageManager(initFamiliarCache: false));

  ComponentManager.instance.registerManager(ComponentManager.MANAGER_WERE_WOLF, WereWolfManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_PROFILE, ProfileManager());
  ComponentManager.instance.addLocaleModule(ComponentManager.MANAGER_PLATFORM_APPLE);
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_DRAW_GUESS, DrawGuessManager());
  // ComponentManager.instance.registerManager(ComponentManager.MANAGER_MUSIC, MusicManager());

  // 显示动态
  IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
  personalDataManager.customImageScreen(showLiteGame: false, showMoments: true);

  IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  payManager.setupIAPConfig(IAPConfig(
      iapPrefix: IAP_PRODUCT_PREFIX,
      vipPrefix: IAP_PRODUCT_VIP_PREFIX,
      subscriptionPrefix: IAP_PRODUCT_SUB_PREFIX,
      autoSubPrefix: IAP_PRODUCT_AUTO_PREFIX));

  if (!Session.isLogined || Session.role == UserRole.REG) {
    registerLogin();
  }

  MissionManager.canEnterGameRoom = true;

  ComponentManager.instance.registerManager(ComponentManager.MANAGER_WEBGAME_CORE, WebGameCoreManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_WEBGAME_ROOM, WebGameRoomManager());
}

bool hasRegisterLogin = false;

void registerLogin() {
  if (hasRegisterLogin == true) {
    return;
  }

  hasRegisterLogin = true;

  LoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  loginManager.initOneKey(BaseConfig.instance.oneKeySecret);

  if (!Session.isLogined) {
    OneKeyLogin.preLogin();
  }
  loginManager.setupThirdPlatforms([
    WechatPlatform(),
    // TimelinePlatform(),
    // QQPlatform(),
    // QZonePlatform(),
    // DouyinPlatform(),
    if (Platform.isIOS && Util.compareSystemVersion('13.0') >= 0) ApplePlatform(),
  ]);
  loginManager.setShowInviteCode(true);
}

/// 初始化全局event listener
void initGlobalListeners() {
  eventCenter.addListener(Im.EventCmd, (String event, dynamic value) async {
    Map res = value;
    String name = res['name'];
    Map data = res['data'] is Map && res['data'].isNotEmpty ? res['data'] : {};
    Map message = res['message'];
    int left = res['left'];
    if (name == 'chat.gift' || name == 'chat.package' || name == 'group.package' || name == 'group.package.notify') {
      String messageType = 'text';
      String messageObject = 'RC:TxtMsg';
      String displayContent = '发送礼物';
      String conversationType = ConversationType.Private;
      String targetId = message['targetId'].toString();
      if (name == 'chat.package' || name == 'group.package') {
        displayContent = '发送红包';
      }
      if (name == 'group.package' || name == 'group.package.notify') {
        conversationType = ConversationType.Group;
        targetId = data['groupId'].toString();
      }
      if (name == 'group.package.notify') {
        messageType = 'info';
        messageObject = 'RC:InfoNtf';
        displayContent = data['message'];
      }
      MessageContent content = MessageContent(messageType, SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content = displayContent;
      content.extra = json.encode(data);
      content.sentStatus = 'SENT';
      content.messageDirection = MessageDirection.Send;
      content.objectName = messageObject;
      content.sentTime = DateTime.now().millisecondsSinceEpoch;
      MessageContent? localContent = await Im.insertMessage(conversationType, targetId, content);
      if (localContent != null) {
        eventCenter.emit(Im.EventMessageSent, {'messageId': localContent.messageId, 'left': left});
      }
    } else if (name == 'sync' && Session.isLogined) {
      Log.d("IM==>>$data");
      await Session.setValues(data);
      Session.sync();
    } else if (name == 'kick.out') {
      Session.logout();
    } else if (name == 'domain.change') {
      Xhr.changeDomain(data);
    } else if (name == 'private.upload.log') {
      // 根据类型上传日志
      int type = Util.parseInt(data['type'], 0);
      LogUploadManager.uploadLog(type);
    }
  });

  eventCenter.addListener("Session.Changed", (String name, dynamic value) {
    Log.d("Session.Changed $name, $value");
    String key = value;
    if (key == 'deleted') {
      int deleted = Session.getInt('deleted', 0);
      Log.d("Session.Changed deleted $deleted");
      if (deleted == 2) {
//        TopLiveTool.destroy();
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.topLiveToolDestroy();
      }
    }
  });

  eventCenter.addListener(Im.EventMessageReceived, (String type, dynamic value) async {
    try {
      Map data = value;
      int messageId = data['messageId'];
      MessageContent? message = await Im.getMessage(messageId);
      Log.d('EventMessageReceived');
      Log.d(message?.type ?? '');
      if (message != null && message.type == 'text') {
        Map? extra;
        try {
          if (Util.validStr(message.extra)) {
            extra = json.decode(message.extra!);
          }
        } catch (e) {}
        if (extra != null) {
          bool isEmoji = extra.containsKey('icon') &&
              extra.containsKey('type') &&
              (extra['type'] == 'emoji' ||
                  extra['type'] == 'magic' ||
                  extra['type'] == 'yellow' ||
                  extra['type'] == 'gif' ||
                  extra['type'] == 'dan' ||
                  extra['type'] == 'custom');
          if (isEmoji) {
            if (extra['icon'].toString().startsWith("magic.")) {
              eventCenter.emit("UserChat.PlayEmoji", extra['icon']);
            }
          }
        }
      } else if (message != null && message.type == 'info') {
        if (message.conversationType == ConversationType.Group) {
          //清楚缓存
          int groupId = Util.parseInt(message.targetId, 0);
          CachedNames.instance().remove(groupId);
        }
      }

      //如果是收到的下单消息,则播放提示音
      if (message != null && message.messageDirection == 'RECEIVE') {
        //消息类型为收到,此处一定为真
        String? extraJson = message.extra;
        Map? extra;
        try {
          if (extraJson != null && extraJson.isNotEmpty) {
            extra = json.decode(extraJson);
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  });
}

void initCurrentTheme() {
  R.setCurrentTheme();
}

// 马甲包一键登录，key按包名获取
String getPhoneAuthKey() {
  return 'Zy07IPvn';
}
