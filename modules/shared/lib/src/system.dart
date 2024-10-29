import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:shared/shared.dart';

class System {
  /// 服务器地址是否测试环境
  static bool isDevHost = false;

  /// 是否开发模式
  static bool debug = (Constant.isDevMode || kDebugMode);

  /// 全局context
  static BuildContext context = Constant.context;

  /// 主域名
  static String mainDomain = '';

  /// 端口号
  static String mainPort = '';

  static final Map<String, String> _customConfig = {};

  /// 更新某项配置
  static void updateConfig(String key, String value) {
    _customConfig[key] = value;
  }

  /// 替换配置
  static void replaceConfigs([Map<String, String>? configs]) {
    _customConfig.clear();
    if (configs != null) {
      _customConfig.addAll(configs);
    }
  }

  static String get _customPort => !Util.isStringEmpty(mainPort) ? ':$mainPort' : '';

  static String get ipCheckDomain => 'ipv4.$mainDomain';

  /// 接口主域名
  static String get domain => _customConfig['domain'] ?? 'https://api.$mainDomain$_customPort/';

  /// 数据上报url
  static String get dataDomain =>
      'https://data.$mainDomain:4432/'; // _customConfig['dataDomain'] ?? 'https://data.$mainDomain:4432/';

  /// 支付域名
  static String get payDomain => _customConfig['payDomain'] ?? 'https://pay.$mainDomain$_customPort/';

  /// h5页面域名
  static String getWebDomain(String prefix) => _customConfig['webDomain'] ?? 'https://$prefix.$mainDomain$_customPort';

  /// 房间socket兜底域名
  static String get webSocketDomain => _customConfig['webSocketDomain'] ?? 'wss://websocket.$mainDomain:6545';

  /// 图片域名,防止污染cdn,测试模式直接使用原始域名
  static String get imageDomain => Constant.isDevMode ? imageOriginDomain : imageProxyDomain;

  /// 图片cdn代理域名，一般来说图片都应该使用这个域名
  static String get imageProxyDomain => _customConfig['imageDomain'] ?? 'https://proxyimg.happyxq.cc.cn/';

  /// 图片原始域名
  static String get imageOriginDomain =>
      _customConfig['imageOriginDomain'] ?? 'https://bbpd-image.oss-cn-hangzhou.aliyuncs.com/';

  /// log上报域名
  static String get logDomain =>
      'https://log.$mainDomain$_customPort/'; //_customConfig['logDomain'] ?? 'https://log.$mainDomain$_customPort/';

  static String? _songDomain;

  /// 歌曲下载域名
  static String get songDomain {
    if (Util.isStringEmpty(_songDomain)) {
      _songDomain = AppConfig.getConfig(AppConfig.song_domain);
    }
    if (Util.isStringEmpty(_songDomain)) {
      _songDomain = 'https://bbpd-image.oss-cn-hangzhou.aliyuncs.com/';
    }
    return _songDomain!;
  }

  /// APP升级域名
  static String get upgradeDomain => 'http://121.40.113.132:80/';

  /// 分享域名
  static String get universalLinkDomain => 'https://page.happyxq.cc.cn';
}
