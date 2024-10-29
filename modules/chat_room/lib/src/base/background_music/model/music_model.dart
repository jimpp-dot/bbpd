import 'package:shared/shared.dart';

class Music implements Comparable<Music> {
  /// 音乐类型
  static const String kugou = 'kugou';
  static const String zego_v2 = 'zego_v2';

  final int id;

  /// 音乐类型
  final String type;
  final String name;
  final String path;
  final String author;
  int dateline;

  /// 酷狗音乐下载hash值
  final String hash;

  /// zego版权音乐id
  final String musicId;

  Music(
    this.id,
    this.type,
    this.name,
    this.path,
    this.dateline, {
    this.musicId = '',
    this.author = '',
    this.hash = '',
  });

  Music copy() {
    return Music(id, type, name, path, dateline,
        musicId: musicId, author: author);
  }

  String get key {
    return '$type.$id';
  }

  bool get isZegoMusic => Music.zego_v2 == type;

  bool get isLocalMusic => Music.zego_v2 != type;

  @override
  int compareTo(Music other) => other.dateline.compareTo(dateline);

  factory Music.fromJson(Map<String, dynamic> data) => Music(
        Util.parseInt(data['id']),
        (data['type'] == null || data['type'].toString().isEmpty)
            ? 'xiami'
            : data['type'],
        data['name'] ?? '',
        data['path'] ?? '',
        Util.parseInt(data['dateline']),
      );

  factory Music.fromZego(Map<String, dynamic> data) => Music(
        Util.parseInt(data['id']),
        Music.zego_v2,
        data['name'] ?? '',
        '',
        Util.parseInt(data['dateline']),
        musicId: data['musicId'] ?? '',
      );

  @override
  String toString() => 'type:$type, id:$id, name:$name, musicId:$musicId';
}
