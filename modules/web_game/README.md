# 游戏中台

- [`base_game_core`](base_game_core): 基础模块，App无需关注
- [`base_game_normal`](base_game_normal): 普通游戏模块(房间外的独立游戏)
- [`base_game_room`](base_game_room): **房间游戏模块**
- [`base_game_uno`](base_game_uno): uno游戏(使用flame而非h5引擎开发)

## 修改点

### common_core

- 新增一个manager类`iBASEGameManager.dart`，内容如下:
  
  ```dart
  abstract class IBASEGameCoreManager extends IResourceLoader {
    void switchOnlineDev(bool enable);
  
    bool isOnlineDev();
  }
  
  abstract class IBASEGameNormalManager extends IResourceLoader {
    Widget buildGardenGamePage({Key? key});
  }
  
  abstract class IBASEGameRoomManager extends IResourceLoader {
    bool isGameMsg(List<int> msg);
  
    void handleMsg(List<int> msg);
  
    Widget buildRoomGamePage({
      Key? key,
      required String gameType,
      bool showLoadingPage = true,
      bool showLoadingCloseBtn = true,
    });
  
    Widget buildRoomGamePluginPanel({Key? key});
  }
  
  abstract class IBASEGameUnoManager extends IResourceLoader {
    Widget buildUnoPage({Key? key});
  }
  ```
  
- `ComponentManager`: 新增如下几个静态常量  

  ```dart
  /// --- begin: 游戏中台 ---
  static const String MANAGER_BASEGAME_CORE = 'base_game_core';
  static const String MANAGER_BASEGAME_NORMAL = 'base_game_normal';
  static const String MANAGER_BASEGAME_ROOM = 'base_game_room';
  static const String MANAGER_BASEGAME_UNO = 'base_game_uno';
  /// ---   end: 游戏中台 ---
  ```


### app

- pubspec.yaml里按需添加引用：

  ```yaml
  // 通过git ref或者path引用
  base_game_core:
    path: path/to/base_game_core
  base_game_normal:
    path: path/to/base_game_normal
  base_game_room:
    path: path/to/base_game_room
  base_game_uno:
    path: pth/to/base_game_uno
  ```

- 在init里按需注册需要的游戏模块：

  ```dart
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_BASEGAME_CORE, BASEGameCoreManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_BASEGAME_NORMAL, BASEGameNormalManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_BASEGAME_ROOM, BASEGameRoomManager());
  ComponentManager.instance.registerManager(ComponentManager.MANAGER_BASEGAME_UNO, BASEGameUnoManager());
  ```

- 开发者模式添加游戏调试开关(可选)

  ```dart
  bool _gameOnlineDev = false;
  
  IBASEGameCoreManager baseGameCoreManager = ComponentManager.instance
    .getManager(ComponentManager.MANAGER_BASEGAME_CORE);
  
  @override
  void initState() {
    super.initState();
    ...
    _gameOnlineDev = baseGameCoreManager.isOnlineDev();
  }
  
  Widget _buildGameOnlineDev() {
    return ListTile(
      dense: true,
      title: Text(
        '游戏在线调试',
        textScaleFactor: 1.0,
        style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16.0),
      ),
      trailing: CupertinoSwitch(
        value: _gameOnlineDev,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool value) async {
          setState(() {
            _gameOnlineDev = value;
            baseGameCoreManager.switchOnlineDev(value);
          });
        },
      ),
    );
  }
  ```
