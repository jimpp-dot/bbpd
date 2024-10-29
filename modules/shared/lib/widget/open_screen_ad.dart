import 'dart:async';
import 'dart:io';

import 'package:shared/assets.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import '../shared.dart';

const _debug = true;

void _log(String msg) {
  if (Constant.isDevMode && _debug) {
    Log.d('OpenScreenAd $msg');
  }
}

/// 开屏广告
/// 展示场景：
/// 1.应用启动，push这种本身带跳转的不展示广告；
/// 2.应用从后台到前台，距离上次展示广告>=30分钟；
///
class OpenScreenAd {
  static OverlayEntry? adOverlay;
  static int lastShowTime = 0;
  static int maxShowDurationInMilliSecs = 30 * 60 * 1000;

  static ResAdScreenAdV2? firstPrepareAd;

  /// 启动时加载广告
  static Future prepareFirst() async {
    ResAdScreenAdV2 resp = await _Repository.loadFromNetwork();
    _log('prepareFirst() resp=${firstPrepareAd?.toProto3Json()}');
    firstPrepareAd = resp;
    if (resp.success && resp.data.adType == AdScreenType.AdScreenBannerType) {
      prepareAd(adData: resp.data.adData);
    }
  }

  /// 预先加载广告资源
  static Future prepareAd({AdScreenAdData? adData}) async {
    if (adData == null) {
      ResAdScreenAdV2 rsp = await _Repository.loadFromNetwork();
      if (rsp.success && rsp.data.adType == AdScreenType.AdScreenBannerType) {
        adData = rsp.data.adData;
      }
    }
    if (adData == null) return;
    if (adData.image.isNotEmpty) {
      DownloadManager.downloadImage(Util.getRemoteImgUrl(adData.image));
      _log('prepareAd() download different image');
    }
  }

  /// 尝试展示广告
  static void launch(BuildContext context, {bool appLaunch = false}) async {
    if (!Session.isLogined) return;
    ResAdScreenAdV2? rsp;
    if (appLaunch == true) {
      rsp = firstPrepareAd;
      String? schemeUrl = await getSchemeUrl();
      if (schemeUrl != null && schemeUrl.isNotEmpty) {
        _log('launch() scheme url is not empty');
        return;
      }
    } else {
      rsp = await _Repository.loadFromNetwork();
    }
    if (rsp == null) return;
    _log(
        'launch() loadFromNetwork appLaunch=$appLaunch, rsp=${rsp.toProto3Json()}');
    if (!rsp.success) return;
    AdScreenData data = rsp.data;
    Widget? widget;

    if (data.adType == AdScreenType.AdScreenBannerType) {
      /// 开屏广告
      AdScreenAdData adData = data.adData;
      if (adData.image.isNotEmpty) {
        File file = DownloadManager.getDownloadFileByUrl(adData.image);
        _log('launch() exist: ${file.existsSync()}');
        if (!file.existsSync()) return;
        widget = OpenScreenAdWidget(adData, file);
      }
    } else if (data.adType == AdScreenType.AdScreenAudioType && appLaunch) {
      /// 启动音
      IProfileManager profileManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PROFILE);
      widget = profileManager
          .getLaunchAudioPlayPage(data.audioData, data.audioData.duration, () {
        hide();
      });
    }
    if (widget == null) return;
    if (Session.isLogined) {
      int now = DateTime.now().millisecondsSinceEpoch;
      if (now - lastShowTime < maxShowDurationInMilliSecs) {
        _log('launch() before the time');
        return;
      }
    }
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (roomManager.getRid() > 0) {
      /// 在房间，不展示广告
      _log('launch()  in room');
      return;
    }
    hide();
    var overlayState = Overlay.of(System.context);
    lastShowTime = DateTime.now().millisecondsSinceEpoch;
    adOverlay = OverlayEntry(builder: (context) {
      return widget!;
    });

    overlayState.insert(adOverlay!);
  }

  static Future<String?> getSchemeUrl() async {
    String? initialLink;
    try {
      if (Util.isAndroid) {
        initialLink = await getLatestLink();
      } else {
        initialLink = await getInitialLink();
      }
    } on PlatformException {
      _log('getSchemeUrl() PlatformException');
    } on FormatException {
      _log('getSchemeUrl() FormatException');
    }

    return initialLink;
  }

  static int _launchAudioMessageId = 0;

  /// 播放启动音
  static Future playLaunchAudio(
      String audioUrl, int duration, int messageId) async {
    _launchAudioMessageId = messageId;
    AudioPlay.instance()
        .play(audioUrl, duration, messageId: _launchAudioMessageId);
  }

  /// 停止播放启动音
  static Future stopLaunchAudio() async {
    if (_launchAudioMessageId == 0) return;
    AudioPlay.instance().stop(messageId: _launchAudioMessageId);
    _launchAudioMessageId = 0;
  }

  static hide() {
    adOverlay?.remove();
    adOverlay = null;
  }
}

