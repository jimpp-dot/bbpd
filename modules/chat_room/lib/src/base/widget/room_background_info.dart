class RoomBackGroundInfo {
  final RoomBackGroundType type;
  final String url;
  final String? decorate; // 背景配套的装饰
  final bool? needSilent; // 视频背景是否静音
  RoomBackGroundInfo({required this.type, this.url = '', this.decorate, this.needSilent = false});
}

enum RoomBackGroundType {
  jpg,
  mp4,
}
