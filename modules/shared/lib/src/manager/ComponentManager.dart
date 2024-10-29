// ignore_for_file: constant_identifier_names

import 'iResourceLoader.dart';

export 'interface/iBASEGameManager.dart';
export 'interface/iCategotySelectorManager.dart';
export 'interface/iCertificateManager.dart';
export 'interface/iChatManager.dart';
export 'interface/iDrawGuessManager.dart';
export 'interface/iGiftManager.dart';
export 'interface/iGroupManager.dart';
export 'interface/iLoginManager.dart';
export 'interface/iMainManager.dart';
export 'interface/iMessageManager.dart';
export 'interface/iMomentManager.dart';
export 'interface/iPayManager.dart';
export 'interface/iPersonalDataManager.dart';
export 'interface/iPremadeManager.dart';
export 'interface/iProfileManager.dart';
export 'interface/iRankManager.dart';
export 'interface/iRoomManager.dart';
export 'interface/iSearchManager.dart';
export 'interface/iSettingManager.dart';
export 'interface/iVideoManager.dart';
export 'interface/iVipManager.dart';
export 'interface/iWereWolfManager.dart';
export 'model/homeListItem.dart';
export 'model/videoInfo.dart';

class ComponentManager {
  static ComponentManager? _instance;

  static const String MANAGER_BASE_CORE = 'shared'; //common_base，仅用于资源管理
  static const String MANAGER_MAIN = 'main'; //主app
  static const String MANAGER_SETTINGS = 'settings';
  static const String MANAGER_LOGIN = 'login';
  static const String MANAGER_CHAT = 'chat';
  static const String MANAGER_RANK = 'rank';
  static const String MANAGER_SEARCH = 'search';
  static const String MANAGER_PAY = 'pay';
  static const String MANAGER_CERTIFICATE = 'certificate';
  static const String MANAGER_VIDEO = 'video';
  static const String MANAGER_GROUP = 'group';
  static const String MANAGER_VIP = 'vip';
  static const String MANAGER_BASE_ROOM = 'chat_room';
  static const String MANAGER_CATEGORY_SELECTOR = 'category_selector';
  static const String MANAGER_PERSONALDATA = 'personaldata';
  static const String MANAGER_GIFT = 'gift';
  static const String MANAGER_PREMADE = 'premade';
  static const String MANAGER_MOMENT = 'moment';
  static const String MANAGER_MESSAGE = 'message';
  static const String MANAGER_PROFILE = 'profile';

  //新增
  static const String MANAGER_PLATFORM_WECHAT = "platform_wechat";
  static const String MANAGER_PLATFORM_QQ = "platform_qq";
  static const String MANAGER_PLATFORM_APPLE = "platform_apple";
  static const String MANAGER_WERE_WOLF = 'were_wolf';
  static const String MANAGER_AUMS_UAC = 'aums_uac';

  static const String MANAGER_DRAW_GUESS = 'draw_guess';

  // --- begin: 游戏中台 ---
  static const String MANAGER_WEBGAME_CORE = 'web_game_core';
  static const String MANAGER_WEBGAME_ROOM = 'web_game_room';

  //---   end: 游戏中台 ---

  final Map<String, IResourceLoader?> _managers = {};

  ComponentManager._();

  static ComponentManager get instance {
    _instance ??= ComponentManager._();
    return _instance!;
  }

  void initResources() {
    _instance?._managers.forEach((String name, IResourceLoader? manager) {
      if (manager != null) manager.loadStrings();
    });
  }

  void _addManager(String managerName, IResourceLoader? managerImpl) {
    _managers[managerName] = managerImpl;
  }

  void _removeManager(String managerName) {
    _managers.remove(managerName);
  }

  dynamic getManager(String managerName) {
    return _managers[managerName];
  }

  void registerManager(String managerName, IResourceLoader? manager) {
    if (manager != null) {
      instance._addManager(managerName, manager);
    }
  }

  void unregisterManager(String managerName) {
    instance._removeManager(managerName);
  }

  Map<String, IResourceLoader?> getManagers() {
    return _managers;
  }

  void addLocaleModule(String moduleName) {
    _addManager(moduleName, null);
  }
}
