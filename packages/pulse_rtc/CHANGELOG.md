## 1.1.9
* 更新声网版本

## 1.1.8
* 增加example工程，更名，降低声网SDK崩溃

## 1.1.7
* 添加声网合唱功能

## 1.1.6
* 升级声网版本

## 1.1.5
* setVoiceProfile方法中均衡器参数类型换为double
* 即构SDK更新（3.0.3-private.102），添加即构合唱相关逻辑

## 1.1.4-beta3
* 升级自研rtc V2.2.0

## 1.1.4-beta2
* 声网销毁使用同步参数，避免声网引擎多实例的crash

## 1.1.4-beta1
* 更新声网版本，修复概率性背景音乐无声音问题

## 1.1.4
* 声网点歌逻辑调整，修正MediaPlayer判断，添加相关回调
* 升级自研rtc V2.1.8

## 1.1.3
* 合并hisong分支声网点歌相关功能

## 1.1.2
* 升级自研rtc V2.1.7
* 升级path_provider: ^2.0.11

## 1.1.1
* catch声网flutter sdk异常，修复升级声网4.0问题

## 1.1.0
* 升级自研rtc V2.1.4
* 屏蔽视频直播相关初始化，暂时无TRTC视频直播场景，加速App启动速度
* 添加升级声网4.0，对应的package为flutter_common_agora_new
* 声网video-capture.aar迁移到独立库，用到此库的app需要在settings.gradle中include(":agora:libs")
* 自研rtc的commonrtc.aar迁移到独立库，用到此库的app需要在settings.gradle中include(":commonrtcsdk:libs")

## 1.0.4
* 升级自研rtc V2.1.2

## 1.0.3
* 升级自研rtc V2.1.1

## 1.0.2
* 合并分支master(711a5d9a)、pt(d2ccea01)、version/1.0.1(12572d8a)
* 自采集添加视频参数设置
* 升级自研rtc V2.1.0
* 添加aac framework缺失的字段(bundle name、bundle version、bundle short version)
* 添加适配12的蓝牙权限