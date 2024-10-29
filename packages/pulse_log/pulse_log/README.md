# bblog

自研的日志采集客户端

-----

## APP集成

在 `bbcore` 的 `yaml` 文件中如下引用：

```yaml
  bblog:
    git:
      url: git@github.com:olaola-chat/cli-bblog.git
      path: bblog
      ref: xxx
```
----
## 代码配置

1. 自定义` XXLogConfig` 继承 `LogConfig`，示例如下：

    ```dart
    //xx_log_config.dart
    
    class XXLogConfig extends LogConfig{
    
      /// event事件中的公共属性
      @override
      Map<String, dynamic> get superProperties =>
          {'uid': Session.uid, 'pkg': Constant.packageName, 'version': Constant.appVersion};
    
      /// 唯一标识
      @override
      String get userIdentifier {
        if(Session.isLogined) return Session.uid.toString();
        return DeviceInfo.mac;
      }
      
      /// 用户设备信息
      /// + 取 banban_base/bbcore/lib/src/deviceInfo.dart 中 _data 数据
    @override
      Map<String, dynamic> get deviceInfo {
        Map<String, dynamic> info = Map.from(DeviceInfo.getDeviceInfo());
        if (Platform.isAndroid && info.containsKey('systemVersion')) {
          info['systemVersion'] = DeviceInfo.systemVersion;
        }
        if(info.containsKey('locale')){
          info['locale'] = (info['locale'] as Locale).toString();
        }
        return info;
      }
    
      ///上传配置 
      /// 其中 bbLogDomain 为日志上传域名地址， 由 AppConfig 相关接口配置下发
       @override
      UploadConfig? get uploadConfig => UploadConfig(
          logDomain: AppConfig.bbLogDomain,
          uid: Session.uid.toString(),
          packageName: Constant.packageName);
      
      
        ///单个日志文件限制大小 3~6Mb, 默认3Mb
      int get logFileMaxSize => 3*1024*1024;
    }
    
    // deviceInfo.dart
    class DeviceInfo{
      ...
      
      static Map<String, dynamic> getDeviceInfo() {
    		return _data;
    	}
    }
    ```

2. 在代码入口，`main.dart` 中如下配置：

    ```dart
      BBLog.config(XXLogConfig());
      // ⚠️ enablePrint 仅在debug环境打开，否则影响性能
      BBLog.enablePrint = System.debug;
    	// 在大于v0.1.0 版本中，日志记录默认关闭；下行可省略
    	BBLog.toggle(AppConfig.useBBlog);
    ```

3. 在 boot 中拉取更新 AppConfig 时，根据服务器策略，配置是否开启日志：

    ```dart
    // app_config.dart
    
    class AppConfig {
      ...
      /// 日志上报地址
      static const String device_report_domain = 'device_report_domain';
      /// 是否开启日志上报1：开启， 0：不开启
      static const String use_bblog = 'use_bblog';
      
      static String get bbLogDomain {
        return AppConfig.getConfig(AppConfig.device_report_domain);
      }
    
      static bool get useBBlog {
        return AppConfig.getConfig(AppConfig.use_bblog, defValue: '0');
      }
    }
    
    // boot.dart
    ...
    	AppConfig.sync(type: [
            ...
            AppConfig.device_report_domain, // 
            AppConfig.use_bblog,
          ]).then((value) {
      			...
            bool use = AppConfig.useBBlog;
            BBLog.toggle(use);
    	});
    ...
    ```
    
    

---

## 日志采集

`bblog` 按业务场景区分了 13 种日志类型

```dart
enum _LogType{
  net, // 网络请求
  socket, // websocket 请求
  event, // 事件
  router, // 路由
  exception, // flutter 异常
  console, // 控制台
  netConnectInfo, // 网络连接信息,
  user, //用户uid, 登录登出时
  nobility, // 开通贵族
  pay, // 支付行为
  gift, //礼物行为
  imageFail, //图片下载/上传失败
  rtc, // rtc 相关异常
}
```

其中 **路由**、**异常**、**网络**事件支持自采集，需进行如下配置：

+ 路由：在 `application.dart` 中，增加页面流转监听: bbLogRouterObserver

  ```dart
  ...
  _navigatorObservers = [
        ...defaultNavigatorObservers,
        _firebaseAnalyticsObserver,
        defaultLifecycleObserver,
        bbLogRouterObserver,
      ];
  ...
  ```

