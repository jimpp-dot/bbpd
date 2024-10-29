# 归因上报SDK

## 背景
将原来通过APPlog上报的数据改为SDK上报，提升准确性和稳定性，同时减少后续对接和开发成本。

## 支持平台
+ iOS
+ Android

## 需接入的行为
+ 安装（第一次启动时，SDK内部进行行为转换：启动->安装）
+ 启动（启动时上报）
+ 切后台（进入后台时上报，上报频率：5分钟内至多1次，频率由SDK内部限制，外部只管调用 report 即可）
+ 切前台（进入后台时上报，上报频率：5分钟内至多1次，频率由SDK内部限制，外部只管调用 report 即可）
+ 注册（注册成功时上报）
+ 登录（登录成功时上报）

## 上报所需参数
上报数据：
+ ct, 客户端时间
+ mac，自研设备号
+ uid；用户id，未登录的默认0
+ channel，初始化渠道
+ package，包名
+ mt 手机型号
+ platform，系统类型，android/ios/pc/web/h5/mini
+ syv 系统版本
+ version，APP版本号
+ jversion js版本 - app默认空
+ net 连网方式
+ idfa，iOS设备号
+ imei，Android设备号
+ oaid，Android设备号 - 内地rom商才有
+ uagent, 浏览器user agent， 过滤中文和非法字符
+ simulator，是否模拟器
+ root, 是否root
+ action 行为
+ ldy 落地页剪切板数据
+ aaid，谷歌广告ID，仅海外；


## 接入步骤
### 1. git方式，引入依赖
+ basecore: 依赖 connectivity，ref: 0.1.1; 若依赖 connectivity_plus， ref: 0.2.3
  
    ```yaml
      base_attr_report:
        git:
          url: git@github.com:olaola-chat/cli-base_attr_report.git
          ref: 0.1.0
    ```

### 2.在`application.dart`或其他可监听APP启动、切后台、注册和登录事件的类中，导入
```dart
import 'package:base_attr_report/base_attr_report.dart';
```

### 3. 创建可返回归因上报部分参数（这些字段依赖baseCore）的辅助方法, 直接 copy 使用，不要额外添加字段(其他字段，SDK内部有)
```dart
  Future<Map<String, dynamic>> getAttrReportParams() async{
    String ldy = await Xhr.getLdy(); //此参数若无，传空字符串
    return {
      'mac': DeviceInfo.mac,
      'uid': Session.uid.toString(),
      'channel': DeviceInfo.channel,
      'package': Constant.packageName,
      'mt': Xhr.getMt(),
      'syv': DeviceInfo.systemVersion,
      'version': Constant.appVersion,
      'jversion': Config.get('report.user.jv', ''),
      'idfa': DeviceInfo.idfa,
      'imei': DeviceInfo.deviceId,
      'oaid': DeviceInfo.oaid,
      'uagent': DeviceInfo.userAgent,
      'simulator': DeviceInfo.isSimulator,
      'root': DeviceInfo.isRoot,
      'ldy': ldy, 
    };
  }
```

### 4. APP 启动后，调用 getAttrReportParams，then 回调后初始化SDK，并上报 start 行为
```dart
  getAttrReportParams().then((value){
    //国内
      baseAttrReport.instance.init(overseas: false, domain: 'yinjietd.com', regularParams: value);
    //国外
    //baseAttrReport.instance.init(overseas: true, domain: 'lolfi.com', regularParams: value, aaid:'xxx');
    baseAttrReport.instance.report(baseAttrReportAction.start);
  });
```

### 5.注册、登录，进后台事件发生时，进行上报
⚠️注意，登录上报时，需传参更新uid
```dart
  baseAttrReport.instance.report(baseAttrReportAction.login, uid: Session.uid.toString());
```

### 6.如仍有疑问，参见项目内示例：example/lib/application.dart 中代码
!!! 若需运行Demo，需先从项目中拷贝 basecore 到 example/base_base/ 目录下，再走后续流程
