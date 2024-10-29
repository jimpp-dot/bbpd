import 'package:shared/shared.dart';

class KtvAccuseModel {
  int sid;
  String songName;
  String singerName;
  bool description;
  List<AccuseConfig> accuseConfig;

  KtvAccuseModel({
    required this.sid,
    required this.songName,
    required this.singerName,
    required this.description,
    required this.accuseConfig,
  });

  factory KtvAccuseModel.fromJson(Map<String, dynamic> json) {
    return KtvAccuseModel(
      sid: Util.parseInt(json["song_id"]),
      songName: Util.notNullStr(json["song_name"]),
      singerName: Util.notNullStr(json["singer_name"]),
      description: Util.parseBool(json["description"]),
      accuseConfig: Util.parseList(
          json["accuse_config"], (e) => AccuseConfig.fromJson(e)),
    );
  }
}

class AccuseConfig {
  int id;
  String name;
  List<AccuseItem> item;
  bool isExpanded = false;

  AccuseConfig({
    required this.id,
    required this.name,
    required this.item,
  });

  factory AccuseConfig.fromJson(Map<String, dynamic> json) {
    return AccuseConfig(
      id: Util.parseInt(json["id"]),
      name: Util.notNullStr(json["name"]),
      item: Util.parseList(json['item'], (e) => AccuseItem.fromJson(e)),
    );
  }
}

class AccuseItem {
  int id;
  String name;

  AccuseItem({
    required this.id,
    required this.name,
  });

  factory AccuseItem.fromJson(Map<String, dynamic> json) {
    return AccuseItem(
      id: Util.parseInt(json["id"]),
      name: Util.notNullStr(json["name"]),
    );
  }
}
