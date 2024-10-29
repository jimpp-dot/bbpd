import 'dart:typed_data';

///混响配置项
class ExportReverbItem {
  String name;
  int type;
  String icon;
  int value;

  ExportReverbItem(this.name, this.type, this.icon, this.value);
}

/// 静音状态的填充数据
class ExportMuteAudioDataMark {
  Uint8List data;
  int sampleRate;
  int channels;
  int samples;

  /// 构建一个同输入源的数据，但是data数据都是0，代表静音数据
  ExportMuteAudioDataMark.detectSize({
    required Uint8List data,
    required this.sampleRate,
    required this.channels,
    required this.samples,
  }) : data = Uint8List(data.length);

  @override
  String toString() {
    return 'MuteAudioDataMark{data.size: ${data.length}, sampleRate: $sampleRate, channels: $channels, samples: $samples}';
  }
}