+ flutter 异常：在`main.dart` 中配置：

  ```dart
  ...
  runZonedGuarded(() async {
    ...
    FlutterError.onError = (FlutterErrorDetails details){
      ...
      BBLog.instance.flutterError(details);
  };
  }, (Object error, StackTrace stack) {
    ...
    BBLog.instance.flutterError(FlutterErrorDetails(exception: error, stack: stackTrace));
  }, zoneSpecification: ZoneSpecification(print: (self, parent, zone, message) {}));
  ```

+ 网络：在网络请求返回监听中，配置：

  ```dart
  // net_monitor.dart
  addNetworkEvent(NetworkReportEvent reportEvent, {String respBody = '', bool isPb = false}) async {
  ...
  NetBody body = NetBody(reportEvent.url);
  body.success = reportEvent.success;
  body.duration = reportEvent.duration;
  body.statusCode = reportEvent.httpCode;
  body.errorMsg = reportEvent.failMsg;
  body.body = respBody;
  body.isPb = isPb;
  BBLog.instance.log(body);
  ...
  
  // http2.dart 
  // 调整调用 addNetworkEvent 方法为 response = ... 之后 
    ... 
    response = http.Response.bytes(uncompressedBytes, statusCode, headers: rspHeaders);
    int endTime = _now();
    int requestDuration = endTime - start;
    //上报请求时间
    NetworkReportEvent reportEvent = NetworkReportEvent();
    reportEvent
      ..eventType = NetMonitor.EVENT_TYPE_REQ
      ..success = statusCode < 300
      ..url = queryUrl
      ..duration = requestDuration
      ..httpCode = statusCode
      ..time = startTime;
    String respBody = '';
    // 针对返回的不同类型数据，转码处理
    if(response != null && response.bodyBytes.lengthInBytes < 512*1024){
          if(pb){
            respBody = String.fromCharCodes(response.bodyBytes);
          }else{
            respBody = Utf8Decoder().convert(response.bodyBytes);
          }
          
     } 
    NetMonitor().addNetworkEvent(reportEvent, respBody:respBody, isPb:pb);
  ```

+ 房间 Socket 日志：记录行为分别为：连接成功、连接失败、连接关闭、消息发送、消息接收

  ```dart
  // chatRoomData.dart
  ...
  _channel.listen((dynamic message) async {
    ...
  }, onDone: () {
    print("websocketTest:onDone");
    BBLog.instance.log(SocketBody(SocketScene.room, SocketAction.onDone, {}));
    //
  }, onError: (e) {
    print("websocketTest:" + e);
    BBLog.instance.log(SocketBody(SocketScene.room, SocketAction.connectError, {'error': '${e.toString()}'}));
    _closeThenTry();
  }, cancelOnError: true);

  BBLog.instance.log(SocketBody(SocketScene.room, SocketAction.connectSucc, {}));
  ...
    
  ... 
    //send 中一次调用
    Future _send(String op, [Map data]) {
      ...
        // Log.d("send websocket op: $op, index: $_sendIndex, data: $data");
        try {
          String msg = json.encode({
            'op': op,
            'data': data == null ? {} : data,
            'index': _sendIndex,
          });
          _channel.add(msg);
          BBLog.instance.log(SocketBody(SocketScene.room, SocketAction.send, {'msg': data}));
        } catch (e) {
          Log.d("send websocket error: $e");
        }
  ...
       
  ...
    //dispatchSocketMsg 中两次调用
    Future dispatchSocketMsg(dynamic message) async {
    	...
      if (res.containsKey('i')) {
          int index = res['i'];
          if (_promiseMap.containsKey(index)) {
            dog.d(res);
            ChannelCallBack callBack = _promiseMap[index];
            if (res['s'] == true) {
              callBack.onSuccess(res['data']);
            } else {
              callBack.onError(res['msg'] ?? '');
            }
            _promiseMap.remove(index);
          }
          BBLog.instance.log(SocketBody(SocketScene.room, SocketAction.receive, {'msg': data}));
        } else {
          //from push
          // print("dispatchSocketMsg: res:$res");
          if (Util.parseInt(res['enc'], 0) > 0) {
            if (Util.parseInt(res['enc'], 0) > 10000) {
              /// 后续添加socket，直接走PB，不再pb转Map
              await _onPbEventNotify(res);
              return;
            }
            /// pb格式，先做转换
            Map content = await parsePb(res);
            if (content != null) {
              res['fromPb'] = content;
   
              BBLog.instance.log(SocketScene.room, SocketBody(SocketAction.receive, {'msg': content}));
            }
          }
    	...
  	}
    
    // _onPbEventNotify 中一次调用
    ...
    Uint8List buffer;
        if (byte != null) {
          buffer = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
          BBLog.instance.log(SocketBody(SocketScene.room, SocketAction.receive,
                {'msg': '_onPbEventNotify', 'id': '$id', 'name': socketName, 'byte': String.fromCharCodes(buffer)}, isPb: true));
          
        }
    ...
    
  ```

