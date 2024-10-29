// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart' as PH;
import 'package:share/share.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/k.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:shared/shared.dart';
import 'package:shared/util/file_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../dart_extensions/text_extension.dart';

typedef StateBuilder = State Function();

///基于flutter自带webview封装，并支持指定开头的scheme跳转到内部页面
class BaseWebviewScreen extends StatefulWidget {
  final String url;
  final String? title;
  final bool transparent; //是否透明
  final bool iosVideoFullScreen;

  /// 以Widget嵌入形式,不再套Scaffold,防止顶部触摸被_ScaffoldSlot.statusBar挡住
  final bool embeddedWidget;

  /// webview嵌入其他可滚动控件中，将eagerGesture设为true，让webview在手势竞争中获胜，使得webview可滚动
  final bool eagerGesture;
  final bool needSafeArea;

  /// 返回键是否优先给web处理,部分网页back键一直能响应，导致页面退不出去
  final bool backPressToWebFirst;

  /// webview onPageFinished 回调
  final VoidCallback? onPageFinished;

  static String handlerUrl(String url) {
    Uri uri = Uri.parse(url);
    String host = uri.host;
    String path = uri.path;
    String query = uri.query;
    Log.d('BaseWebviewScreen.handlerUrl: url = $url, host = $host, path = $path, query = $query');

    if (path.contains('/help') && query.contains('q=k29')) {
      return 'http://bbpd-image.happyxq.cc.cn/document/k200.html';
    }
    if (path.contains('/help') && query.contains('q=k59')) {
      return 'https://bbpd-image.happyxq.cc.cn/document/k202.html';
    }
    if (path.contains('/help') && query.contains('q=k91')) {
      return 'https://bbpd-image.happyxq.cc.cn/document/k201.html';
    }

    if (path.contains('/help') || path.contains('/bb')) {
      return uri.replace(host: 'help.happyxq.cc.cn').toString();
    }

    if (path.contains('/tools') || path.contains('/act')) {
      return uri.replace(host: 'page.happyxq.cc.cn').toString();
    }

    if (path.contains('/document')) {
      return uri.replace(host: 'bbpd-image.happyxq.cc.cn').toString();
    }
    if (!host.contains('happyxq.cc.cn')) {
      RegExp regExp = RegExp(
        r"^((25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)\.){3}(25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)$",
        caseSensitive: false,
        multiLine: false,
      );
      bool isValidIp = regExp.hasMatch(host);
      if (isValidIp) {
        return uri.replace(host: 'help.happyxq.cc.cn').toString();
      } else {
        var slice = host.split('.');
        if (slice.length > 2) {
          var preSuffix = '';
          for (int i = 0; i < slice.length - 2; i++) {
            preSuffix += '${slice[i]}.';
          }
          return uri.replace(host: '${preSuffix}happyxq.cc.cn').toString();
        }
        return uri.replace(host: 'help.happyxq.cc.cn').toString();
      }
    }

    return url;
  }

  static Future show(
    BuildContext context, {
    required String url,
    String? title,
    Map? extra,
    bool? iosVideoFullScreen,
    bool backPressToWebFirst = true,
  }) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BaseWebviewScreen(
        url: handlerUrl(url),
        title: title,
        iosVideoFullScreen: iosVideoFullScreen ?? false,
        backPressToWebFirst: backPressToWebFirst,
      ),
      settings: RouteSettings(name: '/basewebview', arguments: {'url': url}),
    ));
  }

  const BaseWebviewScreen({
    Key? key,
    required this.url,
    this.title,
    this.transparent = false,
    this.iosVideoFullScreen = false,
    this.embeddedWidget = false,
    this.eagerGesture = false,
    this.needSafeArea = true,
    this.backPressToWebFirst = true,
    this.onPageFinished,
  }) : super(key: key);

  @override
  State createState() => _ScreenState();
}

class _ScreenState extends State<BaseWebviewScreen> with AutomaticKeepAliveClientMixin, BaseWebViewStateMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return super.buildView(context);
  }
}

/// 可自定义的一些功能
abstract class BaseWebViewFeature {
  List<Widget>? appBarActions();

  NavigationDelegate? navigationDelegate();
}

const int _screen_mode_full_transparent = 1;

