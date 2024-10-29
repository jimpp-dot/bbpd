import 'package:shared/shared.dart';

class TaskModel {
  bool success;
  Data? data;

  TaskModel({this.success = false, this.data});

  TaskModel.fromJson(Map<String, dynamic> json)
      : success = Util.parseBool(json['success']),
        data = json['data'] != null ? Data.fromJson(json['data']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'TaskModel{success: $success, data: $data}';
  }
}

class Data {
  List<Daily>? daily;
  String signUrl = '';

  Data({this.daily, this.signUrl = ''});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }

    signUrl = Util.notNullStr(json['_sign_url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
    }
    data['_sign_url'] = signUrl;
    return data;
  }

  @override
  String toString() {
    return 'Data{daily: $daily}';
  }
}

class Daily {
  int id;
  int type;
  String name;
  String desc;
  int award;
  String link;
  String icon;
  int credit;
  String awardIcon;

  Daily(
      {this.id = 0,
      this.type = 0,
      this.name = '',
      this.desc = '',
      this.award = 0,
      this.link = '',
      this.icon = '',
      this.credit = 0,
      this.awardIcon = ''});

  Daily.fromJson(Map<String, dynamic> json)
      : id = Util.parseInt(json['id']),
        type = Util.parseInt(json['type']),
        name = Util.notNullStr(json['name']),
        desc = Util.notNullStr(json['desc']),
        award = Util.parseInt(json['award']),
        link = Util.notNullStr(json['link']),
        icon = Util.notNullStr(json['icon']),
        credit = Util.parseInt(json['credit']),
        awardIcon = Util.notNullStr(json['award_icon']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['desc'] = desc;
    data['award'] = award;
    data['link'] = link;
    data['icon'] = icon;
    data['credit'] = credit;
    data['award_icon'] = awardIcon;
    return data;
  }

  @override
  String toString() {
    return 'Daily{id: $id, type: $type, name: $name, desc: $desc, award: $award, link: $link, icon:$icon, credit:$credit, awardIcon:$awardIcon}';
  }
}