+ IM Socket 日志：记录行为分别为：连接失败、连接重试、真正连接、登录失败、被踢下线

  ```dart
  BBIMClient.onConnectError = (dynamic error, bool isNetworkConnected) {
        ...
        BBLog.instance.log(SocketBody(SocketScene.im, SocketAction.connectError, {'error': '${error.toString()}', 'isNetworkConnected': isNetworkConnected})); 
      };
  
  BBIMClient.onTryConnect = (Map<String, dynamic> params) {
        ...
        BBLog.instance.log(SocketBody(SocketScene.im, SocketAction.imTryConnect, params)); 
      };
  
  BBIMClient.onRealConnect = (String socketUrl, bool isNetworkConnected) {
        ...
        BBLog.instance.log(SocketBody(SocketScene.im, SocketAction.imRealConnect, {'socketUrl': socketUrl, 'isNetworkConnected': isNetworkConnected})); 
      };
  
  BBIMClient.onKickOut = (int reason) {
        ...
        BBLog.instance.log(SocketBody(SocketScene.im, SocketAction.imKickOut, {'reason':'$reason'}));
      };
  
      BBIMClient.onLoginError = (int code, String msg) {
        LogUtil.d('BANBAN_IM', "onLoginError code = $code, msg = $msg");
        BBLog.instance.log(SocketBody(SocketScene.im, SocketAction.imLoginError, {'code':'$code', 'msg':msg}));
        JsTimer.setTimeout(login, 5000); 
      };
  ```

  

+ flutter 异常

  ```dart
  //main.dart
  
  runZoned<Future<Null>>(() async { 
    FlutterError.onError = (FlutterErrorDetails details) {
        ...
        BBLog.instance.flutterError(details);
      };
  ...
  }, zoneSpecification:
        new ZoneSpecification(print: (self, parent, zone, message) {
      ...
    }), onError: (error, stackTrace) async { 
      BBLog.instance.flutterError(FlutterErrorDetails(exception: error, stack: stackTrace));
      ...
    });
  
  ```

+ 用户登录&登出

  ```dart
  // onLogin
  BBLog.instance.Login(Session.uid.toString());
  // onLogout
  BBLog.instance.Logout();
  ```

+ 开通贵族入口

  ```dart
  // nobility_buy_dialog.dart
  
  // 分别在 iOS 购买，订阅式，非订阅式 的 if 分支中调用
  BBLog.instance.log(NobilityBody(NobilityAction.showPay, {'type':'iap'}, true));
  BBLog.instance.log(NobilityBody(NobilityAction.showPay, {'type':'ali', 'cycle':1}, true));
  BBLog.instance.log(NobilityBody(NobilityAction.showPay, {'type':'${result.value.key}', 'cycle':0}, true));
  ```

+ 支付行为

  ```dart
  支付行为较多，请参见项目内 关键业务-支付行为上报.patch 文件； 
  ```
  
+ 礼物行为

  ```dart
  //displayGift.dart
  
  class _DisplayItemGiftState extends State<DisplayItemGift>
      with TickerProviderStateMixin<DisplayItemGift> {
    _loadAsset() async {
      	...
        BBLog.instance.log(GiftBody(GiftAction.play, widget.config.toString(), false, 'asset not found'));
        widget.onComplete(widget.config);
        return;
      }
    ...
   	if (widget.config.isLottie) {
        ...
        if (!(await file.exists())) {
          BBLog.instance.log(GiftBody(GiftAction.play, widget.config.toString(), false, 'asset not found'));
          widget.onComplete(widget.config);
          return;
        }
      ...
    }
    
    ...
    void _onComplete() {
      BBLog.instance.log(GiftBody(GiftAction.play, widget.config.toString(), true, ''));
      widget.onComplete(widget.config);
    }
    ...
  }
  
  // bbroom/lib/src/base/config.dart
  class DisplayGiftConfig {
   	...
   
    @override
    String toString() {
      return 'uuid=$uuid, giftId=$giftId, effectUrl=$effectUrl, type=${type.name}';
    }
   }
  ```

