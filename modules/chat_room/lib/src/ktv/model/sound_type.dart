enum SoundType {
  voice, //原声
  accompany, //伴奏
}

class SongPlatform {
  static const String SLP = 'banban';

  @Deprecated('not used ')
  static const String KUGOU = 'zego'; // 老版本用的音速达、目前不适配

  @Deprecated('not used ')
  static const String AME = 'ame'; // 腾讯ame

  static const String AGORA = 'agora'; // 声网

  static const String ZEGO_V2 = 'zego_v2'; // zego 音集协

  static const String kugou_local = 'kugou';
}
