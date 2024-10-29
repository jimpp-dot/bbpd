import '../flutter_lyric.dart';

class Lyric {
  final String lyric;
  Duration startTime;
  Duration endTime;
  final bool isRemark;

  Lyric(
    this.lyric, {
    this.startTime = Duration.zero,
    this.endTime = Duration.zero,
    this.isRemark = false,
  });

  @override
  String toString() {
    return 'Lyric{lyric: $lyric, startTime: $startTime, endTime: $endTime}';
  }

  /// zego v2 音集协 构造歌词
  factory Lyric.fromJson(Map<String, dynamic> json) => Lyric(
        LyricUtil.parseStr(json['content']),
        startTime:
            Duration(milliseconds: LyricUtil.parseInt(json['begin_time'])),
        endTime: Duration(milliseconds: LyricUtil.parseInt(json['end_time'])),
      );
}