mixin BaseWebViewStateMixin<T extends BaseWebviewScreen> on State<T> implements BaseWebViewFeature {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController? _webViewController;

  late Map<String, String> _headers;

  bool _loading = true;

  NavigationDelegate? _customNavigationDelegate;

  int _screenMode = 0;
  final bool _pageAnimationFinished = true;

  int shareTp = 0;

  final GlobalKey _key = GlobalKey();

  FlutterSound? _flutterSound;

  int _audioDurationMs = 0;

  AudioPlayer? _audioPlayer;
  StreamSubscription? _stateListener;
  StreamSubscription? _positionListener;

  DialogLoadingController? _loadingController;

  final String tag = "BaseWebviewScreen";

  //H5页面设置的标题，优先于初始化时传入的标题
  final ValueNotifier<String?> _title = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    String platform;
    if (Platform.isIOS) {
      platform = 'ios';
    } else {
      platform = 'android';
    }

    // Using Hybrid Composition
    if (Platform.isAndroid) {
      if (Util.cantHybridComposition()) {
        /// 华为的机器目前用SurfaceAndroidWebView，在房间内打开活动H5有概率崩溃，暂时还原为AndroidWebView
        WebView.platform = AndroidWebView();
      } else {
        WebView.platform = SurfaceAndroidWebView();
      }
    }

    _headers = {
      'User-Token': Uri.encodeComponent(Session.token),
      'User-Tag': Uri.encodeComponent(DeviceInfo.deviceId),
      'User-Oaid': Uri.encodeComponent(DeviceInfo.oaid),
      'User-Idfa': Uri.encodeComponent(DeviceInfo.idfa),
      'User-Agent': 'Agent / Xs $platform V${Constant.appVersion} / Js V1.0.0.0 / Login V${Session.version}',
      'User-Channel': 'appstore',
      'User-Model': Uri.encodeComponent(DeviceInfo.model),
    };

    eventCenter.addListeners([EventConstant.EventNavigatorPageRemove, EventConstant.EventSendH5Message], _onEvent);

    _customNavigationDelegate = navigationDelegate();
    _parseUrl();

    // _shareValid();
  }

  /// H5注册接收IM消息
  void _registerImMessage() {
    eventCenter.removeListener(EventConstant.EventSyncToWebMessage, _onSendImToH5Message);
    eventCenter.addListener(EventConstant.EventSyncToWebMessage, _onSendImToH5Message);
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventNavigatorPageRemove) {
      _onPagePop(data);
    } else if (type == EventConstant.EventSendH5Message) {
      _onSendH5Message(data);
    }
  }

  void _onSendH5Message(dynamic data) {
    if (data is Map) {
      _webViewController?.evaluateJavascript('toH5Message("${jsonEncode(data)}")');
    }
  }

  /// 透传IM消息
  void _onSendImToH5Message(String type, dynamic data) {
    if (data is Map) {
      try {
        String json = jsonEncode(data);
        _webViewController?.runJavascript('imToH5Message($json)');
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }
  }

  void _parseUrl() {
    var url = widget.url;
    if (url.isEmpty) {
      return;
    }
    var uri = Uri.tryParse(url);
    if (uri == null) {
      return;
    }
    Map<String, String> qps = uri.queryParameters;
    if (qps.isEmpty) {
      return;
    }
    Log.d('BaseWebViewMixState._parseUrl: uri = ${uri.toString()}');
    _screenMode = Util.parseInt(qps['clientScreenMode']);
    Log.d('BaseWebViewMixState._parseUrl: _screenMode = ${_screenMode.toString()}');
  }

  @override
  void dispose() {
    if (_flutterSound?.isRecording == true) {
      _stopRecorder(null);
    }
    _stopAudio(null);
    _hideLoading();
    eventCenter.removeListeners([EventConstant.EventNavigatorPageRemove, EventConstant.EventSendH5Message], _onEvent);
    eventCenter.removeListener(EventConstant.EventSyncToWebMessage, _onSendImToH5Message);
    super.dispose();
  }

  Future _onPageFinished() async {
    if (widget.onPageFinished != null) {
      widget.onPageFinished!();
    }
  }

  @override
  List<Widget>? appBarActions() {
    List<Widget> actions = [];
    if (kDebugMode) {
      actions.add(GestureDetector(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: widget.url));
            Fluttertoast.showToast(msg: widget.url, gravity: ToastGravity.CENTER);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: text14('复制', textColor: Colors.white),
          )));
    }
    if (shareTp > 0) {
      actions.add(_shareWidget());
      return actions;
    }

    if (kDebugMode) {
      return actions;
    }

    return null;
  }

  @override
  NavigationDelegate? navigationDelegate() {
    return null;
  }

  void reload() {
    Log.d('web view reload');
    _webViewController?.reload();
    if (mounted) {
      setState(() {});
    }
  }

  Widget buildView(BuildContext context) {
    Log.d('build webview, url: ${widget.url}, screenMode: $_screenMode,embeddedWidget=${widget.embeddedWidget}');
    if (widget.embeddedWidget == true) {
      return _buildBody(context);
    }
    // iOS上需要支持侧滑返回，不能使用WillPopScope; Android上使用WillPopScope拦截返回键处理网页内导航
    return Platform.isIOS
        ? buildScaffold(context)
        : WillPopScope(
            onWillPop: () {
              handleWebBackPress(context);
              return Future.value(false);
            },
            child: buildScaffold(context),
          );
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(),
      body: _buildBody(context),
    ).withCommonBg();
  }

  Widget _buildBody(BuildContext context) {
    return shareTp > 0 && _screenMode == _screen_mode_full_transparent
        ? Stack(
            children: [
              _buildWrappedWebViewBody(context),
              Container(
                padding: EdgeInsetsDirectional.only(top: Util.statusHeight),
                height: kToolbarHeight,
                width: Util.width,
                alignment: AlignmentDirectional.centerEnd,
                child: _shareWidget(),
              ),
            ],
          )
        : _buildWrappedWebViewBody(context);
  }

  PreferredSizeWidget? _buildAppBar() {
    PreferredSizeWidget? appBar;
    if (_screenMode == _screen_mode_full_transparent) {
      appBar = null;
    } else {
      appBar = BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        title: DefaultTextStyle(
          style: Theme.of(context).textTheme.titleLarge!,
          child: ValueListenableBuilder<String?>(
            valueListenable: _title,
            builder: (context, value, child) {
              return Text(
                _getTitle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
        onBackPressedCallback: () {
          handleWebBackPress(context);
        },
        actions: appBarActions(),
      );
    }
    return appBar;
  }

  Widget _shareWidget() {
    return InkWell(
      onTap: () {
        ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.share(context, Session.uid, webViewTp: shareTp);
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        alignment: Alignment.center,
        child: R.img("setting.svg",
            // color: _screenMode == _screen_mode_full_transparent ? Colors.black : R.color.mainTextColor,
            color: Colors.black,
            width: 24.0,
            height: 24.0,
            package: ComponentManager.MANAGER_BASE_ROOM),
      ),
    );
  }

  Widget _buildWrappedWebViewBody(BuildContext context) {
    if (_screenMode == _screen_mode_full_transparent) {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: _buildWebviewBody(context),
      );
    } else {
      return _buildWebviewBody(context);
    }
  }

  Map<String, String>? _getHeaders() {
    if (widget.url.startsWith('file:///')) {
      return null;
    }
    return isSelfDomain(widget.url) ? _headers : null;
  }

  Widget _buildWebView() {
    return Visibility(
      replacement: Container(
        color: widget.transparent ? Colors.transparent : Colors.white,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
      visible: _pageAnimationFinished,
      child: WebView(
        key: _key,
        initialUrl: widget.url,
        iosVideoFullScreen: widget.iosVideoFullScreen,
        backgroundColor: widget.transparent ? Colors.transparent : Colors.white,
        headers: _getHeaders(),
        debuggingEnabled: kDebugMode,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          _webViewController = webViewController;
          if (!widget.url.startsWith('file:///')) {
            //当url是本地file时如果带headers参数在iOS上会崩溃
            // webViewController.loadUrl(
            //   this.widget.url, headers: isSelfDomain(widget.url) ? _headers : {});
          } else if (!Util.isAndroid) {
            // IOS 加载本地html不会回调onPageFinished
            _iosFinish();
          }
        },
        navigationDelegate: (NavigationRequest request) async {
          if (_customNavigationDelegate != null) {
            var handle = await _customNavigationDelegate!(request);
            if (handle == NavigationDecision.prevent) {
              return NavigationDecision.prevent;
            }
          }

          if (request.url.startsWith('${SCHEME_PREFIX}showCommonWebScreen')) {
            _handleNativeProxyMessage(request.url);
            return NavigationDecision.prevent;
          }

          ///检查scheme
          String? pageUrl = SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, request.url);
          if (pageUrl.isNotEmpty) {
            return NavigationDecision.prevent;
          }
          Log.d('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        javascriptChannels: {
          JavascriptChannel(
            name: 'NativeProxy',
            onMessageReceived: (JavascriptMessage jsMsg) {
              String message = jsMsg.message;
              _handleNativeProxyMessage(message);
            },
          ),
        },
        onPageFinished: (String url) async {
          await _loadFinished();
          await _onPageFinished();
        },
        onWebErrorCallback: (e) {
          Log.e(e.msg);
        },
        onWebConsoleMessageCallback: (t, msg) {
          Log.e(msg);
        },
        gestureRecognizers: widget.eagerGesture ? {Factory(() => EagerGestureRecognizer())} : null,
      ),
    );
  }

  Widget _buildWebviewBody(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return widget.needSafeArea == true
          ? SafeArea(
              bottom: !Util.isIphoneX,
              child: _buildWebView(),
            )
          : _buildWebView();
    });
  }

  void handleWebBackPress(BuildContext context, {bool forceClose = false}) {
    if (_webViewController != null) {
      if (forceClose || !widget.backPressToWebFirst) {
        Navigator.of(context).pop();
        return;
      }

      Future<bool>? canGoBack = _webViewController?.canGoBack();
      canGoBack?.then((str) {
        if (str == true) {
          _webViewController?.goBack();
        } else {
          Navigator.of(context).pop();
        }
      });
    }
  }

  void loadUrl(String url) {
    if (_webViewController != null) {
      Log.d('BaseWebViewMixState.load url->$url');
      _webViewController?.loadUrl(url, headers: isSelfDomain(widget.url) ? _headers : {});
    }
  }

  _iosFinish() async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      await _loadFinished();
    });
  }

  _loadFinished() async {
    if (_loading) {
      _loading = false;
    }
    String? title = await _getWebTitle();
    Log.d('BaseWebViewMixState.build title = $title');
    if (_title.value != title && title != null && title.isNotEmpty) {
      _title.value = title;
    }
  }

  //获取h5页面标题
  Future<String?> _getWebTitle() async {
    String script = 'window.document.title';
    String? title;
    try {
      title = await _webViewController?.evaluateJavascript(script);
    } catch (e) {
      Log.d(e);
      title = '';
    }
    if (title?.startsWith('"') == true) {
      title = title!.substring(1, title.length);
    }
    if (title?.endsWith('"') == true) {
      title = title!.substring(0, title.length - 1);
    }
    return title;
  }

  String _getTitle() {
    if (_title.value != null) {
      return _title.value!;
    }
    return widget.title ?? '';
  }

  final String SCHEME_PREFIX = "bbpd://";

  Future _handleNativeProxyMessage(String message) async {
    Log.d('BaseWebViewMixState._handleNativeProxyMessage: message = $message');
    if (!message.startsWith(SCHEME_PREFIX)) {
      Log.d('BaseWebViewMixState._handleNativeProxyMessage: wrong message!!!');
      return;
    }

    ISettingManager? settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    IVipManager? vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    IPersonalDataManager? personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    IRankManager? rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);

    Uri uri = Uri.parse(message);
    String method = /*uri.host*/ _getMethodName(message);
    Map<String, String> params = uri.queryParameters;
    String callback = params.isNotEmpty && params.containsKey('cb') ? params['cb']! : '';
    String jsonParam = params.isNotEmpty && params.containsKey('param') ? params['param']! : '';
    Map<String, dynamic>? paramMap = jsonParam.isNotEmpty ? jsonDecode(jsonParam) : null;
    // Log.d('baseWB _handleNativeProxyMessage=${uri.toString()} params = $params  callback = $callback  jsonParam=$jsonParam');
    switch (method) {
      /// 设置页面标题
      case 'setTitle':
        _title.value = Util.parseStr(paramMap?['title']);
        // _refresh();
        break;

      /// 调起社交分享（微信、QQ）
      case 'shareDirect':
        if (settingManager != null && paramMap != null) {
          String? base64Str = Util.parseStr(paramMap['imgUrl']);
          settingManager.shareDirect(context, Session.uid, paramMap['type'],
              tp: paramMap['tp'], base64Str: base64Str, params: paramMap['params']);
        }
        break;

      /// 商城
      case 'showVipMall':
        if (vipManager != null) {
          vipManager.show(context);
        }
        break;

      /// 个人主页
      case 'showImageScreen':
        if (personalDataManager != null) {
          int uid = Util.parseInt(paramMap?['uid'], -1);
          if (uid > 0) personalDataManager.openImageScreen(context, uid, refer: const PageRefer('webview'));
        }
        break;

      /// 返回基本信息给h5
      case 'getUserInfo':
        Map<String, dynamic> retMap = {'uid': Session.uid, 'token': Session.token, 'icon': Session.icon};
        retMap['emulatorInfo'] = Util.emulatorInfo;
        retMap['isRooted'] = Util.isRooted ? '1' : '0';
        retMap['package'] = Constant.packageName;
        retMap['version_code'] = '6'; // 增加新任务种类时需要递增，方便服务端根据不同版本下发不同任务
        int ser = Util.parseInt(Config.get(SER_KEY, '0'));
        String serverEnv = 'production';
        if (ser == 1) {
          serverEnv = 'alpha';
        } else if (ser == 2) {
          serverEnv = 'development';
        } else if (ser == 3) {
          serverEnv = 'local';
        }
        retMap['server_env'] = serverEnv;
        retMap['lan'] = Translations.getLan();

        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        int rid = roomManager.getRid();
        retMap['rid'] = rid;

        retMap['name'] = Session.name;
        retMap['sex'] = '${Session.sex}';

        Map<String, String> reportInfo = {
          'mac': DeviceInfo.mac,
          'version': Constant.appVersion,
          'jversion': '2.1.0.0',
          'platform': Platform.isIOS ? 'ios' : 'android',
          'channel': DeviceInfo.channel, // channel
          'idfa': DeviceInfo.idfa,
          'mt': Xhr.getMt(),
          'syv': DeviceInfo.systemVersion,
          'imei': Platform.isIOS ? "" : DeviceInfo.deviceId, // imei
          'pname': Constant.packageName,
        };
        retMap['reportInfo'] = jsonEncode(reportInfo);

        String retJson = json.encode(retMap);
        _webViewController?.evaluateJavascript('$callback($retJson)');
        break;

      /// 排行榜
      case 'showRank':
        if (rankManager != null) rankManager.showRank(context, paramMap?['type']);
        break;

      /// 跳转网页
      case 'showCommonWebScreen':
        if (paramMap?['url'] == null) return;
        BaseWebviewScreen.show(context, url: paramMap!['url']);
        break;

      /// 跳转网页(系统浏览器打开)
      case 'showSystemWebScreen':
        if (paramMap?['url'] == null) return;
        String url = Uri.encodeFull(paramMap!['url']);
        launch(url, forceSafariVC: false);
        break;

      /// 附近的人
      case 'showNearby':
        IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openNearByScreen(context);
        break;

      /// 消息tab中粉丝列表
      case 'showFansList':
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToFanList');
        break;

      /// 消息tab中关注列表
      case 'showFollowList':
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToFollowList');
        break;

      /// 跳转首页
      case 'showHomePage':
        int tabIndex = 0;
        if (paramMap != null) {
          tabIndex = Util.parseInt(paramMap['tabIndex']);
        }
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToHomePage', tabIndex);
        break;

      /// 跳转首页热门tab
      case 'showHomeHotTab':
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToHomePage'); // 先跳首页
        eventCenter.emit('HomePage.JumpToHomeHotTab'); // 再切tab
        break;

      /// 跳转首页指定tab
      case 'showHomePageWithTab':
        String? tabType = Util.parseStr(paramMap?['tabType']);
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToHomePage');
        eventCenter.emit('HomePage.JumpToHomeTab', tabType); // 再切tab
        break;

      /// 跳转发现页
      case 'showDiscoveryPage':
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToDiscoveryPage');
        break;

      /// 跳转动态tab
      case 'showMomentPage':
        int subTabIndex = -1;
        if (paramMap != null) {
          subTabIndex = Util.parseInt(paramMap['subTabIndex'], -1);
        }
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToMomentPage', subTabIndex);
        break;

      /// 跳转匹配页
      case 'showMatchPage':
        Navigator.popUntil(context, ModalRoute.withName('/'));
        eventCenter.emit('HomePage.JumpToMatchPage');
        break;

      /// 娱乐房
      case 'showJoyRoom':
        if (rankManager != null) rankManager.showJoyRoom(context);
        break;

      /// 充值页
      case 'showChargeBalance':
        if (settingManager != null) {
          settingManager.openRechargeScreen(context);
        }
        break;

      /// 跳转手机号绑定(已经一键登录过或者绑定失败则跳身份验证)
      case 'showChargeOrBindPhoneNumber':
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        bool? result = false;
        if (!Session.mobileCertified) {
          // 已经一键登录过，不再跳转手机号一键绑定
          result = await loginManager.bindPhone(context, onlyAuthOwnPhone: true);
        }

        if (result == false && settingManager != null) {
          settingManager.openIdAuth(context);
        }
        break;

      /// 创建房间
      case 'showCreateRoom':
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openInitOperateDisplay(context);
        break;

      /// 随机进一个娱乐房
      case 'enterIdleJoyRoom':
        _enterJoyRoom();
        break;

      /// 随机进一个房间
      case 'enterIdleRoom':
        String? type = Util.parseStr(paramMap?['type']);
        _enterIdleRoom(type);
        break;

      /// 私聊
      case 'showPrivateChat':
        IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        String type = Util.notNullStr(paramMap?['type']);
        int targetId = Util.parseInt(paramMap?['targetId']);
        chatManager.openUserChatScreen(context, type: type, targetId: targetId, title: "");
        break;

      /// h5调用客户端进行签到
      case 'checkin':
        String? type = Util.parseStr(paramMap?['type']);
        String? date = Util.parseStr(paramMap?['date']);
        Map<dynamic, dynamic>? retMap = await BaseRequestManager.checkin(type ?? '', date ?? '');
        String? retJson = retMap != null ? json.encode(retMap) : null;
        _webViewController?.evaluateJavascript('$callback($retJson)');
        break;

      /// h5调用客户端进行领取任务奖励
      case 'getAward':
        String? missionType = Util.parseStr(paramMap?['mission_type']);
        String? missionId = Util.parseStr(paramMap?['mission_id']);
        Map<dynamic, dynamic>? retMap = await BaseRequestManager.getAward(missionType ?? '', missionId ?? '');
        String? retJson = retMap != null ? json.encode(retMap) : null;
        _webViewController?.evaluateJavascript('$callback($retJson)');
        break;
      case 'openRoom':
        // 进房间
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, paramMap?['rid'] ?? 0);
        break;
      case 'login':
        if (Session.isLogined == false) {
          ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
          loginManager.show(context);
        }
        break;

      /// 身份验证
      case 'idAuth':
        if (settingManager != null) settingManager.openIdAuth(context);
        break;

      /// 朋友圈发布页
      case 'momentPublish':
        IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        manager.openMomentPublishScreen(context, from: 'webview');
        break;

      /// 修改个人资料
      case 'modifyUserInfo':
        IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageModifyScreen(context);
        break;

      /// 选择房间玩法
      case 'selectRoomType':
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openInitOperateDisplay(context, refer: 'party');
        break;

      /// 跳转系统的app通知设置
      case 'openNotificationSettings':
        SharedAppPlugin.openNotificationSettings();
        break;

      /// 跳转到话题详情页。
      case 'openTopicDetail':
        IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        if (paramMap != null) {
          manager.openTagListScreenScreen(context, title: paramMap["tagName"], tagId: paramMap["tagId"]);
        }
        break;

      /// 跳转到话题广场页。
      case 'openTopicSquare':
        IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
        String? tab;
        if (paramMap != null) tab = paramMap["tab"];
        manager.openTopicSquareScreen(context, tab: tab);
        break;
      case 'openCertificateVerifyScreen':
        _openCertificateVerifyScreen();
        break;

      /// 绑定安全手机号
      case 'showSafeBind':
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        await loginManager.bindPhone(context, isSafeBind: true);

        String retJson = json.encode({'success': 'true'});
        _webViewController?.evaluateJavascript('$callback($retJson)');
        break;

      /// 跳转手机号绑定
      case 'showBindPhone':
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        await loginManager.bindPhone(context, onlyAuthOwnPhone: false);

        String retJson = json.encode({'success': 'true'});
        _webViewController?.evaluateJavascript('$callback($retJson)');
        break;

      /// 跳转第三方账号绑定
      case 'showThirdPlatformBind':
        String? key = Util.parseStr(paramMap?['platform']);
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        IThirdPlatform? platform = loginManager.getThirdPlatforms().firstWhereOrNull((e) => e.tag() == key);
        if (platform != null && platform.supportLogin()) {
          platform.onLoginTap(context, 'bind', (value) {
            String retJson = json.encode({'success': 'true'});
            _webViewController?.evaluateJavascript('$callback($retJson)');
          }, (value) {
            String retJson = json.encode({'success': 'true'});
            _webViewController?.evaluateJavascript('$callback($retJson)');
          });
        }
        break;
      case 'saveImage':
        bool success = false;
        String? url = Util.parseStr(paramMap?['url']);
        if (url != null && url.isNotEmpty) {
          bool result = await FileUtil.saveImageToGallery(url);
          if (result) {
            success = true;
            Fluttertoast.showToast(msg: K.save_success);
          } else {
            Fluttertoast.showToast(msg: K.save_failed);
          }
        } else {
          String? content = Util.parseStr(paramMap?['content']);
          if (content != null && content.isNotEmpty) {
            bool result = await FileUtil.saveImageDataToGallery(content);
            if (result) {
              success = true;
              Fluttertoast.showToast(msg: K.save_success);
            } else {
              Fluttertoast.showToast(msg: K.save_failed);
            }
          }
        }
        _evaluateCallbackIfNeeded(callback, {'success': success});
        break;
      case 'getSystemInfoSync':
        var retMap = <String, dynamic>{};
        retMap['statusBarHeight'] = Util.statusHeight.ceil();
        var retJson = json.encode(retMap);
        _webViewController?.evaluateJavascript('$callback($retJson)');
        break;
      case 'navigateBack':
        bool forceClose = false;
        if (paramMap != null) {
          forceClose = Util.parseInt(paramMap['forceClose']) == 1;
        }
        handleWebBackPress(context, forceClose: forceClose);
        break;
      case 'mission':
        _mission(paramMap, callback);
        break;

      ///跳转应用市场
      case 'goToMarket':
        AppReviewDialog.doAppReview(report: false);
        break;
      case 'openFriendsPlaying':
        IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        messageManager.openFriendsPlayingPage(context);
        break;
      case 'openMyLevel':
        int tab = Util.parseInt(paramMap?['tab'], 0);
        MyLevelTab levelTab = MyLevelTab.Popularity;
        if (tab == 1) {
          levelTab = MyLevelTab.Vip;
        } else if (tab == 2) {
          levelTab = MyLevelTab.Title;
        }

        IVipManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        manager.showMyLevelScreen(context, initialTab: levelTab);
        break;
      case 'startParty':
        String? type = Util.parseStr(paramMap?['type']);
        IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openStartParty(context, type ?? '', refer: 'webview');
        break;
      case 'openMyBag': //打开我的背景指定tab
        String tabType = '';
        if (paramMap != null) {
          tabType = Util.parseStr(paramMap['type']) ?? '';
        }
        // 背包
        IVipManager vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.showBagPage(context, tabType: tabType);
        break;
      case 'buyGiftPicks':
        _buyGiftPicks(params, callback);
        break;
      case 'schema':
        if (paramMap != null) {
          String? schemeUrl = Util.parseStr(paramMap['schema_url']);
          if (schemeUrl != null && schemeUrl.isNotEmpty) {
            SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, schemeUrl);
          }
        }
        break;
      case 'openAccostConfigPage':
        IMessageManager messageManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
        messageManager.openAccostConfigPage(context);
        break;

      case 'startRecorder':
        _startRecorder(callback);
        break;
      case 'stopRecorder':
        _stopRecorder(callback);
        break;
      case 'playAudio':
        _playAudio(paramMap, callback);
        break;
      case 'stopAudio':
        _stopAudio(callback);
        break;
      case 'setAudioEffectPresets':
        _setAudioEffectPresets(paramMap, callback);
        break;
      case 'saveFileToDownloadPath':
        _saveFileToDownloadPath(paramMap, callback);
        break;
      case 'uploadFile':
        _uploadFile(paramMap, callback);
        break;
      case 'trackEvent':
        Log.d('trackEvent==> eventName: ${paramMap?['eventName']}, pro: ${paramMap?['properties']}');

        Tracker.instance.track(TrackEvent(paramMap?['eventName']), properties: paramMap?['properties']);
        break;

      /// 用于H5向Native传递数据
      case 'toNativeMessage':
        eventCenter.emit(EventConstant.EventReceiveH5Message, paramMap);
        break;

      /// 注册IM消息
      case 'registerImMessage':
        _registerImMessage();
        break;

      /// 增加新任务种类时，需要把上面getUserInfo中返回的version_code递增，让服务端根据app版本返回不同任务
      default:
        Log.d('The current version does not currently support this method, method=$method');
        break;
    }
  }

  //H5支付，任务中心购买等级
  void _mission(Map? params, String callback) async {
    int money = Util.parseInt(params?['money']);
    if (params == null || params.isEmpty) {
      String retJson = json.encode({'success': false});
      _webViewController?.evaluateJavascript('$callback($retJson)');
      return;
    }

    IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(context, money);
    if (result == null || result.reason == SheetCloseReason.Active) {
      String retJson = json.encode({'success': false});
      _webViewController?.evaluateJavascript('$callback($retJson)');
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功刷新余额
      String retJson = json.encode({'success': false});
      _webViewController?.evaluateJavascript('$callback($retJson)');
      return;
    }

    payManager.pay(context, key: 'mission', type: result.value?.key ?? '', refer: 'mission', args: params, onPayed: () {
      String retJson = json.encode({'success': true});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    }, onError: (_) {
      String retJson = json.encode({'success': false});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    });
  }

  void _buyGiftPicks(Map params, String callback) async {
    IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    onSucc() {
      String retJson = json.encode({'success': true});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    }

    onError(_) {
      String retJson = json.encode({'success': false});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    }

    if (Platform.isIOS) {
      String productId = 'com.rewan.who.activity.20006';

      payManager.pay(context,
          key: 'buyGiftPicks', type: 'iap', refer: 'buyGiftPicks', args: {}, productId: productId, onError: onError, onPayed: onSucc);
    } else {
      SheetCallback? result = await payManager.showPTSheet(context, 600, showBalance: System.debug);
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }

      payManager.pay(context,
          key: 'buyGiftPicks',
          type: result.value?.key ?? '',
          refer: 'buyGiftPicks',
          args: {
            'money': 600,
            'type': 'games-month-package',
          },
          canUseCoin: false,
          onError: onError,
          onPayed: onSucc);
    }
  }

  int _godLicenseVersion = 0; // 主播协议版本
  int _agreedGodLicenseVersion = 0; // 已同意的主播协议版本
  bool _mobileCertified = false;
  bool _cardCertified = false;

  void _openCertificateVerifyScreen() async {
    if (!Session.isLogined) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    _godLicenseVersion = Util.parseInt(Session.getValue('godlicense.version'));
    _agreedGodLicenseVersion = Util.parseInt(Session.getValue('agreement_version'));
    if (Session.isLogined) {
      _cardCertified = Session.idAuthenticated;
      _mobileCertified = Util.parseInt(Session.getValue('_mobile')) > 0;
    }

    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    ICertificateManager certificateManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CERTIFICATE);

    bool godCertified = _godCertified();

    if (Util.isAndroidVerify == false) {
      if (!godCertified) {
        if (settingManager.isJuvenilesModeActive()) {
          Toast.showCenter(context, BaseK.K.under_minor_auth_notice);
          return;
        }
        if (_godLicenseVersion > 0 && _agreedGodLicenseVersion < _godLicenseVersion) {
          bool agreed = await certificateManager.openGodLicenseDialog(context, _agreedGodLicenseVersion);
          if (!agreed) return;
        }
        if (!_mobileCertified) {
          dynamic bindSuccess = await settingManager.openBindScreen(context, type: 'bind');
          if (bindSuccess != true) return;
        }
        settingManager.openIdAuth(context, certifyType: CertifyType.god);
      } else {
        certificateManager.openCertificateVerifyScreen(context);
      }
    }
  }

  /// 所有条件都满足的主播
  bool _godCertified() {
    return _agreedGodLicenseVersion > 0 && _agreedGodLicenseVersion >= _godLicenseVersion && _cardCertified && _mobileCertified;
  }

  String _getMethodName(String message) {
    int startIndex = SCHEME_PREFIX.length;
    int endIndex = message.indexOf('?');
    return message.substring(startIndex, endIndex);
  }

  Future _enterJoyRoom() async {
    String url = '${System.domain}mission/idlejoyroom';
    Log.d("enter joy room");
    XhrResponse response = await Xhr.getJson(url, throwOnError: false);
    Log.d("joy room respsonse");
    Map res = response.value();
    if (res['success'] == true) {
      Log.d("joy room success");
      Map? data = res['data'];
      if (data != null) {
        int rid = Util.parseInt(data['rid']);
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, rid);
        Log.d("enter idle joy room");
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } else {
      Fluttertoast.showToast(msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  Future _enterIdleRoom(String? type) async {
    String url = '${System.domain}list/live/?version=2&page=1&type=$type';
    XhrResponse response = await Xhr.getJson(url, throwOnError: false);
    Map res = response.value();
    if (res['success'] == true) {
      Map? data = res['data'];
      if (data != null) {
        List? itemList = data['list'];
        if (itemList?.isEmpty ?? true) return;

        Map? itemData = itemList![Random().nextInt(itemList.length)];
        int rid = Util.parseInt(itemData?['rid'], 0);
        if (rid <= 0) return;
        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(System.context, rid, refer: 'webview');
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } else {
      Fluttertoast.showToast(msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  _onPagePop(Object data) async {
    if (data is RouteRemovedEvent && _webViewController != null) {
      RouteRemovedEvent event = data;
      if (event.previousRoute?.settings.name == '/basewebview') {
        dynamic arguments = event.previousRoute?.settings.arguments ?? {};
        String url = Util.notNullStr(arguments['url']);
        if (url == widget.url) {
          try {
            await _webViewController?.evaluateJavascript('onReturnToWeb()');
          } catch (e) {
            Log.e(e, tag: 'BaseWebviewScreen _onPagePop');
          }
        }
      }
    }
  }

  Future _shareValid() async {
    String url = '${System.domain}mate/share/valid';
    try {
      Map<String, String> params = {
        'url': widget.url,
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        int tp = Util.parseInt(res['data']['tp']);
        if (tp > 0) {
          setState(() {
            shareTp = tp;
          });
        }
      }
    } catch (e) {
      Log.d('BaseWebViewScreen..._shareValid error = $e');
    }
  }

  void _startRecorder(String callback) async {
    Map map = {'success': true, 'msg': ''};

    try {
      _flutterSound ??= FlutterSound();

      if (_flutterSound!.isRecording) {
        await _flutterSound!.stopRecorder();
      }

      String? re = await _flutterSound?.startRecorder(null);

      _flutterSound?.onRecorderStateChanged.listen((e) {
        if (e == null) {
          return;
        }
        _audioDurationMs = e.currentPosition.toInt();
      });

      if (re == 'permission_granted') {
        map['success'] = false;
        map['msg'] = 'permission_granted';
      }
    } catch (e) {
      Log.d('BaseWebViewScreen..._startRecorder error = $e');
      map['success'] = false;
      map['msg'] = '$e';
    }

    String retJson = json.encode(map);
    _webViewController?.evaluateJavascript('$callback($retJson)');
  }

  void _stopRecorder(String? callback) async {
    Map map = {};
    if (_flutterSound == null) {
      if (!Util.isStringEmpty(callback)) {
        map['success'] = false;
        map['msg'] = 'flutterSound not init';

        String retJson = json.encode(map);
        _webViewController?.evaluateJavascript('$callback($retJson)');
      }
      return;
    }

    try {
      String? result = await _flutterSound?.stopRecorder();
      if (result == null || Util.isStringEmpty(callback)) {
        return;
      }
      String path = '';
      if (Platform.isIOS) {
        path = result.substring(7);
      } else if (Platform.isAndroid) {
        path = result;
      }

      File file = File(path);

      bool exists = await file.exists();
      if (exists) {
        FileStat stat = await file.stat();
        if (stat.size > 0) {
          map['success'] = true;
          map['msg'] = '';
          map['duration'] = _audioDurationMs;
          map['filePath'] = path;
          map['fileSize'] = stat.size;
        }
      } else {
        map['success'] = false;
        map['msg'] = 'File not exists';
      }
    } catch (e) {
      Log.d('BaseWebViewScreen..._stopRecorder error = $e');
      map['success'] = false;
      map['msg'] = '$e';
    }
    String retJson = json.encode(map);
    _webViewController?.evaluateJavascript('$callback($retJson)');
  }

  void _playAudio(Map? map, String callback) async {
    String? url = Util.parseStr(map?['url']);
    if (Util.isNullOrEmpty(url)) return;
    _audioPlayer ??= AudioPlayer()..setReleaseMode(ReleaseMode.stop);

    if (_stateListener != null) {
      _stateListener!.cancel();
    }
    _stateListener = _audioPlayer!.onPlayerStateChanged.listen((s) {
      String retJson = json.encode({'success': true, 'msg': '', 'stateChanged': '$s'});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    });

    if (_positionListener != null) {
      _positionListener!.cancel();
    }
    _positionListener = _audioPlayer?.onPositionChanged.listen((event) {
      int ms = event.inMilliseconds;
      String retJson = json.encode({'success': true, 'msg': '', 'progressUpdate': '$ms'});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    });

    try {
      if (_audioPlayer?.state == PlayerState.playing) {
        await _audioPlayer?.stop();
      }

      await _audioPlayer?.play(!url!.startsWith('http') ? DeviceFileSource(url) : UrlSource(url));

      String retJson = json.encode({'success': true, 'msg': ''});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    } catch (e) {
      String retJson = json.encode({'success': false, 'msg': '$e'});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    }
  }

  void _stopAudio(String? callback) {
    if (_audioPlayer == null) {
      return;
    }
    try {
      _audioPlayer?.stop();
      if (Util.isStringEmpty(callback)) {
        return;
      }
      String retJson = json.encode({'success': true, 'msg': ''});
      _webViewController?.evaluateJavascript('$callback($retJson)');
    } catch (e) {
      if (!Util.isStringEmpty(callback)) {
        String retJson = json.encode({'success': false, 'msg': '$e'});
        _webViewController?.evaluateJavascript('$callback($retJson)');
      }
    }
  }

  void _setAudioEffectPresets(Map? map, String callback) async {
    //临时文件路径生成方法
    // try {
    //   String tempDir = (await getTemporaryDirectory()).path;
    //   String tempFilePathFor(String originPath, String mark) {
    //     String extension = FlutterPath.extension(originPath);
    //     if (extension == '.m4a') {
    //       //音视频支持m4a输入，不支持输出，所以这里强制改成mp3
    //       extension = '.mp3';
    //     }
    //     String oldFileName = FlutterPath.basename(originPath);
    //     return tempDir + '/' + oldFileName.replaceAll(extension, '') + mark + extension;
    //   }

    //   bool saveToDownload = map['save_to_download'] != null ? Util.parseBool(map['save_to_download']) : false;
    //   int initElement = map['init_element'] != null ? Util.parseInt(map['init_element']) : 8;
    //   int tunerMode = map['tuner_mode'] != null ? Util.parseInt(map['tuner_mode']) : 1;
    //   bool halfEffect = map['half_effect'] != null ? Util.parseBool(map['half_effect']) : false;
    //   String inputFilePath = map['file_path'];
    //   String tempInFilePath = inputFilePath;
    //   String extension = FlutterPath.extension(inputFilePath);
    //   String tempOutFilePath;
    //   String outputFilePath = '';
    //   if (map['output_path'] != null) {
    //     outputFilePath = map['output_path'];
    //   } else {
    //     outputFilePath = tempFilePathFor(inputFilePath, '_effected');
    //   }
    //   int audioProfile = map['audio_profile'] != null ? Util.parseInt(map['audio_profile']) : 5;
    //   String progressCallback = map['progress_callback'];
    //   List<dynamic> effectPreset = map['effects'];

    //   //检查参数合法性
    //   if (Util.isStringEmpty(inputFilePath)) {
    //     _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': 'file is null'});
    //     return;
    //   } else if (extension == null || !['.mp3', '.wav', '.m4a'].contains(extension)) {
    //     _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': 'file is illegal'});
    //     return;
    //   } else if (effectPreset.length == 0) {
    //     _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': 'effects is null'});
    //     return;
    //   }

    //   int works = effectPreset.length;
    //   int currentIndex = 0;

    //   Future<void> setNextEffect(int effect) async {
    //     bool isLast = currentIndex == effectPreset.length - 1;

    //     tempOutFilePath = tempFilePathFor(inputFilePath, '_temp_$currentIndex');
    //     String outPath = isLast ? outputFilePath : tempOutFilePath;
    //     await BBEffectApi.inst.setTunerMode(tunerMode);
    //     await BBEffectApi.inst.setAudioRecordFilePath(tempInFilePath, append: false);
    //     await BBEffectApi.inst.setAudioOutputFilePath(outPath);
    //     await BBEffectApi.inst.setAudioProfile(audioProfile);
    //     await BBEffectApi.inst.setAudioEffectPreset(effect);
    //     await BBEffectApi.inst.start();

    //     if (tempInFilePath != inputFilePath) {
    //       //删除中间生成的文件
    //       File.fromUri(Uri.file(tempInFilePath)).deleteSync();
    //     }
    //     tempInFilePath = tempOutFilePath;
    //   }

    //   BBEffectApi.onProductProgress = (double progress) async {
    //     if (progress >= 100) {
    //       if (works > 1) {
    //         works--;
    //         //继续添加下一个效果
    //         currentIndex = effectPreset.length - works;
    //         int effect = effectPreset[currentIndex];
    //         await BBEffectApi.inst.stop();
    //         await setNextEffect(effect);
    //       } else {
    //         works = 0;
    //         //所有效果添加完成
    //         BBEffectApi.onProductProgress = null;
    //         await BBEffectApi.inst.stop();
    //         await BBEffectApi.inst.release();

    //         if (!Util.isNullOrEmpty(progressCallback)) {
    //           _webViewController.evaluateJavascript('$progressCallback(100)');
    //         }

    //         if (saveToDownload) {
    //           _saveFileToDownloadPath({'file_path': outputFilePath}, callback);
    //         } else {
    //           _evaluateCallbackIfNeeded(callback, {'success': true, 'file_path': outputFilePath});
    //         }
    //         return;
    //       }
    //     }

    //     if (!Util.isNullOrEmpty(progressCallback)) {
    //       double totalProgress = (currentIndex * 100 + progress) / (effectPreset.length * 100) * 100;
    //       _webViewController.evaluateJavascript('$progressCallback($totalProgress)');
    //     }
    //   };

    //   await BBEffectApi.inst.createEffectCore();
    //   await BBEffectApi.inst.initialize(initElement);
    //   if (halfEffect) {
    //     String jsonStr = json.encode({'che.audio.half.tone' : true});
    //     BBEffectApi.inst.setParameters(jsonStr);
    //   }
    //   setNextEffect(effectPreset[currentIndex]);
    // } catch (e) {
    //   _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': e.toString()});
    // }

    // 为了缩减包大小，先下线处理
    _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': K.data_error});
  }

  void _saveFileToDownloadPath(Map? map, String callback) async {
    String? filePath = Util.parseStr(map?['file_path']);

    if (Util.isStringEmpty(filePath)) {
      _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': 'file is null'});
      return;
    }

    if (Util.isIOS) {
      //iOS弹出系统分享面板，让用户手动保存到《文件》APP
      await Share.shareFiles([filePath!]);
      _evaluateCallbackIfNeeded(callback, {'success': true});
    } else {
      PH.PermissionStatus permissionStatus = await PermissionUtil.checkAndRequestPermissions(context, PH.Permission.storage);
      if (permissionStatus != PH.PermissionStatus.granted) {
        _evaluateCallbackIfNeeded(callback, {'success': false, 'msg': 'permission deny'});
        return;
      }

      bool success = await SharedAppPlugin.copyFileToDownload(filePath);
      _evaluateCallbackIfNeeded(callback, {'success': success});
    }
  }

  void _uploadFile(Map? map, String callback) async {
    String? localFile = Util.parseStr(map?['file']);

    if (Util.isStringEmpty(localFile)) {
      String retJson = json.encode({'success': false, 'msg': 'file is null'});
      _webViewController?.evaluateJavascript('$callback($retJson)');
      return;
    }

    OssUploadDataResp resp = await BaseRequestManager.getFileUploadUrl('audio');
    _showLoading(K.base_uploading);
    if (resp.success && resp.data != null) {
      bool result = await BaseRequestManager.uploadFile(resp.data!, File(localFile!));
      _hideLoading();
      if (result) {
        String filePath = BaseRequestManager.getOssFilePath(resp.data!.dir, File(localFile));
        String absolutePath = 'https://xs-voice.oss-cn-hangzhou.aliyuncs.com/$filePath';
        String retJson = json.encode({'success': true, 'msg': '', 'url': absolutePath});
        _webViewController?.evaluateJavascript('$callback($retJson)');
      } else {
        String msg = R.array('xhr_error_type_array')[6];
        Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
        String retJson = json.encode({'success': false, 'msg': msg});
        _webViewController?.evaluateJavascript('$callback($retJson)');
      }
    } else {
      _hideLoading();
      String retJson = json.encode({'success': false, 'msg': '${resp.msg}'});
      _webViewController?.evaluateJavascript('$callback($retJson)');
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  void _showLoading(String message) {
    if (_loadingController != null) {
      _loadingController?.setLabel(message);
      return;
    }

    _loadingController = DialogLoadingController();
    _loadingController?.show(context: context, message: message);
  }

  void _hideLoading() {
    if (_loadingController != null) {
      _loadingController?.close();
      _loadingController = null;
    }
  }

  void _evaluateCallbackIfNeeded(String? callback, Map map) {
    if (callback != null && callback.isNotEmpty) {
      String retJson = json.encode(map);
      _webViewController?.evaluateJavascript('$callback($retJson)');
    }
  }
}
