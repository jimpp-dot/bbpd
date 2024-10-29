import 'package:commonrtc_api/commonrtc_api.dart';

class VoiceProfile {
  final double pitch;
  final List<double> equalization;

  VoiceProfile(this.pitch, this.equalization)
      : assert(equalization.length == 10);

  static VoiceProfile? getProfile(int effect, int? rtcType) {
    if (RtcBizConfig.rtcTypeZego == rtcType) {
      return _getZegoProfile(effect);
    } else if (RtcBizConfig.rtcTypeTencent == rtcType) {
      return _getTencentProfile(effect);
    }
    return _getAgoraProfile(effect);
  }

  static VoiceProfile? _getAgoraProfile(int effect) {
    if (effect == 0) {
      return reset;
    } else if (effect == 1) {
      return ruHua;
    } else if (effect == 2) {
      return sausageLips;
    } else if (effect == 3) {
      return xiongEr;
    } else if (effect == 4) {
      return pigKing;
    } else if (effect == 5) {
      return mystery;
    } else {
      return null;
    }
  }

  static VoiceProfile? _getZegoProfile(int effect) {
    if (effect == 0) {
      return resetZego;
    } else if (effect == 1) {
      return ruHuaZego;
    } else if (effect == 2) {
      return sausageLipsZego;
    } else if (effect == 3) {
      return xiongErZego;
    } else if (effect == 4) {
      return pigKingZego;
    } else if (effect == 5) {
      return mysteryZego;
    } else {
      return null;
    }
  }

  static VoiceProfile? _getTencentProfile(int effect) {
    if (effect == 0) {
      return resetTencent;
    } else if (effect == 1) {
      return ruHuaTencent;
    } else if (effect == 2) {
      return sausageLipsTencent;
    } else if (effect == 3) {
      return xiongErTencent;
    } else if (effect == 4) {
      return pigKingTencent;
    } else if (effect == 5) {
      return mysteryTencent;
    } else {
      return null;
    }
  }

  // 原声
  static VoiceProfile reset = VoiceProfile(1.0, List.filled(10, 0));
  static VoiceProfile resetZego = VoiceProfile(0, List.filled(10, 0));
  static VoiceProfile resetTencent = VoiceProfile(0, List.filled(10, 0));

  // 如花变声
  static VoiceProfile ruHua =
      VoiceProfile(1.45, [10, 6, 1, 1, -6, 13, 7, -14, 13, -13]);
  static VoiceProfile ruHuaZego =
      VoiceProfile(4.23, [0, 0, -2, -10, 1, 0, 7, 9, 3, 11]);
  static VoiceProfile ruHuaTencent =
      VoiceProfile(0.5, [0, 0, -2, -10, 1, 0, 7, 9, 3, 11]);

  // 香肠嘴变声
  static VoiceProfile sausageLips =
      VoiceProfile(0.757836, [0, -2, -3, 3, 6, -8, -3, 7, 5, 2]);
  static VoiceProfile sausageLipsZego =
      VoiceProfile(-4, [0, -2, -3, 3, 6, -8, -3, 7, 5, 2]);
  static VoiceProfile sausageLipsTencent =
      VoiceProfile(-0.5, [0, -2, -3, 3, 6, -8, -3, 7, 5, 2]);

  // 熊二变声
  static VoiceProfile xiongEr =
      VoiceProfile(0.595844, [-6, 5, 1, 8, 3, 0, 0, 0, 10, -3]);
  static VoiceProfile xiongErZego =
      VoiceProfile(-6.08, [-6, 5, 1, 8, 3, 0, 0, 0, 10, -3]);
  static VoiceProfile xiongErTencent =
      VoiceProfile(-0.76, [-6, 5, 1, 8, 3, 0, 0, 0, 10, -3]);

  // 猪八戒变声
  static VoiceProfile pigKing =
      VoiceProfile(0.522637, [4, 6, 2, 7, 2, 0, 6, 7, 0, 3]);
  static VoiceProfile pigKingZego =
      VoiceProfile(-7.637808, [4, 6, 2, 7, 2, 0, 6, 7, 0, 3]);
  static VoiceProfile pigKingTencent =
      VoiceProfile(-0.95, [4, 6, 2, 7, 2, 0, 6, 7, 0, 3]);

  // 非诚勿扰神秘人变声
  static VoiceProfile mystery = VoiceProfile(1.350127, List.filled(10, 0));
  static VoiceProfile mysteryZego =
      VoiceProfile(2.28, [0, 0, 8, 3, -4, 0, 11, -2, 3, 2]);
  static VoiceProfile mysteryTencent =
      VoiceProfile(0.285, [0, 0, 8, 3, -4, 0, 11, -2, 3, 2]);
}
