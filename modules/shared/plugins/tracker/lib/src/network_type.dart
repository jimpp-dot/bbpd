/// 在哪些网络环境下可以上报数据
class NetworkType {
  final int type;

  const NetworkType._(this.type);

  /// 默认设置，在3G、4G、Wifi状态下上报数据
  static const NetworkType DEFAULT = NetworkType._(0);

  /// 只在Wifi状态下上报数据
  static const NetworkType WIFI = NetworkType._(1);

  /// 在2G、3G、4G、Wifi等所有网络状态下都可上报数据
  static const NetworkType ALL = NetworkType._(2);
}