class OpenScreenAdWidget extends StatefulWidget {
  final AdScreenAdData ad;
  final File imageFile;

  const OpenScreenAdWidget(this.ad, this.imageFile, {super.key});

  @override
  _OpenScreenAdWidgetState createState() => _OpenScreenAdWidgetState();
}

class _OpenScreenAdWidgetState extends State<OpenScreenAdWidget> {
  /// 底部app logo 高度
  double get _bottomHeight => Util.iphoneXBottom + 100;

  AdScreenAdData get _ad => widget.ad;

  _onAdTaped() {
    if (_ad.url.isEmpty) return;
    OpenScreenAd.hide();
    String url = SchemeUrlHelper.instance()
        .concatSchemeUrl(_ad.url, SchemeUrlHelper.scheme_path_open_screen_ad);
    SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, url,
        fromPage: SchemeUrlHelper.scheme_path_open_screen_ad);
    _reportBannerClick(_ad.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            _renderAd(),
            _countDownButton(),
            if (!Util.isStringEmpty(_ad.url)) _buildJumpBtn(),
            _logo(),
          ],
        ),
      ),
    );
  }

  /// 构建广告
  Widget _renderAd() => Container(
      color: R.color.mainBgColor,
      margin: EdgeInsetsDirectional.only(bottom: _bottomHeight),
      child: Image.file(
        widget.imageFile,
        width: Util.width,
        height: Util.height,
        fit: BoxFit.fill,
      ));

  Widget _buildJumpBtn() => Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: GestureDetector(
          onTap: _onAdTaped,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(bottom: _bottomHeight + 40),
                height: 52,
                width: 250,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.7), width: 1),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.core_enter_detail_page,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );

  /// App logo
  Widget _logo() => Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
          color: R.color.mainBgColor,
          height: _bottomHeight,
          padding: const EdgeInsetsDirectional.only(top: 20),
          alignment: AlignmentDirectional.topCenter,
          child: SizedBox(
            width: 177,
            height: 60,

            /// 使用MultiframeImage代替R.img（Image.asset）方式加载，
            /// 因为Image.asset初次加载需要load AssetManifest.json，比较耗时影响体验
            child: MultiframeImage.asset(
              R.imagePath(BaseAssets.ic_ad_logo_webp,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
          ),
        ),
      );

  /// 右上角倒计时按钮
  Widget _countDownButton() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        onTap: () {
          _cancelTask();
          OpenScreenAd.hide();
        },
        child: Container(
          height: 30,
          margin: const EdgeInsetsDirectional.only(top: 40, end: 16),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.4),
            shape: const StadiumBorder(side: BorderSide(color: Colors.white)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 13),
              Text(
                K.base_skip,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 4),
              Text(
                '$_countDown',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    color: R.color.brightTextColor,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 13),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    _countDown =
        Util.parseInt(_ad.duration) > 0 ? Util.parseInt(_ad.duration) : 3;
    super.initState();
    _startCountDownTask();
    Tracker.instance.track(TrackEvent.open_exposure);
  }

  @override
  void dispose() {
    _cancelTask();
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  int _countDown = 0;
  Timer? _timer;

  /// 开始倒计时任务
  void _startCountDownTask() {
    _cancelTask();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countDown -= 1;
      if (_countDown <= 0) {
        _cancelTask();
        if (mounted) OpenScreenAd.hide();
      } else {
        if (mounted) setState(() {});
      }
    });
  }

  void _cancelTask() {
    if (_timer == null) return;
    if (_timer!.isActive) _timer?.cancel();
    _timer = null;
  }

  void _reportBannerClick(String id) async {
    Tracker.instance.track(TrackEvent.banner_click, properties: {
      'adid': id,
      'banner_position': 'splash',
    });
  }
}

/// 开屏广告数据仓库
class _Repository {
  _Repository._();

  /// 从网络接口加载广告信息
  static Future<ResAdScreenAdV2> loadFromNetwork() async {
    String url = '${System.domain}go/yy/home/screenAdV2';
    try {
      XhrResponse response =
          await Xhr.get(url, pb: true, throwOnError: false, timeout: 2);
      return ResAdScreenAdV2.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAdScreenAdV2(msg: e.toString(), success: false);
    }
  }
}