+ 图片上传下载失败

  ```dart
  //cachedNetworkImage.dart
  class CachedImageManager extends ValueNotifier<ConnectivityResult>{
    ...
  	_download(String url) async {
      ...
      BBLog.instance.log(ImageFailBody(ImageAction.download, url, reason));
  		_error(url);
  		...
    }
    
  	...
    Future<bool> downloadAsync(String url) async {
      ...
      if(!ok){
        BBLog.instance.log(ImageFailBody(ImageAction.download, url, reason));
      }
  
  		return ok;
    }
    
  ///imageUpload.dart
    _onError([String errorMessage]) {
      if (!this.mounted) return;
  
      BBLog.instance.log(ImageFailBody(ImageAction.upload, widget.uploadUrl, errorMessage??K.upload_error_retry));
      ...
    }
  ```

+ rtc 异常

  ```dart
  //rtc_helper.dart
  class RtcErrorMessage {
    final String message;
    final int level;
  
    RtcErrorMessage(this.message, this.level);
  
    @override
    String toString() => 'msg=$message, level=$level';
  }
  
  extension ErrorCodeExt on ErrorCode {
      
    RtcErrorMessage errorMsg() {
      switch (this) {
   				...
         case ErrorCode.VdmCameraNotAuthorized:
           return RtcErrorMessage(K.rtc_err_vdm_camera_not_authorized, 2);
         default: 
  				 return RtcErrorMessage('unknown', -1);
       }
     } 
  }
  
  //room_rtc_controller.dart
  
  _addListener() {
      _engine.addConnectionStateChangeCallback(_connectionCallback);
      _engine.addLocalAudioStateChangeCallback(_localAudioStateChangeCallback);
      _engine.addMixingStateChangedCallback(_audioMixingStateCallback);
      _engine.addWarningCallback(_warningCallback);
      _engine.addErrorCallback(_errorCallback); 
  }
  
    clearListener() {
      if (!_initialize) return;
      _engine.removeConnectionStateChangeCallback(_connectionCallback);
      _engine.removeLocalAudioStateChangeCallback(_localAudioStateChangeCallback);
      _engine.removeMixingStateChangedCallback(_audioMixingStateCallback);
      _engine.removeWarningCallback(_warningCallback);
      _engine.removeErrorCallback(_errorCallback);
    }
  
  void _errorCallback(ErrorCode err) {
      BBLog.instance.log(RtcExceptionBody(err.errorMsg().toString(), 'room'));
  }
  
  // phoneScreen.dart
    _onError(ErrorCode err) {
      ...
  
      BBLog.instance.log(RtcExceptionBody(err.errorMsg().toString(), 'voice-phone'));
    }
  ```
  
  

其他自定义日志：

1. 控制台日志

   ```dart
   BBLog.instance.console('Upload Success!',tag: 'UPLOAD');
   ```

2. 事件日志

   ```dart
   BBLog.instance.event('test_event',properties:{
       'uid':10000001,
       'is_login': true
   });
   ```

另外： 业务方在使用过程中，也可自己组装 `LogBody`，如上 NetBody，通过 `BBLog.instance.log(body)`上报， 也可使用默认方法进行上报：

```dart
/// 基础log方法
BBLog.instance.log(XXLogBody logbody); 
```



## 日志上报

目前的日志上报，依赖于业务方的手动触发。目前有两种形式：

1. 在需要用户手动触发的地方，按照如下调用：

    ```dart
    bool suc = await BBLog.instance.uploadLogByDefault(onSendProgress: (count, total){
          print('uploadProgress:');
    });
    ```

2. 自定义上报

    ```dart
    String uploadPath = await BBLog.instance.prepareUploadLog();
    bool suc = await customUploader.uploadLog(uploadConfig, File(uploadPath));
    BBLog.instance.uploadComplete(suc, uploadPath);
    ```
3. 上报其他日志，如声网等

    ```dart
    Directory docDir = await getApplicationDocumentsDirectory();
    Directory dir = Directory(join(docDir.path, 'aalog'));
    bool result = await BBLog.instance.uploadLogByDefault(onSendProgress: null, cancelToken: null, logDirPath: dir.path);
    if (result == true) {
      debugPrint('upload log succ');
    }
    ```
