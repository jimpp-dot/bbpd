
# commonrtc_api 统一接口适配层

commonrtc_api 目录为统一接口适配层，具体每一个rtc的实现在其他对应rtc目录下

目前集成的rtc类型有：

* [agora](https://www.agora.io) -> flutter_common_agora_new
* [zego](https://zego.im) -> zego-express-flutter-sdk
* [trtc](https://cloud.tencent.com/document/product/647) -> flutter_tencent_rtc 
* 自研 -> flutter_common_rtc

## 工程配置：

### 1.对需要使用RTC的模块引入依赖

1. commonrtc_api：**必选项**

```yaml
  commonrtc_api:
    git:
      url: git@github.com:olaola-chat/cli-bbrtc.git
      ref: master
      path: commonrtc_api
```

2. 具体的RTC服务依赖：**按需添加**，比如下面示例，只引入了声网-agora  

```yaml
 	agora:
    git:
      url: git@github.com:olaola-chat/cli-bbrtc.git
      ref: master
      path: flutter_common_agora_new
#  zego_express_engine:
#    git:
#      url: git@github.com:olaola-chat/cli-bbrtc.git
#      ref: master
#      path: zego-express-flutter-sdk
#  tencent_trtc_cloud_professional:
#    git:
#      url: git@github.com:olaola-chat/cli-bbrtc.git
#      ref: master
#      path: flutter_tencent_rtc
#  commonrtcsdk:
#    git:
#      url: git@github.com:olaola-chat/cli-bbrtc.git
#      ref: master
#      path: flutter_common_rtc
```

### 2.在业务模块初始化时，注册并配置具体使用到的RT服务

其中配置时，设置对应RTC的 appId 和 sign，注意区分正式环境和测试环境

```dart

import 'package:agora/bbapi/agora_engine.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:zego_express_engine/bbapi/zego_engine.dart';
import 'package:tencent_trtc_cloud_professional/bbapi/tencent_engine.dart';
import 'package:commonrtcsdk/agora.dart';

RtcManager.inst.registerRtcEngine(
      [
        AgoraEngine(),
        ZegoEngine(),
        //CommonEngine(),
        TencentEngine(),
      ],
    );

RtcBizConfig.initConfig(
      agoraConfig: EngineConfig(appId: ''),
      zegoConfig: EngineConfig(
        appId: '',
        appSign: '',
        isTestEnv: false,
      ),
      commonConfig: EngineConfig(
          appId: '',
          rtcServerAddress:''),
      debugLog: debugLog,
      tencentConfig: EngineConfig(
        appId: '',
        isTestEnv: false,
      ),
    );

```

### 3. 使用具体的某一个RTC实例

具体房间业务内使用的时候，只需要导入抽象的接口适配层

```dart
import 'package:commonrtc_api/commonrtc_api.dart';
```

```dart
  RtcEngine engine = RtcEngine.get(RtcEngineEnum.Zego);

  /// 进入房间初始化引擎
  engine.initEngine(config);
	engine.joinRoom(...);
  
  /// 实现业务流程...

  /// 退出房间关闭资源
  engine.leaveChannel();
  engine.destroy();
```

一个房间流程里，确保引擎的 `initEngine` 和 `destroy` 成对调用

所支持的统一封装的 Api可查看 `rtc_api.dart` ，详细文档的细节可以参考各个RTC服务商的文档，如声网：[Agora文档](https://docs.agora.io/cn/Video/landing-page?platform=Android)

## 现有的一般房间 rtc 相关流程梳理：

以 `ChatRoomData` 和 `RoomRtcController` 中代码逻辑为例：

1. 拉取房间信息，建立房间`Websocket`，初始化RTC：`_initRtc`；

2. `_initRtc` 中：
   1. 初始化 `RtcUseDelegate`；
   2. `initEngine`;
      1. 根据服务端配置的RTC类型，创建该RTC所需的配置，调用 `initEngine` 对具体的RTC进行初始化；
      2. 根据房间类型，初始化房间RTCMode：`setRoomMode`，如KTV模式；
      3. 根据房间类型，设置音频码率等参数：`setRecordingAudioFrameParameters`；
      4. 设置RTC预制配置：`setChannelProfile`， 如LiveBroadcasting， Communication；
      5. 禁用视频：`disableVideo`；
      6. 初始化房间成员角色：`setClientRole`；
      7. 设置音频参数和应用场景：`setAudioProfile`；
      8. 启用音频：`enableAudio`；
      9. 默认音频输出为扬声器：`setDefaultAudioRouteToSpeakerPhone(true)`；
      10. 加入实际的 RTC 频道：`joinRoom`；
      11. 禁用远端视频流：`muteAllRemoteVideoStreams`；
      12. 配置耳返: `setInEarMonitoringVolume`;
      13. 配置发言人定时器：`rtcSpeaker?.startSpeakerTimer`；
      14. 设置后台模式：`openBackgroundMode`；
      15. 配置本端禁言：`setMute`；
      16. 配置远端静音：`muteRemoteAudioStream`；
      17. 设置变声器：`setVoiceEffect`；
      18. 设置RTC事件回调：`addXXXCallback`；
   3. vad 配置；
   4. 设置自动上麦逻辑；
   5. RTC 首次初始化额外逻辑，如连麦处理；
   6. 设置房间内成员角色：观众或主播；
   7. 设置当前用户是否静音：`_compare`；

3. 房间内正常流程中可能涉及的RTC操作：

   1. 上下麦；
   2. 禁麦，屏蔽他人麦；
   3. 播放背景音乐；
   4. 连麦；

4. 关闭房间，销毁RTC：

   1. `rtcSpeaker?.cancelSpeakerTimer()`;
   2. 停止播放混流：`stopAudioMixing`；
   3. 停止连麦：`stopChannelMediaRelay`；
   4. 离开实际的RTC频道：`leaveChannel`；
   5. 清理RTC事件回调：`removeXXXCallback`；
   6. 销毁RTC引擎：`destroy`；


### 示例说明：

示例位于：/commonrtc_api/example

+ 注册RTC服务需在APP启动时注册，参见：BBRtcRegister；
+ /page 文件夹中包含了，简单的音视频示例，无过多的业务流程；
+ /rtc 文件夹中包含了，一个具体的业务RTC业务结构，从 lolfi 项目中抽取，可直接参考使用；